resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.tf-class-vpc.id

  tags = {
    Name =  "${var.env}-pub-RT"
  }

}

resource "aws_route" "pub-routes" {
  route_table_id            = aws_route_table.pub-rt.id
  gateway_id    = aws_internet_gateway.gw.id
  destination_cidr_block = "0.0.0.0/0"
 
}

resource "aws_route_table_association" "pub_a" {
    for_each = { for x in local.public_subnet : x.id => x.id }
  subnet_id      = each.value
  route_table_id = aws_route_table.pub-rt.id
}