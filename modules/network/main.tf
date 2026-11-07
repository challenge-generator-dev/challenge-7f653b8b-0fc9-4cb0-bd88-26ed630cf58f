terraform {
  required_version = ">= 1.5"
}

# ------------------------------------------------------------
# Configuración de red para el servicio de notificaciones
# Módulo que aprovisiona VPC, subredes y recursos de red
# ------------------------------------------------------------

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "availability_zones" {
  description = "Zonas de disponibilidad para las subredes"
  type        = list(string)
}

variable "environment" {
  description = "Entorno de despliegue (dev, prod)"
  type        = string
}

variable "project_name" {
  description = "Nombre del proyecto para etiquetado"
  type        = string
}

# VPC del servicio de notificaciones
resource "aws_vpc" "notification_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "${var.project_name}-vpc-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Internet Gateway para acceso externo
resource "aws_internet_gateway" "notification_igw" {
  vpc_id = aws_vpc.notification_vpc.id

  tags = {
    Name        = "${var.project_name}-igw-${var.environment}"
    Environment = var.environment
  }
}

# Tabla de rutas pública
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.notification_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.notification_igw.id
  }

  tags = {
    Name        = "${var.project_name}-public-rt-${var.environment}"
    Environment = var.environment
  }
}

# Subredes públicas
resource "aws_subnet" "public_subnets" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.notification_vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name        = "${var.project_name}-public-subnet-${count.index + 1}-${var.environment}"
    Environment = var.environment
    Type        = "public"
  }
}

# Asociación de subredes públicas con tabla de rutas
resource "aws_route_table_association" "public_associations" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}