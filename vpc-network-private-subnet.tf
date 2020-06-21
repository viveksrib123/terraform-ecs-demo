# Elastic IP resource
resource "aws_eip" "nat" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = "${aws_subnet.public-subnet-1.id}"
  depends_on    = [aws_internet_gateway.internet-gw]
}

# create a custom route table for public subnets
resource "aws_route_table" "private-rt" {
  vpc_id = "${aws_vpc.prod-vpc.id}"
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }
  
  tags = {
        Name = "private-rt"
    }
}

resource "aws_route_table_association" "private-rta-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "private-rta-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-rt.id
}