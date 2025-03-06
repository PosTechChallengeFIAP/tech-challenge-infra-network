resource "aws_subnet" "api" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech-challenge-api-public-subnet"
  }
}

resource "aws_internet_gateway" "api" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "tech-challenge-api-igw"
  }
}

resource "aws_route_table" "api" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.api.id
  }

  tags = {
    Name = "tech-challenge-api-public-route-table"
  }
}

resource "aws_route_table_association" "api" {
  subnet_id      = aws_subnet.api.id
  route_table_id = aws_route_table.api.id
}

resource "aws_security_group" "api" {
  vpc_id = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tech-challenge-api-sg"
  }
}