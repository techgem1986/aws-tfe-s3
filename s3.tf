# S3 bucket for website.
resource "aws_s3_bucket" "s3-bucket" {
  bucket = local.name
  acl = "public-read"
  policy = templatefile("templates/s3-policy.json", { bucket = local.name })

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    max_age_seconds = 3000
    allowed_origins = ["http://www.${local.name}"]
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = {
     Name = local.name
     Environment = local.environment
  }
}