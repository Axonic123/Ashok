##########################################################################
# Routing table 
##########################################################################

resource "aws_route_table" "public_route_table" {
  depends_on = [aws_vpc.vpc, aws_internet_gateway.internet_gateway]
  vpc_id     = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  lifecycle {
    ignore_changes = all
  }

  tags = {
    Name = var.public_route_table_name
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  count = length(var.subnets)
  subnet_id = element(aws_subnet.subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}
