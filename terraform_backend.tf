terraform {
  backend "s3" {
    dynamodb_table = "entropik-terraform-state-lock-prestage"
    bucket         = "entropik-terraform-state-prestage"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = false
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}