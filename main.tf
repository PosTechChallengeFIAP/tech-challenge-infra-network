provider "aws" {
  region = "us-west-2"
}

data "aws_s3_bucket" "existing_bucket" {
  bucket = "tech-challenge-tf-state"
}

terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "tech-challenge-tf-state"
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}