output "vpc_id" {
  value = [for i in aws_vpc.vpc : i.id]
  description = "The IDs of the VPCs"
}
