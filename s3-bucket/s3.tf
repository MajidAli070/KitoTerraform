resource "aws_s3_bucket" "tfstate" {
  bucket = "kito-tf-bucket"

  # Galti se state ka bucket delete na ho jaye
  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name    = "kito-tf-bucket"
    Purpose = "terraform-remote-state"
  }
}

resource "aws_s3_bucket_versioning" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  versioning_configuration {
    status = "Disabled"
  }
}

# Encryption — state file mein plaintext secrets hote hain
resource "aws_s3_bucket_server_side_encryption_configuration" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = true
  }
}

# Public access poora block
resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket = aws_s3_bucket.tfstate.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}