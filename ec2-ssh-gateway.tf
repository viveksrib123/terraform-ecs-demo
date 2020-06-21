resource "aws_instance" "ssh-connector" {

    ami = "ami-085925f297f89fce1"
    instance_type = "t2.micro"

    # VPC
    subnet_id = "${aws_subnet.public-subnet-1.id}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.all_inbound_ssh_allowed_sg.id}", "${aws_security_group.all_outbound_allowed_sg.id}"]

    # the Public SSH key
    key_name = "${aws_key_pair.london-region-key-pair.id}"

}