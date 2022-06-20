resource "aws_subnet" "teampass" {
  count      = var.create_subnet ? 1 : 0
  vpc_id     = data.aws_vpc.selected.id
  cidr_block = var.subnet_cdr
}

resource "aws_security_group" "teampass" {
  name        = var.sg_instance
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.teampass.id
}

resource "aws_security_group_rule" "https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.teampass.id
}

# resource "aws_security_group_rule" "allow_all" {
#   type              = "egress"
#   to_port           = 0
#   protocol          = "-1"
#   from_port         = 0
#   security_group_id = aws_security_group.teampass.id
# }


resource "aws_network_interface" "teampass" {
  subnet_id = var.create_subnet ? aws_subnet.teampass[0].id : data.aws_subnet.selected[0].id
  private_ips     = [var.teampass_privateip]
  security_groups = [aws_security_group.teampass.id]
}

resource "aws_iam_instance_profile" "teampass" {
  name = var.instance_profile_name 
  role = var.role_name
}

resource "aws_instance" "teampass" {
  ami           = var.ami
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.teampass.name
  network_interface {
    network_interface_id = aws_network_interface.teampass.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = var.cpu_credits
  }
}

