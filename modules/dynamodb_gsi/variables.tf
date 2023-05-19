variable "gsi_table_details" {
  type        = any
  description = "List of tables and properties"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "stream_enabled" {
  type        = bool
  description = "Flag for enabling/disabling dynamodb stream"
  default     = false
}

variable "stream_view_type" {
  type        = string
  description = "Stream view type which is used to get the old data, new data or both from dynamodb"
  default     = "NEW_AND_OLD_IMAGES"
}

variable "point_in_time_recovery" {
  type        = bool
  description = "Point in time recovery value"
}