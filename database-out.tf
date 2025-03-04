output "aurora_sg_id" {
  description = "ID do security group do Aurora"
  value       = aws_security_group.aurora_sg.id
}

output "aurora_sg_name" {
  description = "Subnet group name of Aurora"
  value       = aws_db_subnet_group.aurora_subnet_group.name
}