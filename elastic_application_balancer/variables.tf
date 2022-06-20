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
variable "security_groups" {
  type        = list
}
variable "subnets_ids" {
  type        =  list
}
variable "enable_deletion_protection" {
  type        = bool
  default = false
}
