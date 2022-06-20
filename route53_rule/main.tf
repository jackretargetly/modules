resource "aws_route53_record" "www" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = var.type_record

  alias {
    name                   = var.lb_dns_name
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }
}