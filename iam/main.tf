resource "aws_iam_user" "iam-users" {
  count         = length(var.iam-users)
  name          = var.iam-users[count.index]
  force_destroy = "true"
}