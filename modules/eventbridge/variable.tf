variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "service" {
  type        = any
  description = "Name of the Service to create event bridge scheduler group"
}

