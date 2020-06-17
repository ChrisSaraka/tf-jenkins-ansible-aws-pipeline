resource "aws_iam_role" "tf_ec2_s3_role" {
  name               = "tf_ec2_s3_role"
  assume_role_policy = file("scripts/ec2-assume-role.yml")
}

resource "aws_iam_role_policy" "tf_ec2_s3_policy" {
  name   = "tf_ec2_s3_policy"
  role   = aws_iam_role.tf_ec2_s3_role.id
  policy = file("scripts/s3-ec2-policy.yml")
}

resource "aws_iam_instance_profile" "tf_instance_profile" {
  name = "tf_instnace_profile"
  role = aws_iam_role.tf_ec2_s3_role.id
}
