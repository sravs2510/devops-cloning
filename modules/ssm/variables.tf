variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "open_ai_api" {
  type        = map(string)
  description = "Openai keys"
}

variable "opensearch_host" {
  type        = string
  description = "Qatalyst opensearch host"
}
