# Creating S3 Bucket
resource "aws_s3_bucket" "eks_tf_s3" {
    bucket = var.bucket_name
    force_destroy = false

    tags = {
      env = var.env_name
    }
}

# Enabling the bucket versioning option
resource "aws_s3_bucket_versioning" "eks_tf_s3-eks-tf-s3_versioning" {
  bucket = aws_s3_bucket.eks_tf_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}