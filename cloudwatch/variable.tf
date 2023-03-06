
variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "qatalyst_cw_dashboard_role_arn" {
  type        = string
  description = "Qatalyst Cloudwatch Dashboard Arn"
}
