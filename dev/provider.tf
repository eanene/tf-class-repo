provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-class-bucket"
    key    = "class/tfstate"
    region = "us-east-1"
    dynamodb_table = "class-db"
  }
}