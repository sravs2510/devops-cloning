terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.alb_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.alb_region
}

resource "aws_security_group" "qatalyst_alb_sg" {
  provider    = aws.alb_region
  name        = "qatalyst-alb-sg"
  description = "ALB Security Group"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTPS From Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #Anywhere
  }

  egress {
    description = "All Traffic Outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(tomap({ "Name" : "qatalyst-alb-sg" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
resource "aws_lb" "qatalyst_alb" {
  provider           = aws.alb_region
  name               = "qatalyst-alb"
  internal           = false
  idle_timeout       = "60"
  load_balancer_type = "application"

  security_groups = [aws_security_group.qatalyst_alb_sg.id]
  subnets         = var.alb_subnets

  enable_deletion_protection = true

  tags = merge(tomap({ "Name" : "qatalyst-alb" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_lb_target_group" "qatalyst_tg" {
  provider    = aws.alb_region
  name        = "qatalyst-dashboard-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  tags = merge(tomap({ "Name" : "qatalyst-dashboard-tg" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_lb_target_group" "qatalyst_reports_tg" {
  provider    = aws.alb_region
  name        = "qatalyst-reports-dashboard-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  tags = merge(tomap({ "Name" : "qatalyst-reports-tg" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_lb_target_group" "qatalyst_tester_view_tg" {
  provider    = aws.alb_region
  name        = "qatalyst-tester-view-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = "/health"
    interval            = 10
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
  tags = merge(tomap({ "Name" : "qatalyst-tester-view-tg" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
resource "aws_lb_listener" "qatalyst_alb_listener" {
  provider          = aws.alb_region
  certificate_arn   = var.alb_certficate_arn
  load_balancer_arn = aws_lb.qatalyst_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.qatalyst_tg.arn
  }
  tags = merge(tomap({ "Name" : "qatalyst-alb-listener" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_lb_listener_certificate" "qatalyst_reports_listener_certificate" {
  provider        = aws.alb_region
  listener_arn    = aws_lb_listener.qatalyst_alb_listener.arn
  certificate_arn = var.reports_acm_arn
}
resource "aws_lb_listener_rule" "qatalyst_alb_listener_reports_rule" {
  listener_arn = aws_lb_listener.qatalyst_alb_listener.arn
  provider     = aws.alb_region
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.qatalyst_reports_tg.arn
  }
  condition {
    path_pattern {
      values = [local.path_pattern]
    }
  }
}

resource "aws_lb_listener_rule" "qatalyst_alb_listener_tester_view_rule" {
  listener_arn = aws_lb_listener.qatalyst_alb_listener.arn
  provider     = aws.alb_region
  priority     = 101
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.qatalyst_tester_view_tg.arn
  }
  condition {
    path_pattern {
      values = [local.path_pattern_test, local.path_pattern_testers]
    }
  }
}

# ALB Domain Mapping
locals {
  datacenter_code      = lookup(var.datacenter_codes, data.aws_region.current.name)
  alb_domain_name      = var.STAGE == "prod" ? join(".", [local.datacenter_code, var.sub_domain, var.base_domain]) : join(".", [local.datacenter_code, var.STAGE, var.sub_domain, var.base_domain])
  path_prefix          = "/"
  path_pattern         = join("", [local.path_prefix, "v1", local.path_prefix, local.datacenter_code, local.path_prefix, "*"])
  path_pattern_testers = join("", [local.path_prefix, "v1", local.path_prefix, "testers", local.path_prefix, "*"])
  path_pattern_test    = join("", [local.path_prefix, "v1", local.path_prefix, "test", local.path_prefix, "*"])
}

data "aws_route53_zone" "domain_hosted_zone" {
  provider     = aws.alb_region
  name         = var.STAGE == "prod" ? var.base_domain : join(".", [var.STAGE, var.sub_domain, var.base_domain])
  private_zone = false
}

resource "aws_route53_record" "qatalyst_api_domain_record" {
  provider = aws.alb_region
  zone_id  = data.aws_route53_zone.domain_hosted_zone.zone_id
  name     = local.alb_domain_name
  type     = "A"

  alias {
    name                   = aws_lb.qatalyst_alb.dns_name
    zone_id                = aws_lb.qatalyst_alb.zone_id
    evaluate_target_health = false
  }
}
