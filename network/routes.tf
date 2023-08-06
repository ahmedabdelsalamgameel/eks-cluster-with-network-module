resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route" "routes_public" {
  route_table_id = aws_route_table.route_table_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.ngw.id
}

resource "aws_route_table_association" "public_association_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table_association" "public_association_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.route_table_public.id
}

##

resource "aws_route_table" "route_table_private1" {
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_route_table" "route_table_private2" {
  vpc_id = aws_vpc.main_vpc.id
}
resource "aws_route" "routes_private1" {
  route_table_id         = aws_route_table.route_table_private1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gw1.id
}

resource "aws_route" "routes_private2" {
  route_table_id         = aws_route_table.route_table_private2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gw2.id
}
resource "aws_route_table_association" "private_association_1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.route_table_private1.id
}

resource "aws_route_table_association" "private_association_2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.route_table_private2.id
}