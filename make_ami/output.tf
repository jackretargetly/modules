output "ami_arn" {
  value = aws_ami_from_instance.base.arn
}

output "ami_id" {
  value = aws_ami_from_instance.base.id
}