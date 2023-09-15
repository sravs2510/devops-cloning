variable "sqs_details" {
  type        = map(any)
  description = "List of sqs queues and properties"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}