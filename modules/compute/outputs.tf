# Outputs del módulo de cómputo
# Superficie de práctica: completar con los outputs de los recursos creados

# Output: ID de la instancia EC2
output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.notification_service.id
}

# Output: IP privada de la instancia
output "private_ip" {
  description = "IP privada de la instancia"
  value       = aws_instance.notification_service.private_ip
}

# Output: IP pública de la instancia (si aplica)
output "public_ip" {
  description = "IP pública de la instancia"
  value       = aws_instance.notification_service.public_ip
}