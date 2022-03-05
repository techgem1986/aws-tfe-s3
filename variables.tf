variable "region" {
  description = "Default AWS Region to create the resources"
  default     = "us-east-1"
}

variable "s3-bucket" {
  description = "S3 Bucket name for website hosting"
  default     = "blogger-dashboard"
}