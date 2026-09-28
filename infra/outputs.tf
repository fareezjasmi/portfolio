output "site_url" {
  description = "Public URL of the site."
  value       = local.use_domain ? "https://${var.domain_name}" : "https://${aws_cloudfront_distribution.site.domain_name}"
}

output "bucket_name" {
  description = "Set as the S3_BUCKET repository variable in GitHub."
  value       = aws_s3_bucket.site.bucket
}

output "cloudfront_distribution_id" {
  description = "Set as the CLOUDFRONT_DISTRIBUTION_ID repository variable in GitHub."
  value       = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  description = "The *.cloudfront.net hostname."
  value       = aws_cloudfront_distribution.site.domain_name
}

output "github_deploy_role_arn" {
  description = "Set as the AWS_ROLE_ARN repository variable in GitHub."
  value       = aws_iam_role.github_deploy.arn
}

output "aws_region" {
  description = "Set as the AWS_REGION repository variable in GitHub."
  value       = var.aws_region
}
