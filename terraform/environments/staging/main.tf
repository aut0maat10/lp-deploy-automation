module "s3_bucket" {
  source       = "../../modules/s3_bucket"
  project_name = var.project_name
}

module "cloudfront" {
  source           = "../../modules/cloudfront"
  project_name = var.project_name
  s3_origin_domain = module.s3_bucket.s3_origin_domain  # Pass S3 output to CloudFront
}

module "iam_role" {
  source             = "../../modules/iam-role"
  role_name          = "${var.project_name}-staging-deploy-role"
  assume_role_policy = var.assume_role_policy
  policy_document    = var.policy_document
}


