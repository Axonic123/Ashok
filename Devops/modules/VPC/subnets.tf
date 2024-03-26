##########################################################################
# Subnets
##########################################################################

resource "aws_subnet" "subnets" {
  count = length(var.subnets)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnets[count.index].cidr
  availability_zone       = var.subnets[count.index].availability_zones 
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnets[count.index].name
  }
}
