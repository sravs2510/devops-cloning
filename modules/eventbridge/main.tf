terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.eventbridge_region]
    }
  }
}

locals {
  group_name = join("-", ["qatalyst", var.service])
}

resource "aws_scheduler_schedule_group" "qatalyst_schedule_group" {
  provider = aws.eventbridge_region
  name     = local.group_name
  tags     = merge(tomap({ "Name" : local.group_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
