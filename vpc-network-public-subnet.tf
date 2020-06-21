# create an IGW (Internet Gateway)
resource "aws_internet_gateway" "internet-gw" {
    vpc_id = "${aws_vpc.prod-vpc.id}"

    tags = {
        Name = "internet-gw"
    }
}

# create a custom route table for public subnets
resource "aws_route_table" "public-rt" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0" //associated subnet can reach everywhere
        gateway_id = "${aws_internet_gateway.internet-gw.id}" //CRT uses this IGW to reach internet
    }

    tags = {
        Name = "public-rt"
    }
}

# route table association for the public subnets
resource "aws_route_table_association" "public-rta-1" {
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    route_table_id = "${aws_route_table.public-rt.id}"
}

resource "aws_route_table_association" "public-rta-2" {
    subnet_id = "${aws_subnet.public-subnet-2.id}"
    route_table_id = "${aws_route_table.public-rt.id}"
}
