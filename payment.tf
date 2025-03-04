resource "aws_security_group" "payment_sg" {
  name        = "lambda-payment-security-group"
  description = "EC2 communication security group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}