# resource "aws_instance" "base" {
#   ami           = "ami-005e54dee72cc1d00" # us-west-2
#   instance_type = "t2.micro"

#   network_interface {
#     network_interface_id = aws_network_interface.foo.id
#     device_index         = 0
#   }

#   credit_specification {
#     cpu_credits = var.cpu_credits
#   }
# }

resource "aws_subnet" "selected" {
  vpc_id     = aws_vpc.selected.id
  cidr_block = var.subnet_cdr
}
