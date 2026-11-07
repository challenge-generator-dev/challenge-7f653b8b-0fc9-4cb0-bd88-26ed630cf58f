# Declaración de variables globales utilizadas en la configuración de Terraform.
# Estas variables serán utilizadas en los módulos de red y cómputo.

variable "region" {
  description = "La región de AWS donde se aprovisionará la infraestructura."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "El ambiente en el que se desplegará la infraestructura (dev, prod, etc.)."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "El bloque CIDR para la VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "instance_type" {
  description = "El tipo de instancia EC2 para el servicio de notificaciones."
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "El ID de la AMI para las instancias EC2."
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
}

variable "key_name" {
  description = "El nombre de la clave SSH para acceder a las instancias."
  type        = string
  default     = "notifications-key"
}

variable "min_size" {
  description = "El tamaño mínimo del grupo de autoescalado."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "El tamaño máximo del grupo de autoescalado."
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "La capacidad deseada del grupo de autoescalado."
  type        = number
  default     = 2
}