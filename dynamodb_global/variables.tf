variable "global_table_details" {
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