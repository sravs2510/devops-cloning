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

variable "base_domain" {
  type        = string
  description = "Base Domain Name"
}

variable "bucket_prefix" {
  type        = string
  description = "Bucket Prefix"
}

variable "tester_view_sub_domain" {
  type        = string
  description = "Tester View Sub Domain Name"
}

variable "object_expiration_duration" {
  type        = string
  description = "Bucket objects expiration in Days"
}

variable "is_multi_region" {
  type        = bool
  description = "Flag to indicate multi region S3 buckets"
}

variable "reports_sub_domain" {
  type        = string
  description = "Reports S3 Sub Domain Name"
}

variable "invite_sub_domain" {
  type        = string
  description = "Invite S3 Sub Domain Name"
}

variable "is_bucket_name" {
  type        = bool
  default     = false
  description = "Flag to indicate  S3 bucket name or prefix"
}

variable "is_transfer_acceleration_enabled" {
  type        = bool
  default     = false
  description = "Flag to indicate if transfer acceleration should be enabled on s3 bucket"
}