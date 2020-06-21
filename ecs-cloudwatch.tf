resource "aws_cloudwatch_log_group" "log_group" {
  name = "test_devl_cw"
    tags = {
    Environment = "dev"
  }
}