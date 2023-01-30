terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.sea_region, aws.in_region, aws.us_region, aws.eu_region]
    }
  }
}

data "aws_region" "sea_region" {
  provider = aws.sea_region
}

data "aws_region" "in_region" {
  provider = aws.in_region
}

data "aws_region" "us_region" {
  provider = aws.us_region
}

data "aws_region" "eu_region" {
  provider = aws.eu_region
}

# ddb configuration
resource "aws_dynamodb_table" "ddb_global_config_table" {
  provider = aws.us_region
  count    = length(var.global_ddb_table_details)

  name         = var.global_ddb_table_details[count.index].table_name
  hash_key     = var.global_ddb_table_details[count.index].hash_key
  range_key    = var.global_ddb_table_details[count.index].range_key
  billing_mode = "PAY_PER_REQUEST"

  stream_enabled   =  true

  attribute {
    name = var.global_ddb_table_details[count.index].hash_key
    type = "S"
  }

  attribute {
    name = var.global_ddb_table_details[count.index].range_key
    type = "S"
  }

  replica {
    region_name    = data.aws_region.in_region.name
    propagate_tags = true
  }
  replica {
    region_name    = data.aws_region.sea_region.name
    propagate_tags = true
  }
  replica {
    region_name    = data.aws_region.eu_region.name
    propagate_tags = true
  }

  tags = merge(tomap({ "Name" : var.global_ddb_table_details[count.index].table_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}

# ddb configuration without range key
resource "aws_dynamodb_table" "ddb_global_config_table_without_range" {
  provider = aws.us_region
  count    = length(var.global_ddb_tables_without_range)

  name         = var.global_ddb_tables_without_range[count.index].table_name
  hash_key     = var.global_ddb_tables_without_range[count.index].hash_key
  billing_mode = "PAY_PER_REQUEST"

  stream_enabled   = true

  attribute {
    name = var.global_ddb_tables_without_range[count.index].hash_key
    type = "S"
  }

  replica {
    region_name    = data.aws_region.in_region.name
    propagate_tags = true
  }
  replica {
    region_name    = data.aws_region.sea_region.name
    propagate_tags = true
  }
  replica {
    region_name    = data.aws_region.eu_region.name
    propagate_tags = true
  }

  tags = merge(tomap({ "Name" : var.global_ddb_tables_without_range[count.index].table_name }), tomap({ "STAGE" : var.STAGE }), var.DEFAULT_TAGS)
}
