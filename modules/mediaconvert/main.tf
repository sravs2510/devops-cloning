terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.mediaconvert_region]
    }
  }
}

data "aws_region" "current" {
  provider = aws.mediaconvert_region
}

resource "aws_media_convert_queue" "mediaconvert_queue" {
  provider     = aws.mediaconvert_region
  for_each     = var.mediaconvert_queues
  name         = each.value.name
  pricing_plan = each.value.pricing_plan
  status       = each.value.status
  tags         = var.DEFAULT_TAGS
}
