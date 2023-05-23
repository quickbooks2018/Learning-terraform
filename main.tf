locals {
  # if workspace is default do not create vpc
  # if workspace is dev create vpc with name dev-vpc
  # if workspace is qa create vpc with name qa-vpc

  # below vpc_name means if workspace is default then vpc_name = default
  vpc_name = "${terraform.workspace == "dev" ? "vpc-dev" : "vpc-qa"}"
}

resource "aws_vpc" "vpc" {
  # 0 do not create vpc in default workspace #(create it)     false
  # 1 create vpc in all other workspaces     #(do create)     true
  # Example it is opposite of base condition where 0 is true and 1 is false
  # In Bold condition 0 is false and 1 is true
  count                = terraform.workspace == "default" ? 0 : 1
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
