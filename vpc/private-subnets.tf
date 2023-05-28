resource "aws_subnet" "private_subnet" {
  count                   = length(slice(local.azs, 0, 2))
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index + length(local.azs))
  availability_zone       = local.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Private-Subnet-${count.index + 1}"
  }
}