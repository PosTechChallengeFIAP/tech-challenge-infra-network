output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "security_group_id" {
  value = aws_security_group.allow_all.id
}

output "aurora_security_group_id" {
  description = "ID do security group do Aurora"
  value       = aws_security_group.aurora_sg.id
}

output "aurora_subnet_group_name" {
  description = "Subnet group name of Aurora"
  value       = aws_db_subnet_group.aurora_subnet_group.name
}