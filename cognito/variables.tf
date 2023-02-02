variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "user_pool_name" {
  type        = string
  description = "Cognito user pool name"
}

variable "user_pool_web_client_name" {
  type        = string
  description = "Cognito web client name"
}

variable "cognito_custom_domain" {
  type        = string
  description = "Cognito Custom Domain"
}

variable "cognito_custom_domain_acm_arn" {
  type        = string
  description = "Cognito Custom Domain ACM ARN"
}
