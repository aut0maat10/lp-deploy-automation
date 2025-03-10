// main.tf in s3-bucket module
data "aws_region" "current" {}

resource "aws_s3_bucket" "landing_page_bucket" {
  bucket = "${var.project_name}-landing-bucket"
}

resource "aws_s3_bucket_website_configuration" "landing_page_bucket_config" {
  bucket = aws_s3_bucket.landing_page_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}
  
resource "aws_s3_bucket_policy" "landing_page_bucket_policy" {
  bucket = aws_s3_bucket.landing_page_bucket.id

  policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.landing_page_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "landing_page_bucket_public_access" {
  bucket                  = aws_s3_bucket.landing_page_bucket.id
  block_public_acls       = false
  block_public_policy     = false  # Allow public policy
  ignore_public_acls      = false
  restrict_public_buckets = false
}



