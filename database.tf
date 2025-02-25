resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnet-group"
  subnet_ids = [aws_subnet.public.id]

  tags = {
    Name = "aurora-subnet-group"
  }
}

resource "aws_security_group" "aurora_sg" {
  name        = "aurora-security-group"
  description = "Allow inbound access to Aurora"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [data.terraform_remote_state.network.outputs.security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "aurora-security-group"
  }
}