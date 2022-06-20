output "aws_lb" {
  value = aws_lb.retargetly.id
}

output "aws_lb_dns_name" {
  value = aws_lb.retargetly.dns_name
}

output "aws_lb_zone_id" {
  value = aws_lb.retargetly.zone_id
}

output "aws_lb_arn" {
  value = aws_lb.retargetly.arn
}