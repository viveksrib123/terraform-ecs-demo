resource "aws_ecs_service" "test_ecs_service" {
  cluster                = "${aws_ecs_cluster.test_ecs_cluster.id}"
  desired_count          = 1
  launch_type            = "EC2"
  name                   = "test_ecs_service"
  task_definition        = "${aws_ecs_task_definition.test_ecs_task_definition.arn}"

  load_balancer {
    container_name       = "test-ecs-container"       #"container_${var.component}_${var.environment}"
    container_port       = "8080"
    target_group_arn     = "${aws_alb_target_group.test_alb_tg.arn}"
  }
  network_configuration {
    security_groups      = ["${aws_security_group.all_inbound_allowed_sg.id}", "${aws_security_group.all_outbound_allowed_sg.id}"]
    subnets              = ["${aws_subnet.private-subnet-1.id}","${aws_subnet.private-subnet-2.id}"]
    assign_public_ip     = "false"
  }
  depends_on             = ["aws_alb_listener.test_alb_listener"]
}