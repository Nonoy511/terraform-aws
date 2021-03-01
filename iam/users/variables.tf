variable "iam-users" {
  type    = list(string)
  default = ["default-user"]
}

#variable "ec2admins-arns" {
#  description = "IAM Policy to be attached to role"
#  type        = list(string)
#}