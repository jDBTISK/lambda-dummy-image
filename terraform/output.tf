output "ecr_address" {
  description = "ECR Login Address"
  value       = local.ecr_address
}

output "ecr_repository_url" {
  description = "ECR Repository URL"
  value       = aws_ecr_repository.lambda.repository_url
}
