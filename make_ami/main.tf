resource "aws_ami_from_instance" "base" {
  name                    = var.name
  source_instance_id      = var.instance_id
  snapshot_without_reboot = var.need_reboot
}