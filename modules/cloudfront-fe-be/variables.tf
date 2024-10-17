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

variable "sub_domain" {
  type        = string
  description = "sub domain name"
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

variable "qatalyst_alb_dns_names" {
  type        = map(any)
  description = "Qatalyst ALB DNS Name Values"
}

variable "calendar_sub_domain" {
  type        = string
  description = "Calendar Domain Name"
}