variable "bucket_arn" {
  type        = string
  description = "s3 bucket arn"
}

variable "bucket_regional_domain_name" {
  type        = string
  description = "s3 bucket regional domain name"
}

variable "bucket_id" {
  type        = string
  description = "s3 bucket id"
}

variable "cf_domain_name" {
  type        = string
  description = "CloudFront domain name"
}

variable "base_domain" {
  type        = string
  description = "base domain name"
}

variable "acm_certificate_arn" {
  type        = string
  description = "ACM ARN for CloudFront"

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