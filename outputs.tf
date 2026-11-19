output "iam_user_name" {
  description = "The created IAM user name"
  value       = aws_iam_user.s3_reader.name
}

output "iam_user_arn" {
  description = "The ARN of the created IAM user"
  value       = aws_iam_user.s3_reader.arn
}

output "attached_policy_arn" {
  description = "The ARN of the S3 read policy attached to the user"
  value       = aws_iam_policy.s3_read_policy.arn
}
