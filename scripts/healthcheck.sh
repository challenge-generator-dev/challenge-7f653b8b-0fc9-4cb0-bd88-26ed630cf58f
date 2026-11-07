#!/bin/bash
# ==============================================================================
# Script de verificación de estado de recursos aprovisionados
# Este script valida que la infraestructura desplegada esté operativa
# ==============================================================================

set -euo pipefail

# ------------------------------------------------------------------------------
# Configuración inicial
# ------------------------------------------------------------------------------
REGION="${AWS_REGION:-us-east-1}"
ENVIRONMENT="${ENVIRONMENT:-dev}"
VPC_NAME="notificaciones-vpc-${ENVIRONMENT}"
INSTANCE_NAME="notificaciones-compute-${ENVIRONMENT}"
TIMEOUT=30
INTERVAL=5

# Colores para输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ------------------------------------------------------------------------------
# Funciones de utilidad
# ------------------------------------------------------------------------------
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

check_aws_credentials() {
    log_info "Verificando credenciales de AWS..."
    if ! aws sts get-caller-identity &>/dev/null; then
        log_error "Credenciales de AWS no configuradas o inválidas"
        return 1
    fi
    local account_id
    account_id=$(aws sts get-caller-identity --query 'Account' --output text)
    log_info "Credenciales válidas. Cuenta: ${account_id}, Región: ${REGION}"
}

# ------------------------------------------------------------------------------
# Verificación de recursos de red
# -------------------------------------------------------------------------------
check_vpc() {
    log_info "Verificando VPC..."
    
    local vpc_id
    vpc_id=$(aws ec2 describe-vpcs \
        --filters "Name=tag:Name,Values=${VPC_NAME}" \
        --query 'Vpcs[0].VpcId' \
        --output text 2>/dev/null || echo "NOT_FOUND")
    
    if [[ "${vpc_id}" == "NOT_FOUND" || -z "${vpc_id}" ]]; then
        log_error "VPC '${VPC_NAME}' no encontrada"
        return 1
    fi
    
    local vpc_state
    vpc_state=$(aws ec2 describe-vpcs \
        --vpc-ids "${vpc_id}" \
        --query 'Vpcs[0].State' \
        --output text)
    
    if [[ "${vpc_state}" != "available" ]]; then
        log_error "VPC no está en estado 'available': ${vpc_state}"
        return 1
    fi
    
    log_info "VPC '${vpc_id}' verificada correctamente (estado: ${vpc_state})"
    echo "VPC_ID=${vpc_id}"
    return 0
}

check_subnets() {
    local vpc_id="$1"
    log_info "Verificando subnets..."
    
    local subnet_count
    subnet_count=$(aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(Subnets)' \
        --output text)
    
    if [[ "${subnet_count}" -lt 2 ]]; then
        log_error "Se requieren al menos 2 subnets, encontradas: ${subnet_count}"
        return 1
    fi
    
    local available_subnets
    available_subnets=$(aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=${vpc_id}" "Name=state,Values=available" \
        --query 'length(Subnets)' \
        --output text)
    
    if [[ "${available_subnets}" -lt 2 ]]; then
        log_error "No hay suficientes subnets disponibles: ${available_subnets}"
        return 1
    fi
    
    log_info "Subnets verificadas: ${available_subnets} disponibles de ${subnet_count} totales"
    return 0
}

check_security_groups() {
    local vpc_id="$1"
    log_info "Verificando security groups..."
    
    local sg_count
    sg_count=$(aws ec2 describe-security-groups \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(SecurityGroups)' \
        --output text)
    
    if [[ "${sg_count}" -lt 1 ]]; then
        log_error "No se encontraron security groups en la VPC"
        return 1
    fi
    
    log_info "Security groups encontrados: ${sg_count}"
    return 0
}

check_internet_gateway() {
    local vpc_id="$1"
    log_info "Verificando Internet Gateway..."
    
    local igw_id
    igw_id=$(aws ec2 describe-internet-gateways \
        --filters "Name=attachment.vpc-id,Values=${vpc_id}" \
        --query 'InternetGateways[0].InternetGatewayId' \
        --output text 2>/dev/null || echo "NOT_FOUND")
    
    if [[ "${igw_id}" == "NOT_FOUND" || -z "${igw_id}" ]]; then
        log_error "Internet Gateway no asociado a la VPC"
        return 1
    fi
    
    log_info "Internet Gateway '${igw_id}' verificado correctamente"
    return 0
}

# ------------------------------------------------------------------------------
# Verificación de recursos de cómputo
# -------------------------------------------------------------------------------
check_ec2_instances() {
    log_info "Verificando instancias EC2..."
    
    local instance_count
    instance_count=$(aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=${INSTANCE_NAME}" \
        --query 'length(Reservations[].Instances[])' \
        --output text)
    
    if [[ "${instance_count}" -eq 0 ]]; then
        log_warn "No se encontraron instancias EC2 con nombre '${INSTANCE_NAME}'"
        return 0
    fi
    
    local instance_ids
    instance_ids=$(aws ec2 describe-instances \
        --filters "Name=tag:Name,Values=${INSTANCE_NAME}" \
        --query 'Reservations[].Instances[].InstanceId' \
        --output text)
    
    for instance_id in ${instance_ids}; do
        local instance_state
        instance_state=$(aws ec2 describe-instances \
            --instance-ids "${instance_id}" \
            --query 'Reservations[0].Instances[0].State.Name' \
            --output text)
        
        if [[ "${instance_state}" != "running" ]]; then
            log_warn "Instancia ${instance_id} en estado: ${instance_state}"
        else
            log_info "Instancia ${instance_id} en estado: ${instance_state}"
        fi
    done
    
    return 0
}

check_elastic_ips() {
    log_info "Verificando Elastic IPs..."
    
    local eip_count
    eip_count=$(aws ec2 describe-addresses \
        --filters "Name=tag:Environment,Values=${ENVIRONMENT}" \
        --query 'length(Addresses)' \
        --output text)
    
    log_info "Elastic IPs asociados al entorno '${ENVIRONMENT}': ${eip_count}"
    return 0
}

check_load_balancer() {
    log_info "Verificando Load Balancer..."
    
    local lb_count
    lb_count=$(aws elbv2 describe-load-balancers \
        --query 'length(LoadBalancers)' \
        --output text)
    
    if [[ "${lb_count}" -gt 0 ]]; then
        local lb_arn
        lb_arn=$(aws elbv2 describe-load-balancers \
            --query 'LoadBalancers[0].LoadBalancerArn' \
            --output text)
        
        local lb_state
        lb_state=$(aws elbv2 describe-load-balancers \
            --load-balancer-arns "${lb_arn}" \
            --query 'LoadBalancers[0].State.Code' \
            --output text)
        
        if [[ "${lb_state}" == "active" ]]; then
            log_info "Load Balancer activo: ${lb_arn}"
        else
            log_warn "Load Balancer en estado: ${lb_state}"
        fi
    else
        log_warn "No se encontró Load Balancer"
    fi
    
    return 0
}

# ------------------------------------------------------------------------------
# Verificación de conectividad
# -------------------------------------------------------------------------------
check_connectivity() {
    local vpc_id="$1"
    log_info "Verificando conectividad de red..."
    
    # Verificar que las subnets tienen rutas hacia internet
    local route_table_count
    route_table_count=$(aws ec2 describe-route-tables \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'length(RouteTables)' \
        --output text)
    
    if [[ "${route_table_count}" -lt 1 ]]; then
        log_error "No se encontraron route tables para la VPC"
        return 1
    fi
    
    log_info "Route tables verificadas: ${route_table_count}"
    
    # Verificar que existe al menos una ruta hacia Internet Gateway
    local has_igw_route
    has_igw_route=$(aws ec2 describe-route-tables \
        --filters "Name=vpc-id,Values=${vpc_id}" \
        --query 'RouteTables[].Routes[?DestinationCidrBlock==`0.0.0.0/0` && GatewayId!=`local`].GatewayId' \
        --output text | wc -w)
    
    if [[ "${has_igw_route}" -lt 1 ]]; then
        log_warn "No se encontró ruta por defecto (0.0.0.0/0) hacia Internet Gateway"
    else
        log_info "Ruta hacia Internet Gateway configurada correctamente"
    fi
    
    return 0
}

# ------------------------------------------------------------------------------
# Verificación de estado general de salud
# -------------------------------------------------------------------------------
verify_overall_health() {
    local vpc_id="$1"
    log_info "=========================================="
    log_info "Verificación de salud de infraestructura"
    log_info "=========================================="
    log_info "Entorno: ${ENVIRONMENT}"
    log_info "Región: ${REGION}"
    log_info "VPC: ${vpc_id}"
    log_info "=========================================="
    
    local failed_checks=0
    
    # Verificaciones de red
    check_subnets "${vpc_id}" || ((failed_checks++))
    check_security_groups "${vpc_id}" || ((failed_checks++))
    check_internet_gateway "${vpc_id}" || ((failed_checks++))
    check_connectivity "${vpc_id}" || ((failed_checks++))
    
    # Verificaciones de cómputo
    check_ec2_instances || ((failed_checks++))
    check_elastic_ips || ((failed_checks++))
    check_load_balancer || ((failed_checks++))
    
    echo ""
    log_info "=========================================="
    if [[ "${failed_checks}" -eq 0 ]]; then
        log_info "Resultado: TODAS LAS VERIFICACIONES PASARON"
        log_info "=========================================="
        return 0
    else
        log_error "Resultado: ${failed_checks} VERIFICACIONES FALLARON"
        log_error "=========================================="
        return 1
    fi
}

# ------------------------------------------------------------------------------
# Punto de entrada principal
# -------------------------------------------------------------------------------
main() {
    log_info "Iniciando healthcheck de infraestructura..."
    
    # Verificar credenciales
    check_aws_credentials || exit 1
    
    # Verificar VPC
    local vpc_output
    vpc_output=$(check_vpc) || exit 1
    
    local vpc_id
    vpc_id=$(echo "${vpc_output}" | grep "VPC_ID=" | cut -d'=' -f2)
    
    # Ejecutar verificación completa
    verify_overall_health "${vpc_id}"
    
    if [[ $? -eq 0 ]]; then
        log_info "Healthcheck completado exitosamente"
        exit 0
    else
        log_error "Healthcheck completado con errores"
        exit 1
    fi
}

# Ejecutar función principal
main "$@"