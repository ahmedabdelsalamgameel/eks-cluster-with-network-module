resource "aws_internet_gateway" "ngw" {
  vpc_id = aws_vpc.main_vpc.id
}
