DEFAULT_TAGS = {
  CreatedBy = "Terraform"
  Product   = "QATALYST"
}

datacenter_codes = {
  "ap-southeast-1" : "sea"
  "ap-south-1" : "in"
  "us-east-1" : "us"
  "eu-north-1" : "eu"
}

cidr_block = {
  "ap-southeast-1" : "10.12.0.0/16"
  "ap-south-1" : "10.22.0.0/16"
  "us-east-1" : "10.32.0.0/16"
  "eu-north-1" : "10.42.0.0/16"
}
public_subnets = {
  "ap-southeast-1" : ["10.12.10.0/24", "10.12.20.0/24"]
  "ap-south-1" : ["10.22.10.0/24", "10.22.20.0/24"]
  "us-east-1" : ["10.32.10.0/24", "10.32.20.0/24"]
  "eu-north-1" : ["10.42.10.0/24", "10.42.20.0/24"]
}

private_subnets = {
  "ap-southeast-1" : ["10.12.110.0/24", "10.12.120.0/24"]
  "ap-south-1" : ["10.22.110.0/24", "10.22.120.0/24"]
  "us-east-1" : ["10.32.110.0/24", "10.32.120.0/24"]
  "eu-north-1" : ["10.42.110.0/24", "10.42.120.0/24"]
}

base_domain            = "getqatalyst.io"
api_sub_domain         = "api"
media_sub_domain       = "media"
tester_view_sub_domain = "studyview"

user_pool_name            = "qatalyst-user-pool"
user_pool_web_client_name = "qatalyst-web-app"