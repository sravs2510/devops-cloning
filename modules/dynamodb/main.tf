terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.dynamo_region]
    }
  }
}

locals {
  region_name = ["ap-south-1", "eu-north-1", "ap-southeast-1"]
}

resource "aws_dynamodb_table" "table" {
  provider = aws.dynamo_region

  for_each = var.table_details

  name                        = each.value.table_name
  hash_key                    = each.value.hash_key
  range_key                   = try(each.value.range_key, null)
  billing_mode                = "PAY_PER_REQUEST"
  stream_enabled              = try(each.value.is_global, null) != null ? true : try(each.value.stream.enabled, false)
  stream_view_type            = try(each.value.stream.view_type, "NEW_AND_OLD_IMAGES")
  deletion_protection_enabled = var.STAGE == "prod" ? true : false

  point_in_time_recovery {
    enabled = var.STAGE == "prod" ? true : false
  }

  attribute {
    name = each.value.hash_key
    type = "S"
  }

  dynamic "attribute" {
    for_each = try(each.value.range_key, null) != null ? [1] : []
    content {
      name = each.value.range_key
      type = "S"
    }
  }

  dynamic "replica" {
    for_each = try(each.value.is_global, null) != null ? toset(local.region_name) : toset([])
    content {
      region_name            = replica.key
      propagate_tags         = true
      point_in_time_recovery = var.STAGE == "prod" ? true : false
    }
  }

  dynamic "ttl" {
    for_each = try(each.value.ttl, null) != null ? [1] : []
    content {
      enabled        = each.value.ttl.enabled
      attribute_name = each.value.ttl.attribute_name
    }
  }

  dynamic "attribute" {
    for_each = try(each.value.attributes, null) != null ? each.value.attributes : []
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "global_secondary_index" {
    for_each = try(each.value.global_secondary_indexes, null) != null ? each.value.global_secondary_indexes : []
    content {
      name            = global_secondary_index.value.name
      hash_key        = global_secondary_index.value.hash_key
      range_key       = try(global_secondary_index.value.range_key, null)
      projection_type = try(global_secondary_index.value.projection_type, "ALL")
    }
  }

  tags = merge(tomap({ "Name" : each.value.table_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

data "aws_sns_topic" "current" {
  name     = "DevOps-Alerts-Topic"
  provider = aws.dynamo_region
}

resource "aws_cloudwatch_metric_alarm" "dynamodb_successful_request_latency_alarm" {

  provider            = aws.dynamo_region
  for_each            = var.table_details
  alarm_name          ="${each.key}-ddb-latency"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  threshold           = "100"
  statistic           = "Average"
  period              = "300"
  namespace           = "AWS/DynamoDB"
  metric_name         = "SuccessfulRequestLatency"
  alarm_description  = "Alarm for DynamoDB Successful Request Latency for table"
  treat_missing_data = "notBreaching"
  alarm_actions = [data.aws_sns_topic.current.arn]
  dimensions = {
      TableName         = each.value.table_name
      Operation         = "Query"
    }
  
}

