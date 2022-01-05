terraform {
  backend "s3" {
    key     = "lambda-dummy-image/terraform.tfstate"
    region  = "ap-northeast-1"
    encrypt = true
  }
}
