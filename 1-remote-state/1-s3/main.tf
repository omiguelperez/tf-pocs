terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "tf-remote-state-s3-bucket-sample"
    key = "envs/test/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf_remote_state_s3_bucket_sample_lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my-sample-bucket" {
  bucket = "my-sample-bucket-sample"

  tags = {
    Description = "Terraform S3 Remote State sample"
  }
}

resource "aws_s3_bucket_versioning" "my-sample-bucket-versioning" {
  bucket = aws_s3_bucket.my-sample-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}