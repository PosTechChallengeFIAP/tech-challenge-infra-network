output "lambda_public_subnet_id" {
    value = aws_subnet.public_lambda.id
}

output "lambda_sg_id" {
    value = aws_security_group.lambda.id
}