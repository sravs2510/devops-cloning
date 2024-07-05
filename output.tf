output "ddb_stream_arns" {
  value = module.create_in_dynamodb[0].ddb_stream_arns
}