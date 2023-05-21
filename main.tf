locals {
  # if workspace is default do not create vpc
  # if workspace is dev create vpc with name dev-vpc
  # if workspace is qa create vpc with name qa-vpc

  # below vpc_name means if workspace is default then vpc_name = default
  vpc_name = "${terraform.workspace == "dev" ? "vpc-dev" : "vpc-qa"}"
}

resource "aws_vpc" "vpc" {
  # 0 do not create vpc in default workspace #(do not create) true
  # 1 create vpc in all other workspaces     #(create)        else
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
