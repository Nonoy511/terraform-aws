resource "aws_iam_group" "ec2admins" {
  name = "ec2admins"
}

resource "aws_iam_group_membership" "ec2fullaccess-group-membership" {
  name = "ec2fullaccess-group-membership"

  users = var.iam-users

  group = aws_iam_group.ec2admins.name
}

resource "aws_iam_group_policy_attachment" "attach-ec2admins-ec2fullaccess-group-policy" {
  group      = aws_iam_group.ec2admins.name
  count      = length(var.ec2admins-arns)
  policy_arn = var.ec2admins-arns[count.index]
}