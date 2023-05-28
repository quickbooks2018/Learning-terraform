variable "vpc_cidr" {
    default = "10.0.0.0/16"
    type = string
    description = "The CIDR block for the VPC"
}

variable "region" {
    default = "us-east-1"
    type = string
    description = "The region to deploy to"
}