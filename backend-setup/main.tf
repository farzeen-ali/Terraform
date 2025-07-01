provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "terraform_state" {
    bucket = var.bucket_name
    force_destroy = true

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
    tags = {
        Name = "Terraform State Bucket"
        Environment = var.environment
    }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name = var.lock_table
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

    tags = {
        Name = "Terraform Lock Table"
        Environment = var.environment
    }
}