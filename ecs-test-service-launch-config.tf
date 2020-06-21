resource "aws_launch_configuration" "ecs_launch_configuration" {
    name                   = "ecs_launch_configuration"
    image_id               = "ami-01d025118d8e760db"
    instance_type          = "t2.medium"
    iam_instance_profile   = "${aws_iam_instance_profile.ecs-instance-profile.id}"

    root_block_device {
      volume_type          = "gp2"
      volume_size          = "10"
      delete_on_termination = "true"
    }

    lifecycle {
      create_before_destroy = true
    }

    security_groups             = ["${aws_security_group.all_inbound_allowed_sg.id}", "${aws_security_group.all_outbound_allowed_sg.id}"]
    associate_public_ip_address = "false"
    key_name                    = "${aws_key_pair.london-region-key-pair.id}"
    user_data                   = "${data.template_file.user_data.rendered}"
}

resource "aws_autoscaling_group" "ecs-autoscaling-group" {
    name                        = "ecs-autoscaling-group"
    max_size                    = 4
    min_size                    = 1
    desired_capacity            = 2
    vpc_zone_identifier         = ["${aws_subnet.private-subnet-1.id}", "${aws_subnet.private-subnet-2.id}"]
    launch_configuration        = "${aws_launch_configuration.ecs_launch_configuration.name}"
    health_check_type           = "ELB"
}