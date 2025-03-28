resource "aws_security_group" "lambda" {
  name        = "lambda-security-group"
  description = "EC2 communication security group"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tech-challenge-lambda-sg"
  }
}

resource "aws_subnet" "public_lambda" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-lambda-public-subnet"
  }
}

resource "aws_route_table_association" "lambda" {
  subnet_id      = aws_subnet.public_lambda.id
  route_table_id = aws_route_table.api.id
}