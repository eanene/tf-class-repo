# tfvars = the values to all the variables in your variable.tf file
provider "aws" {
  region = "us-east-2"
}



module "dev" {
  source = "../class-module/files"
  cidr_block = " 10.0.0.0/16"
}
