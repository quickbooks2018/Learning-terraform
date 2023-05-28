# create internet gateway in terraform
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "cloudgeeks.ca-igw"
  }
}

