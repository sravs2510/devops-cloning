variable "base_domain" {
  type        = string
  description = "Base Domain name"
}

variable "sub_domain" {
  type        = string
  description = "Sub Domain name"
}

variable "datacenter_codes" {
  type        = map(string)
  description = "Data center code values"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "is_multi_region" {
  type        = bool
  description = "Flag to indicate multi region cloudfront"
}