resource "aws_alb" "test_alb" {
  name               = "test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.all_inbound_http_allowed_sg.id}", "${aws_security_group.all_outbound_allowed_sg.id}"]
  subnets            = ["${aws_subnet.public-subnet-1.id}", "${aws_subnet.public-subnet-2.id}"]
  enable_deletion_protection = true

  tags = {
    Environment = "dev"
  }
}

resource "aws_alb_target_group" "test_alb_tg" {
  health_check {
    interval            = 50
    path                = "/"
	port        		= 8080
    protocol            = "HTTP"
    timeout             = 40
    healthy_threshold   = 3
    unhealthy_threshold = 2
  }

  name        = "test-alb-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = "${aws_vpc.prod-vpc.id}"
  target_type = "ip"
}

resource "aws_alb_listener" "test_alb_listener" {  
  load_balancer_arn = "${aws_alb.test_alb.arn}"  
  port              = 80  
  protocol          = "HTTP"
  
  default_action {    
    target_group_arn = "${aws_alb_target_group.test_alb_tg.arn}"
    type             = "forward"  
  }
}