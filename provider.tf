provider "aws" {
  region = "ap-southeast-1"
  alias  = "sea_region"
  default_tags {
    tags = {
      Product   = "QATALYST"
      CreatedBy = "Terraform"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  alias  = "in_region"
  default_tags {
    tags = {
      Product   = "QATALYST"
      CreatedBy = "Terraform"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us_region"
  default_tags {
    tags = {
      Product   = "QATALYST"
      CreatedBy = "Terraform"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
  alias  = "eu_region"
  default_tags {
    tags = {
      Product   = "QATALYST"
      CreatedBy = "Terraform"
    }
  }
}

provider "aws" {
  region = "us-west-2"
  alias  = "us_west_region"
  default_tags {
    tags = {
      Product   = "QATALYST"
      CreatedBy = "Terraform"
    }
  }
}

provider "random" {
  alias = "random"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu_west_region"
  default_tags {
    tags = {
      Product   = "QATALYST"
      CreatedBy = "Terraform"
    }
  }
}