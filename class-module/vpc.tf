resource "aws_vpc" "tf-class-vpc" {
  cidr_block = var.my_cidr_block
  tags = {
    "Name" = "class-vpc"
  }
}

resource "aws_eip" "nat_eip" {
  # for_each = { for x in local.public_subnet : x.id => x.id }
  count = length(var.eip_names)
  vpc = true 
  depends_on = [
    aws_internet_gateway.gw
  ]
  tags = {
    Name = "tf-class-EIP"
  }
  
}

 resource "aws_nat_gateway" "tf-class-1" { 
  # for_each = local.public_subnet
  allocation_id = aws_eip.nat_eip[0].id
  # subnet_id     = local.public_subnet[each.key].id
  subnet_id     = aws_subnet.tf-class-public-subnet["pub-5"].id
  tags = {
    Name = "class-NAT-1"
  }
 }

resource "aws_nat_gateway" "tf-class-2" { 
  # for_each = local.public_subnet
  allocation_id = aws_eip.nat_eip[1].id
  # subnet_id     = local.public_subnet[each.key].id
  subnet_id     = aws_subnet.tf-class-public-subnet["pub-6"].id
  tags = {
    Name = "class-NAT-2"
  }
 }




 ################## IGW ###################################
 resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tf-class-vpc.id

  tags = {
    Name = "class-igw"
  }
}