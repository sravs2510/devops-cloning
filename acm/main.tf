terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        configuration_aliases = [aws.acm_region, aws.datacenter_region]
    }
  }
}

data "aws_region" "datacenter_region" {
  provider = aws.datacenter_region
}

resource "aws_acm_certificate" "acm_domain_name" {
  provider                  = aws.acm_region
  domain_name               = var.STAGE == "prod" ? join(".", [lookup(var.datacenter_codes, data.aws_region.datacenter_region.name),var.sub_domain, var.base_domain]) : join(".", [lookup(var.datacenter_codes, data.aws_region.datacenter_region.name), var.sub_domain, var.STAGE, var.base_domain])
  validation_method         = "DNS"
  tags = merge(tomap({"STAGE": var.STAGE}), var.DEFAULT_TAGS)
}

data "aws_route53_zone" "domain_hosted_zone" {
  provider     = aws.acm_region
  name         =  var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.base_domain])
  private_zone = false
}

resource "aws_route53_record" "domain_record_sets" {
  provider  = aws.acm_region
  for_each = {
    for dvo in aws_acm_certificate.acm_domain_name.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.domain_hosted_zone.zone_id
}

resource "aws_acm_certificate_validation" "acm_domain_validation" {
  provider                = aws.acm_region
  certificate_arn         = aws_acm_certificate.acm_domain_name.arn
  validation_record_fqdns = [for record in aws_route53_record.domain_record_sets : record.fqdn]
}


