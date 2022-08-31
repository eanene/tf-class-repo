resource "aws_vpc" "tf-class-vpc" {
  cidr_block = var.my_cidr_block
  tags = {
    "Name" = "class-vpc"
  }
}

