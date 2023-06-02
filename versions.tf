terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 5.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "twdps"
    workspaces {
      prefix = "psk-aws-platform-wan-"
    }
  }
}

provider "aws" {
  region = var.aws_region

#   assume_role {
#     role_arn     = "arn:aws:iam::${var.aws_account_id}:role/${var.aws_assume_role}"
#     session_name = "di-global-platform-wan"
#   }

  default_tags {
    tags = {
      product  = "empc engineering platform"
      pipeline = "psk-aws-platform-wan"
    }
  }
}