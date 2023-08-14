terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.dynamo_region]
    }
  }
}

resource "aws_dynamodb_table" "table" {
  provider = aws.dynamo_region

  for_each = var.table_details

  name                        = each.value.table_name
  hash_key                    = each.value.hash_key
  range_key                   = each.value.range_key
  billing_mode                = "PAY_PER_REQUEST"
  stream_enabled              = try(each.value.stream_enabled, var.stream_enabled)
  stream_view_type            = var.stream_view_type
  deletion_protection_enabled = var.STAGE == "prod" ? true : false

  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  attribute {
    name = each.value.hash_key
    type = "S"
  }

  attribute {
    name = each.value.range_key
    type = "S"
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

resource "aws_dynamodb_table" "tables_without_range_key" {
  provider = aws.dynamo_region

  for_each = var.tables_without_range_key

  name                        = each.value.table_name
  hash_key                    = each.value.hash_key
  billing_mode                = "PAY_PER_REQUEST"
  stream_enabled              = try(each.value.stream_enabled, var.stream_enabled)
  stream_view_type            = var.stream_view_type
  deletion_protection_enabled = var.STAGE == "prod" ? true : false
  point_in_time_recovery {
    enabled = var.point_in_time_recovery
  }

  attribute {
    name = each.value.hash_key
    type = "S"
  }

  tags = merge(tomap({ "Name" : each.value.table_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
