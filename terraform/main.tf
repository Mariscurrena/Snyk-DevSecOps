provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "snyk-test-cicd-2026"
}

# Vulnerability: Bucket with public ACL
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test_bucket.id
  acl    = "public-read"
}

# Vulnerability: No server cipher