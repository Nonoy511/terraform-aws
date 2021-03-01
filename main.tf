terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket         = "nonoy-terraform-backends"
    key            = "terraform-aws/terraform.tfstate"
    region         = "us-west-1"
    dynamodb_table = "terraform-backend-lock"
  }
}

provider "aws" {
  region  = "us-west-1"
  profile = "nonoy-api-user"
}

resource "aws_iam_user" "iam-users" {
  count         = length(var.iam-users)
  name          = var.iam-users[count.index]
  force_destroy = "true"
}

#module "iam" {
#  source = "./iam"
#}