resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name        = local.vpc_name
    Environment = terraform.workspace
    Location    = "Leeds/UK"
  }
}

# output "vpc_cidr" {
# 	value = aws_vpc.Terraform_VPC.cidr_block[count]
# }
