terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      configuration_aliases = [aws.s3_region]
    }
  }
}

resource "aws_s3_bucket_accelerate_configuration" "s3-transfer-acceleration" {
  provider = aws.s3_region
  bucket = var.s3-bucket-id
  status = "Enabled"
}
