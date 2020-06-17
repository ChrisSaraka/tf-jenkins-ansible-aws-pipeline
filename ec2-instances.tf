resource "aws_instance" "my_instances" {
  count                  = length(local.az_names)
  ami                    = var.ami_ids[var.ec2-region]
  instance_type          = var.instance_type
  subnet_id              = local.pub_sub_ids[count.index]
  user_data              = file("scripts/docker-install.sh")
  iam_instance_profile   = aws_iam_instance_profile.tf_instance_profile.name
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  key_name               = "my-key-pair-london"

  tags = {
    Name        = "Instance-${count.index + 1}"
    Environment = terraform.workspace
  }
}
