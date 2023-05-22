variable "DEFAULT_TAGS" {
  type        = map(any)
  description = "Default Tags for all resources"
}

variable "STAGE" {
  type        = string
  description = "Stage for deployment"
}

variable "ecr_repo_name" {
  type        = string
  description = "Repo name suffix"
}