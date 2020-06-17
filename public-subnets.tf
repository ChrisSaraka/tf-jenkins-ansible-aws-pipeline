resource "aws_subnet" "public" {
  count             = length(local.az_names)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = local.az_names[count.index]

  tags = {
    Name        = "PublicSubnet-${count.index + 1}"
    Environment = terraform.workspace
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "TF_VPC_IGW"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "TF_VPC_IGW_RT"
  }
}

resource "aws_route_table_association" "pub_sub_association" {
  count          = length(local.az_names)
  subnet_id      = local.pub_sub_ids[count.index]
  route_table_id = aws_route_table.rt.id
}

resource "aws_eip" "instance_pub_ip" {
  count    = length(local.az_names)
  instance = local.instances_names[count.index]
  vpc      = true
}
