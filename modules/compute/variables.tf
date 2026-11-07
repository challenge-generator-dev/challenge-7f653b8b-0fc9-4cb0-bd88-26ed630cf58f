# Declaración de variables específicas del módulo de cómputo.
# Estas variables serán utilizadas para configurar el cómputo del servicio de notificaciones.

variable "instance_type" {
  description = "El tipo de instancia EC2 para el servicio de notificaciones."
  type        = string
}

variable "ami_id" {
  description = "El ID de la AMI para las instancias EC2."
  type        = string
}

variable "key_name" {
  description = "El nombre de la clave SSH para acceder a las instancias."
  type        = string
}

variable "min_size" {
  description = "El tamaño mínimo del grupo de autoescalado."
  type        = number
}

variable "max_size" {
  description = "El tamaño máximo del grupo de autoescalado."
  type        = number
}

variable "desired_capacity" {
  description = "La capacidad deseada del grupo de autoescalado.
  type        = number
}

variable "vpc_id" {
  description = "El ID de la VPC donde se desplegarán las instancias."
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde se desplegarán las instancias."
  type        = list(string)
}

variable "environment" {
  description = "El ambiente en el que se desplegará la infraestructura (dev, prod, etc.)."
  type        = string
}

variable "security_group_id" {
  description = "El ID del grupo de seguridad para las instancias."
  type        = string
}