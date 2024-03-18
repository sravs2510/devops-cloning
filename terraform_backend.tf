terraform {
  backend "s3" {
    dynamodb_table = "entropik-terraform-state-lock-dev"
    bucket         = "entropik-terraform-state-dev"
    key            = "terraform.tfstate"
    region         = "ap-southeast-1"
    encrypt        = false
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }
}