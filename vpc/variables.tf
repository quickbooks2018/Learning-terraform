variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "The CIDR block for the VPC"
}

variable "region" {
  default     = "us-east-1"
  type        = string
  description = "The region to deploy to"
}

variable "nat_amis" {
  default = {
    us-east-1 = "ami-01b66f9994a4d8384"
  }
  type        = map(string)
  description = "The AMI to use for the NAT instance"
}