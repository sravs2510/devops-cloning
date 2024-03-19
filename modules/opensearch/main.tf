terraform {
  required_providers {
    random = {
      source                = "hashicorp/random"
      configuration_aliases = [random.random]
    }
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.opensearch_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.opensearch_region
}

data "aws_caller_identity" "current" {
  provider = aws.opensearch_region
}

locals {
  datacenter_code = lookup(var.datacenter_codes, data.aws_region.current.name)
}

resource "random_password" "opensearch_master_password" {
  provider    = random.random
  length      = 12
  min_upper   = 1
  min_lower   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

resource "aws_ssm_parameter" "ssm_opensearch_master_password" {
  provider = aws.opensearch_region
  name     = join("-", [var.service_name, "opensearch", "master", "password"])
  type     = "SecureString"
  value    = random_password.opensearch_master_password.result
  tags     = merge(tomap({ "Name" : "opensearch-master-password" }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

resource "aws_security_group" "opensearch_sg" {
  provider    = aws.opensearch_region
  name        = join("-", [var.service_name, "opensearch", "sg"])
  description = "Opensearch Security Group"
  vpc_id      = var.vpc_id

  ingress {
    description = "OpenSearch Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(tomap({ "Name" : join("-", [var.service_name, "opensearch", "sg"]) }), tomap({
    "STAGE" : var.STAGE
  }), var.DEFAULT_TAGS)
}

resource "aws_iam_service_linked_role" "es" {
  aws_service_name = "opensearchservice.amazonaws.com"
}

resource "aws_opensearch_domain" "opensearch_domain" {
  provider       = aws.opensearch_region
  domain_name    = var.service_name
  engine_version = "OpenSearch_2.11"

  advanced_security_options {
    anonymous_auth_enabled         = false
    enabled                        = true
    internal_user_database_enabled = true

    master_user_options {
      master_user_name     = join("-", [var.service_name, "opensearch", var.STAGE])
      master_user_password = random_password.opensearch_master_password.result
    }
  }

  auto_tune_options {
    desired_state       = "DISABLED"
    rollback_on_disable = "DEFAULT_ROLLBACK"
  }

  cluster_config {
    instance_count = var.opensearch_config.instance_count
    instance_type  = var.opensearch_config.instance_type
    zone_awareness_config {
      availability_zone_count = 3
    }
    zone_awareness_enabled = true
  }

  ebs_options {
    ebs_enabled = true
    volume_size = var.opensearch_config.ebs_volume_size
    volume_type = "gp2"
  }

  access_policies = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "es:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Resource = "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.service_name}/*"
      }
    ]
  })

  encrypt_at_rest {
    enabled = true
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  node_to_node_encryption {
    enabled = true
  }

  vpc_options {
    security_group_ids = [aws_security_group.opensearch_sg.id]
    subnet_ids         = var.private_subnets
  }

  tags = merge(tomap({ "Name" : join("-", [var.service_name, "opensearch", "domain"]) }), tomap({
    "STAGE" : var.STAGE
  }), var.DEFAULT_TAGS)

  depends_on = [aws_iam_service_linked_role.es]
}
