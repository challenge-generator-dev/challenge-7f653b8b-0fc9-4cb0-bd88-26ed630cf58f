# Valores deVariables para el ambiente de desarrollo
# Configuración específica para pruebas y desarrollo

environment = "dev"

# Región de AWS para desarrollo
aws_region = "us-east-1"

# Tipo de instancia para desarrollo (más económica)
instance_type = "t3.micro"

# Configuración de red - IDs de VPC y subnets creadas en el módulo network
vpc_id     = "vpc-xxxxxxxx"
subnet_ids = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]

# Configuración del servicio de notificaciones
service_name = "notification-service"
environment_name = "development"

# Configuración de seguridad
allowed_cidr_blocks = ["10.0.0.0/16"]

# Tags específicos para desarrollo
common_tags = {
  Environment = "development"
  Project     = "notification-service"
  ManagedBy   = "terraform"
}