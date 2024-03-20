output "qatalyst_study_details_ddb_stream_arn" {
  value = try(var.table_details["study_details"], null) != null ? aws_dynamodb_table.table["qatalyst-study-details"].stream_arn : null
}
