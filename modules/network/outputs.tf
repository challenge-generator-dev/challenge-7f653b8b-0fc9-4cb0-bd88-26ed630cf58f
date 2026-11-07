# ------------------------------------------------------------
# Outputs del módulo de red
# Exponen IDs y ARNs de recursos creados para consumo
# ------------------------------------------------------------

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.notification_vpc.id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = aws_vpc.notification_vpc.cidr_block
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.notification_igw.id
}

output "public_subnet_ids" {
  description = "IDs de las subredes públicas"
  value       = aws_subnet.public_subnets[*].id
}

output "public_subnet_arns" {
  description = "ARNs de las subredes públicas"
  value       = aws_subnet.public_subnets[*].arn
}

output "route_table_public_id" {
  description = "ID de la tabla de rutas pública"
  value       = aws_route_table.public_rt.id
}