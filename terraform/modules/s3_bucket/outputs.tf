// outputs.tf in s3-bucket module
output "bucket_arn" {
  value = aws_s3_bucket.landing_page_bucket.arn
}

output "website_endpoint" {
  description = "Computed website endpoint for the S3 bucket"
  value       = format("%s.s3-website-%s.amazonaws.com", aws_s3_bucket.landing_page_bucket.bucket, data.aws_region.current.name)
}

output "s3_origin_domain" {
  value = aws_s3_bucket.landing_page_bucket.bucket_regional_domain_name
}





