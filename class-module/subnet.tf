resource "aws_subnet" "tf-class-data-subnet" {
  for_each = var.private_data_subnets
  vpc_id     = aws_vpc.tf-class-vpc.id
  cidr_block = each.value.cidr 
  availability_zone = each.value.availability_zone

  tags = {
     Name = "${each.value.name}-${var.env}" 
  }
}

resource "aws_subnet" "tf-class-app-subnet" {
  for_each = var.private_app_subnets
  vpc_id     = aws_vpc.tf-class-vpc.id
  cidr_block = each.value.cidr 
  availability_zone = each.value.availability_zone

  tags = {
    Name = "${each.value.name}-${var.env}" 
  }

    
  
}

resource "aws_subnet" "tf-class-public-subnet" {
  for_each = var.public_subnets 
  vpc_id     = aws_vpc.tf-class-vpc.id
  cidr_block = each.value.cidr 
  availability_zone = each.value.availability_zone

  tags = {
    Name = "${each.value.name}-${var.env}" 
  }

}