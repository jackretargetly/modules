output "subnet_id" {
  value = aws_subnet.teampass[0].id
}

output "instance_id" {
  value = aws_instance.teampass.id
}