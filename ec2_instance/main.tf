resource "aws_subnet" "teampass" {
  count      = var.create_subnet ? 1 : 0
  vpc_id     = data.aws_vpc.selected.id
  cidr_block = var.subnet_cdr
}

resource "aws_security_group" "teampass" {
  name        = var.sg_instance
  vpc_id      = var.vpc_id
}

resource "aws_network_interface" "teampass" {
  subnet_id = var.create_subnet ? aws_subnet.teampass[0].id : data.aws_subnet.selected.id
  private_ips     = [var.teampass_privateip]
  security_groups = [aws_security_group.teampass.id]
}

resource "aws_instance" "teampass" {
  ami           = var.ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = aws_network_interface.teampass.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = var.cpu_credits
  }
}