resource "aws_eip" "eip_nat1" {
    depends_on = [ aws_internet_gateway.ngw ]
}

resource "aws_eip" "eip_nat2" {
    depends_on = [ aws_internet_gateway.ngw ]
}

resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.eip_nat1.id
  subnet_id     = aws_subnet.public_subnet_1.id
}

resource "aws_nat_gateway" "nat_gw2" {
  allocation_id = aws_eip.eip_nat2.id
  subnet_id     = aws_subnet.public_subnet_2.id
}