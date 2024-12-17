variable "base_domain" {
  type        = string
  description = "Base Domain name"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "s3_origin_access_control_id" {
  type        = string
  description = "S3 Origin access control"
}