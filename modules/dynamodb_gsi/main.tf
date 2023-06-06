terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.dynamo_region]
    }
  }
}

resource "aws_dynamodb_table" "ddb_table_gsi" {
  provider = aws.dynamo_region

  for_each = var.gsi_table_details

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

  attribute {
    name = each.value.attribute_1
    type = "S"
  }

  global_secondary_index {
    name            = each.value.gsi_1.name
    hash_key        = each.value.gsi_1.hash_key
    range_key       = each.value.gsi_1.range_key
    projection_type = "ALL"
  }


  tags = merge(tomap({ "Name" : each.value.table_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
