#main.tf (Root – Calling Module)
//module "static_website" {
//  source      = "./modules/s3-static-website"
// bucket_name = var.bucket_name
//}

resource "aws_s3_bucket" "roshantech-bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}

resource "aws_s3_bucket_public_access_block" "roshantech_bucket" {
  bucket = aws_s3_bucket.roshantech_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "roshantech_bucket" {
  bucket = aws_s3_bucket.roshantech-bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.roshantech-bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject"
        ]
        Resource = "${aws_s3_bucket.roshantech-bucket.arn}/*"
      }
    ]
  })
}
