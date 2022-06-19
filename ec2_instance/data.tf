data "aws_vpc" "selected" {
  id = var.vpc_id
}

data "aws_subnet" "selected" {
  count = var.create_subnet ? 0 : 1
  id = var.subnet_id
}

data "aws_ami" "teampassimage" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^teampassdeploy\\d{3}"
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["teampassdeploy*"]
  }
}