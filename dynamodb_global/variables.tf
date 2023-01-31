variable "global_ddb_table_details" {
  type = list
  description = "List of global tables and properties"
}

variable "global_ddb_tables_without_range" {
  type = list
  description = "List of global tables and properties"
}

variable "STAGE" {
  type = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type = map(any)
  description = "Default Tags for all resources"
}

variable "point_in_time_recovery" {
  type = bool
  description = "Point in time recovery value"
  default = false
}

variable "gsi_global_table_details_without_range" {
  type = any
  description = "List of global ddb tables and properties"
}

variable "stream_view_type" {
  type = string
  description = "Stream view type which is used to get the old data, new data or both from dynamodb"
  default = "NEW_AND_OLD_IMAGES"
}