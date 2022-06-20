resource "aws_lb" "test" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets_ids
  enable_deletion_protection = var.enable_deletion_protection
}