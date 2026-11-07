# Valores de variables para el ambiente de producción
# Configuración con alta disponibilidad y mayor capacidad

environment = "prod"

# Región de AWS para producción
aws_region = "us-east-1"

# Tipo de instancia para producción (mayor capacidad)
instance_type = "t3.medium"

# Configuración de red - IDs de VPC y subnets en producción
vpc_id     = "vpc-yyyyyyyy"
subnet_ids = ["subnet-zzzzzzzz", "subnet-aaaaaaaa"]

# Configuración del servicio de notificaciones
service_name = "notification-service"
environment_name = "production"

# Configuración de seguridad - más restrictiva para producción
allowed_cidr_blocks = ["10.0.0.0/8"]

# Tags específicos para producción
common_tags = {
  Environment = "production"
  Project     = "notification-service"
  ManagedBy   = "terraform"
  CostCenter  = "notifications-team"
  Compliance  = "required"
}