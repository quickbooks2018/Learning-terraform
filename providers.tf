provider "aws" {
  region = "us-east-1"
}

# aws s3api create-bucket --bucket terraform-remote-state-123456789 --region us-east-1 --acl private
# aws s3api put-bucket-versioning --bucket terraform-remote-state-123456789 --versioning-configuration Status=Enabled
terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-123456789"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-remote-state-lock"
  }
}

resource "aws_vpc" "vpc" {
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

output "vpc_id" {
  value = aws_vpc.vpc.id
}

# terraform apply -var-file=dev.tfvars
# terraform apply -var-file=dev.tfvars -auto-approve
# terraform apply -var-file=qa.tfvars
# terraform apply -var-file=qa.tfvars -auto-approve