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