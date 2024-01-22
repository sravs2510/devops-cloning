moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_eu_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_in_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_sea_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.tables_without_range_key["workspace-usage"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["workspace-usage"]
}

moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.tables_without_range_key["reports-lookup"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["reports-lookup"]
}

moved {
  from = module.create_us_dynamodb.aws_dynamodb_table.tables_without_range_key["stripe-events"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["stripe-events"]
}

moved {
  from = module.create_eu_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_eu_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_eu_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_eu_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_in_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_in_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_in_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_in_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_sea_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_sea_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_sea_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_sea_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_us_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_tags"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["transcripts_tags"]
}

moved {
  from = module.create_us_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["transcripts_highlights"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["transcripts_highlights"]
}

moved {
  from = module.create_us_dynamodb_gsi.aws_dynamodb_table.ddb_table_gsi["study_details"]
  to   = module.create_us_dynamodb.aws_dynamodb_table.table["study_details"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.global_ddb_table_gsi_without_range["workspaces"]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["workspaces"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.global_ddb_table_gsi_without_range["user_profile"]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["user_profile"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table[1]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-user-workspace-mapping"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table[2]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-user-invites"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table[0]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-configurations"]
}

moved {
  from = module.create_global_dynamodb.aws_dynamodb_table.ddb_global_config_table_without_range[0]
  to   = module.create_global_dynamodb.aws_dynamodb_table.table["qatalyst-cognito-mapping"]
}