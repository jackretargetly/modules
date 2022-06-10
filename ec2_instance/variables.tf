variable "cpu_credits" {
  type        = string
  description = "Credit option for CPU usage"
}

variable "device_index" {
  type        = string
  description = "Integer index of the network interface attachment"
}

variable "instance_type" {
  type        = string
  description = "The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance"
}

variable "ami" {
  type        = string
  description = "AMI to use for the instance"
}