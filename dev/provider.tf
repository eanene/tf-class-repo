# provider "aws" {
#   region = "us-east-1"

#   default_tags {
#     tags = {
#       project     = "class-project"
#       environment = var.env
#       owner       = "devops-team"
#     }
#   }
# }

# terraform {
#   backend "s3" {
#     bucket         = "terraform-class-bucket"
#     key            = "class/tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "class-db"
#   }
# }
