output "lambda_private_subnet_id" {
    value = aws_subnet.private_lambda.id
}

output "lambda_sg_id" {
    value = aws_security_group.lambda.id
}