# provider "aws" {
#   region = var.my_region
# }

# terraform {
#   backend "s3" {
#     bucket = "terraform-class-bucket"
#     key    = "class/tfstate"
#     region = "us-east-1"
#     dynamodb_table = "class-db"
#   }
# }