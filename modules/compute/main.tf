terraform {
  required_version = ">= 1.5"
}

# ------------------------------------------------------------
# Configuración de cómputo para el servicio de notificaciones
# Módulo que aprovisiona instancias EC2 y grupos de seguridad
# ------------------------------------------------------------

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t3.medium"
}

variable "ami_id" {
  description = "ID de la AMI para las instancias"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se aprovisionarán las instancias"
  type        = string
}

variable "subnet_ids" {
  description = "IDs de las subredes donde se aprovisionarán las instancias"
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

variable "key_name" {
  description = "Nombre del par de claves SSH"
  type        = string
  default     = ""
}

variable "instance_count" {
  description = "Número de instancias a crear"
  type        = number
  default     = 2
}

# Grupo de seguridad para el servicio de notificaciones
resource "aws_security_group" "notification_sg" {
  name        = "${var.project_name}-sg-${var.environment}"
  description = "Grupo de seguridad para el servicio de notificaciones"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    description = "Salida a Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-sg-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Instancias EC2 para el servicio de notificaciones
resource "aws_instance" "notification_instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_ids[count.index % length(var.subnet_ids)]

  vpc_security_group_ids = [aws_security_group.notification_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.project_name}-instance-${count.index + 1}-${var.environment}"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Grupo de Auto Scaling
resource "aws_launch_template" "notification_lt" {
  name_prefix   = "${var.project_name}-lt-${var.environment}"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.notification_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "${var.project_name}-lt-${var.environment}"
      Environment = var.environment
      Project     = var.project_name
    }
  }
}