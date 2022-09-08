resource "aws_vpc" "tf-class-vpc" {
  cidr_block = var.my_cidr_block
  tags = {
    "Name" = "class-vpc"
  }
}

resource "aws_eip" "nat_eip" {
  for_each = { for x in local.public_subnet : x.id => x.id }
  vpc = true 
  depends_on = [
    aws_internet_gateway.gw
  ]
  tags = {
    Name = "tf-class-EIP"
  }
  
}
#  resource "aws_nat_gateway" "tf-class" {
    
#   for_each = { for x in local.public_subnet : x.id => x.id }
#   allocation_id = { for x in local.eip : x.id => x.public_ip }
#   # aws_eip.nat_eip[count.index].id
#   subnet_id     = each.value

#   tags = {
#     Name = "class-NAT"
#   }
#   depends_on = [
#     local.public_subnet
#   ]
#  }
 resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.tf-class-vpc.id

  tags = {
    Name = "class-igw"
  }
}