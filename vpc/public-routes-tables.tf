# Create public route table in terraform

locals {
  public_subnet_ids = aws_subnet.public_subnet.*.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
}

    tags = {
        Name = "Public_Route_Table"
    }
}


# Public Subnet Associations

resource "aws_route_table_association" "public_subnet_association" {
  count = length(local.azs)
  subnet_id      = local.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public_route_table.id
}