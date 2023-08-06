resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  availability_zone       = "${var.reg}a"
  cidr_block              = var.public_subnet_1_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  availability_zone       = "${var.reg}b"
  cidr_block              = var.public_subnet_2_cidr
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.main_vpc.id
  availability_zone       = "${var.reg}a"
  cidr_block              = var.private_subnet_1_cidr
  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.main_vpc.id
  availability_zone       = "${var.reg}b"
  cidr_block              = var.private_subnet_2_cidr
  tags = {
    Name = "private_subnet_2"
  }
}