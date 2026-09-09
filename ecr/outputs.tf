output "app_repository_name" {
  description = "App ECR repository ka naam"
  value       = aws_ecr_repository.app.name
}

output "api_repository_name" {
  description = "API ECR repository ka naam"
  value       = aws_ecr_repository.api.name
}

output "app_repository_url" {
  description = "App image push/pull URL"
  value       = aws_ecr_repository.app.repository_url
}

output "api_repository_url" {
  description = "API image push/pull URL"
  value       = aws_ecr_repository.api.repository_url
}