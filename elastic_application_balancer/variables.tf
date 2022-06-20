variable "name" {
  type        = string
}
variable "internal" {
  type        = bool
}
variable "load_balancer_type" {
  type        = string
  default = "application"
}


variable "enable_deletion_protection" {
  type        = bool
  default = false
}

variable "aws_subnet_ids" {
  type        = list
}


variable "vpc_id" {
  type        = string
}
