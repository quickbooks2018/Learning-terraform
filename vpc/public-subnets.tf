locals {
    azs = data.aws_availability_zones.azs.names
}

resource "aws_subnet" "public_subnet" {
  count = length(local.azs)
  vpc_id = aws_vpc.vpc.id
    cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
    availability_zone = local.azs[count.index]
    map_public_ip_on_launch = true
    tags = {
      Name = "Public-Subnet-${count.index + 1}"
    }
}