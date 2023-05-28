provider "aws" {
  region = "us-east-1"
}

# aws s3api create-bucket --bucket terraform-remote-state-123456789 --region us-east-1 --acl private
# aws s3api put-bucket-versioning --bucket terraform-remote-state-123456789 --versioning-configuration Status=Enabled
#terraform {
#  backend "s3" {
#    bucket = "terraform-remote-state-123456789"
#    key    = "terraform.tfstate"
#    region = "us-east-1"
#     dynamodb_table = "terraform-remote-state-lock"
#  }
#}
