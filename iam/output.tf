output "user_name" {
  value = aws_iam_user.user.name
}

output "user_arn" {
  value = aws_iam_user.user.name
}

output "user_first_accesskey" {
  value = aws_iam_access_key.lb.id
}

output "user_first_secretkey" {
  value = aws_iam_access_key.lb.secret
}