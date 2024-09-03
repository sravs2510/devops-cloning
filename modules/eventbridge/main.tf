terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.eventbridge_region]
    }
  }
}

locals {
  schedule_groups = {
    group_name = join("-", ["qatalyst", var.service])
    schedule_group_name = join("-", ["qatalyst", var.schedule_group])
  }
}

resource "aws_scheduler_schedule_group" "qatalyst_schedule_group" {
  for_each = local.schedule_groups
  provider = aws.eventbridge_region
  name     = local.value
  tags     = merge(tomap({ "Name" : local.group_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
