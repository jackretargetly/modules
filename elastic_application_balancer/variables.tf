variable "name" {
  type        = string
}
variable "internal" {
  type        = string
}
variable "load_balancer_type" {
  type        = string
  default = "application"
}

variable "subnets_ids" {
  type        =  list
}
variable "enable_deletion_protection" {
  type        = bool
  default = false
}

variable "vpc_id" {
  type        = string
}