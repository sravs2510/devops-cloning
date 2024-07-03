data "aws_region" "eu" {
  provider = aws.eu_region
}

data "aws_region" "in" {
  provider = aws.in_region
}

data "aws_region" "sea" {
  provider = aws.sea_region
}

data "aws_region" "us" {
  provider = aws.us_region
}