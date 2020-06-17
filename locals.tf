locals {
  vpc_name        = terraform.workspace == "dev" ? "TF_VPC_DEV" : "TF_VPC_PROD"
  az_names        = data.aws_availability_zones.azs.names
  pub_sub_ids     = aws_subnet.public.*.id
  instances_names = aws_instance.my_instances.*.id
}
