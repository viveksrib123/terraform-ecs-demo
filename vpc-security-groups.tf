resource "aws_security_group" "all_inbound_allowed_sg" {
	name   = "all_inbound_allowed_sg"
    vpc_id = "${aws_vpc.prod-vpc.id}"
	tags = {
        Name = "all_inbound_allowed_sg"
    }
}

resource "aws_security_group_rule" "all_inbound_allowed_sg_rule" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.all_inbound_allowed_sg.id}"
  to_port           = 0
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "all_inbound_ssh_allowed_sg" {
	name   = "all_inbound_ssh_allowed_sg"
    vpc_id = "${aws_vpc.prod-vpc.id}"
	tags = {
        Name = "all_inbound_ssh_allowed_sg"
    }
}

resource "aws_security_group_rule" "all_inbound_ssh_allowed_sg_rule" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = "${aws_security_group.all_inbound_ssh_allowed_sg.id}"
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "all_inbound_http_allowed_sg" {
  name   = "all_inbound_http_allowed_sg"
  vpc_id = "${aws_vpc.prod-vpc.id}"  
  tags = {
        Name = "all_inbound_http_allowed_sg"
    }
}

resource "aws_security_group_rule" "all_inbound_http_allowed_sg_rule" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = "${aws_security_group.all_inbound_http_allowed_sg.id}"
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "all_inbound_http_8080_allowed_sg" {
  name   = "all_inbound_http_8080_allowed_sg"
  vpc_id = "${aws_vpc.prod-vpc.id}"  
  tags = {
        Name = "all_inbound_http_8080_allowed_sg"
    }
}

resource "aws_security_group_rule" "all_inbound_http_8080_allowed_sg_rule" {
  from_port         = 8080
  protocol          = "tcp"
  security_group_id = "${aws_security_group.all_inbound_http_8080_allowed_sg.id}"
  to_port           = 8080
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group" "all_outbound_allowed_sg" {
  name   = "all_outbound_allowed_sg"
  vpc_id = "${aws_vpc.prod-vpc.id}"
  
  tags = {
        Name = "all_outbound_allowed_sg"
    }
}

resource "aws_security_group_rule" "all_outbound_allowed_sg_rule" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = "${aws_security_group.all_outbound_allowed_sg.id}"
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}