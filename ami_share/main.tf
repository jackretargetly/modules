resource "aws_ami_launch_permission" "account" {
  image_id   = var.ami_id
  account_id = var.share_account
}