resource "aws_security_group" "sg" {
  name        = "tf_security_group"
  description = "The security group allows SSH/HTTP from everywhere. Also exposes Jenknins webserver on port 8080."
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# resource "aws_key_pair" "tf_key_pair" {
#   key_name   = "tf_key_pair"
#   public_key = file("/Users/csarakasidis/Downloads/my-key-pair-london.pem")
# }
