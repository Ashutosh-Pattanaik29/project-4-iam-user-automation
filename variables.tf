variable "aws_region" {
  description = "AWS Region for provider configuration"
  type        = string
  default     = "eu-north-1"
}

variable "iam_username" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "s3-readonly-dev-user"
}

variable "s3_read_policy" {
  description = "IAM Policy JSON granting read-only access to S3"
  type        = string
  default     = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3ReadOnlyAccess",
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*",
        "s3:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
POLICY
}
