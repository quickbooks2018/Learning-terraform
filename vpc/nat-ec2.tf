# Nat Security Group
resource "aws_security_group" "nat_sg" {
  name        = "cloudgeeks_nat_sg"
  description = "Allow all traffic from private subnet to nat instance"
  vpc_id      = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# terraform create nat ec2 instance
resource "aws_instance" "nat_ec2" {
  ami                    = var.nat_amis[var.region]
  instance_type          = "t3a.micro"
  subnet_id              = local.public_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.nat_sg.id]
  source_dest_check      = false
  tags = {
    Name = "cloudgeeks_nat_ec2"
  }
}

resource "aws_eip" "nat" {
  vpc      = true
  instance = aws_instance.nat_ec2.id
    tags = {
        Name = "cloudgeeks_nat_eip"
    }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "Private_Route_Table"
  }
}

resource "aws_route" "route" {
  route_table_id            = aws_route_table.private_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  network_interface_id      = aws_instance.nat_ec2.primary_network_interface_id
}

resource "aws_route_table_association" "private_route_table_association" {
  count          = length(slice(local.azs, 0, 2))
  subnet_id      = aws_subnet.private_subnet.*.id[count.index]
  route_table_id = aws_route_table.private_route_table.id
}