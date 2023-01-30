variable "base_domain" {
  type        = string
  description = "Base Domain name"
}

variable "domain_name" {
  type        = string
  description = "ACM Domain name"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}