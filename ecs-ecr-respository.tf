resource "aws_ecr_repository" "test_ecr_repo" {
   name = "demo"
}

output "repo-url" {
 value = aws_ecr_repository.test_ecr_repo.repository_url
}