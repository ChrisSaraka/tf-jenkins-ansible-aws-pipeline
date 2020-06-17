variable "cidr_block" {
  description = "This is the cidr of my VPC called TF_VPC"
  #	default 	= "10.0.0.0/16"
  type = string
}

variable "ec2-region" {
  type    = string
  default = "eu-west-2"
}

variable "ami_ids" {
  description = "AMI image for ubuntu-18.04 in eu-west-2"
  type        = map
  default = {
    eu-west-2 = "ami-032598fcc7e9d1c7a"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

