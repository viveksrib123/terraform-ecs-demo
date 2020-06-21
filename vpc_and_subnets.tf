resource "aws_vpc" "prod-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    instance_tenancy = "default"

    tags = {
        Name = "prod-vpc"
    }
}

resource "aws_subnet" "public-subnet-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.AVL_ZONE_A}"

    tags = {
        Name = "public-subnet-1"
    }
}

resource "aws_subnet" "private-subnet-1" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.0.1.0/24"
    availability_zone = "${var.AVL_ZONE_A}"
	map_public_ip_on_launch = "false"
    tags = {
        Name = "private-subnet-1"
    }
}

resource "aws_subnet" "public-subnet-2" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.0.2.0/24"
    availability_zone = "${var.AVL_ZONE_B}"
	map_public_ip_on_launch = "true"
    tags = {
        Name = "public-subnet-2"
    }
}



resource "aws_subnet" "private-subnet-2" {
    vpc_id = "${aws_vpc.prod-vpc.id}"
    cidr_block = "10.0.3.0/24"
    availability_zone = "${var.AVL_ZONE_B}"
	map_public_ip_on_launch = "false"
    tags = {
        Name = "private-subnet-2"
    }
}