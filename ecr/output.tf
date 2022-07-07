output "repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}

output "registry_id" {
  value = aws_ecr_repository.ecr.registry_id
}

output "arn" {
  value = aws_ecr_repository.ecr.arn
}

output "repository" {
  value = aws_ecr_repository_policy.ecrpolicy.repository
}
