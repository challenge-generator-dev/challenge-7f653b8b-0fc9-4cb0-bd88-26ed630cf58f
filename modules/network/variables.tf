# Declaración de variables específicas del módulo de red.
# Estas variables serán utilizadas para configurar la red del servicio de notificaciones.

variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas."
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas."
  type        = list(string)
}

variable "environment" {
  description = "El ambiente en el que se desplegará la infraestructura (dev, prod, etc.)."
  type        = string
}

variable "region" {
  description = "La región de AWS donde se aprovisionará la infraestructura."
  type        = string
}