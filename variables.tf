variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  default     = "10.10.0.0/16"
  type        = string
}

# Use terraform workspace to set the environment instead of this variable.
variable "environment" {
  description = "The environment for the VPC. Default value is a valid environment, but not acceptable by AWS and should be overridden"
  default     = "dev"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC. Default value is a valid name, but not acceptable by AWS and should be overridden"
  default     = "vpc"
  type        = string
}