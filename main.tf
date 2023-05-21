resource "aws_vpc" "vpc" {
  # 0 do not create vpc in default workspace #off
  # 1 create vpc in all other workspaces     #on
  count                = terraform.workspace == "default" ? 0 : 1
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = var.vpc_name
    Environment = terraform.workspace
    location    = "Pakistan"
  }
}