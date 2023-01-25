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
  type = string
  description = "Base Domain Name"
}

variable "bucket_prefix" {
  type        = string
  description = "Bucket Prefix"
}

variable "tester_view_sub_domain" {
  type = string
  description = "Tester View Sub Domain Name"
}