# Configuración de los proveedores de Terraform con versiones flexibles.
# Este archivo define los proveedores requeridos y sus versiones.

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS.
provider "aws" {
  region = var.region

  # Configuración de tags por defecto para todos los recursos.
  default_tags {
    tags = {
      Environment = var.environment
      Terraform   = "true"
      Service     = "notifications"
    }
  }
}

# Validación de la región proporcionada.
locals {
  valid_regions = [
    "us-east-1", "us-west-1", "us-west-2", "eu-west-1",
    "eu-central-1", "ap-southeast-1", "ap-northeast-1"
  ]

  # Validación de que la región proporcionada es válida.
  region_validation = contains(local.valid_regions, var.region) ? null : file("ERROR: La región proporcionada no es válida.")
}

# Validación del ambiente proporcionado.
locals {
  valid_environments = ["dev", "staging", "prod"]

  # Validación de que el ambiente proporcionado es válido.
  environment_validation = contains(local.valid_environments, var.environment) ? null : file("ERROR: El ambiente proporcionado no es válido.")
}