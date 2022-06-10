variable "name" {
  type        = string
  description = "A region-unique name for the AMI"
}

variable "instance_id" {
  type        = string
  description = "The id of the instance to use as the basis of the AMI"
}

variable "need_reboot" {
  type        = bool
  description = "Boolean that overrides the behavior of stopping the instance before snapshotting"
}