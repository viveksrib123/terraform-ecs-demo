resource "aws_ecs_task_definition" "test_ecs_task_definition" {
  container_definitions    = "${data.template_file.ecs_test_task_definition_json.rendered}"                                         # task defination json file location
  #execution_role_arn       = "EcsTaskExecutionRole" #CHANGE THIS                                                                      # role for executing task
  family                   = "test-projects"                                                                      # task name
  network_mode             = "awsvpc"                                                                                      # network mode awsvpc, brigde
  memory                   = "512"
  cpu                      = "1024"
  requires_compatibilities = ["EC2"]                                                                                       # Fargate or EC2
  #task_role_arn            = "EcsTaskExecutionRole"  #CHANGE THIS                                                                     # TASK running role
} 

data "template_file" "ecs_test_task_definition_json" {
  template = "${file("${path.module}/ecs-test-task-definition.json")}"
}