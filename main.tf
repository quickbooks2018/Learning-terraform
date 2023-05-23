locals {
  # if workspace is default do not create vpc
  # if workspace is dev create vpc with name dev-vpc
  # if workspace is qa create vpc with name qa-vpc

  # below vpc_name means if workspace is default then vpc_name = default
  vpc_name = "${terraform.workspace == "dev" ? "vpc-dev" : "vpc-qa"}"
}

resource "aws_vpc" "vpc" {
  # 0 is false
  # 1 true
  # Example it is opposite of base condition where 0 is true and 1 is false
  # In Boolean 0 is false and 1 is true

  # Below is the example of if else condition
  count                = terraform.workspace == "default" ? 0 : 1

  # Below is the example of if condition
 # count                = terraform.workspace == "default" ? 1 : 0
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = local.vpc_name
    Environment = terraform.workspace
    location    = "Pakistan"
  }
}

