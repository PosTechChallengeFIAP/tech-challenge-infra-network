output "api_public_subnet_id" {
  value = aws_subnet.api.id
}

output "api_sg_id" {
  value = aws_security_group.api.id
}