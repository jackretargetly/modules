resource "aws_security_group" "allow_tls" {
  name        = "lb_teampass"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.selected.cidr_block]
  }

  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [data.aws_vpc.selected.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


}

resource "aws_lb" "retargetly" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.allow_tls.id]
  subnets            = var.aws_subnet_ids #data.aws_subnet_ids.selected.ids
  enable_deletion_protection = var.enable_deletion_protection
}



resource "aws_lb_listener" "teampass" {
  load_balancer_arn = aws_lb.retargetly.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.teampass.arn
  }
  depends_on       = [aws_lb_target_group.teampass]

}


resource "aws_lb_target_group" "teampass" {
  name     = var.alb_target_group
  port     = var.alb_target_group_port
  protocol = var.alb_target_group_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.teampass.arn
  target_id        = var.instance_id
  port             = var.alb_target_group_port
  depends_on       = [aws_lb_target_group.teampass]
}


