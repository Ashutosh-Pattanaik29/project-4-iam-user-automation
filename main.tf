terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. Create the IAM User
resource "aws_iam_user" "s3_reader" {
  name = var.iam_username

  tags = {
    Project     = "Project-4-IAM-Automation"
    Environment = "Dev"
  }
}

# 2. Create the IAM Policy using the variable
resource "aws_iam_policy" "s3_read_policy" {
  name        = "${var.iam_username}-s3-read-policy"
  description = "Controlled S3 read-only permissions stored via Terraform variable"
  policy      = var.s3_read_policy
}

# 3. Attach the Policy to the IAM User
resource "aws_iam_user_policy_attachment" "attach_s3_read" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}
