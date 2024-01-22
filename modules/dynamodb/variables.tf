variable "table_details" {
  type = map(object({
    table_name = string
    hash_key   = string
    range_key  = optional(string)
    is_global  = optional(bool)
    stream = optional(object({
      enabled   = bool
      view_type = optional(string)
    }))
    ttl = optional(object({
      enabled        = bool
      attribute_name = optional(string)
    }))
    attributes = optional(list(object({
      name = string
      type = string
    })))
    global_secondary_indexes = optional(list(object({
      name               = string
      hash_key           = string
      range_key          = optional(string)
      projection_type    = optional(string)
      non_key_attributes = optional(list(string))
    })))
  }))
  description = "DDB Tables details"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}
