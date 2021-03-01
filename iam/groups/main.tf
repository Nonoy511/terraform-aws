resource "aws_iam_group" "ec2admins" {
  name = "ec2admins"
}

resource "aws_iam_group_membership" "ec2fullaccess-group-membership" {
  name = "ec2fullaccess-group-membership"

  users = var.iam-users

  group = aws_iam_group.ec2admins.name
}