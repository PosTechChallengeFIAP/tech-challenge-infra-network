resource "aws_subnet" "private_aurora_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "tech-challenge-private-aurora-subnet-a"
  }
}

resource "aws_subnet" "private_aurora_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "tech-challenge-private-aurora-subnet-b"
  }
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "aurora-subnet-group"
  subnet_ids = [aws_subnet.private_aurora_a.id, aws_subnet.private_aurora_b.id]

  tags = {
    Name = "aurora-subnet-group"
  }
}

resource "aws_security_group" "aurora_sg" {
  name        = "aurora-security-group"
  description = "Allow inbound access to Aurora"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
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