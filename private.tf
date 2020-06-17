resource "aws_subnet" "private" {
  count = length(slice(local.az_names, 0, 3))
  /*  
	this slice command is just for the execution purpose. 
	Will give three private subnets in same az with the public subnets.
	*/
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, "${count.index + 3}")
  availability_zone = local.az_names[count.index]

  tags = {
    Name = "PrivateSubnet-${count.index + 1}"
  }
}
