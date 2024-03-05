# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

# vpc
resource "aws_vpc" "aws-vpc" {
  cidr_block = "10.0.0.0/16"
  # The following attributes are optional and could be added as needed
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "aws-vpc"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster.html
# ecs cluster

resource "aws_ecs_cluster" "foo" {
  name = "white-hart"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}