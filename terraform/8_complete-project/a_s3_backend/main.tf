# Creating AWS s3 bucket for backend
resource "aws_s3_bucket" "complete-project-s3-bucket" {
    bucket = var.s3-bucket-name

    tags = {
        Name = var.s3-bucket-name
        Environment = var.environment
        Class = s3-bucket
    }
}

# Enabling the Versioninf for s3 bucket
resource "aws_s3_bucket_versioning" "versioning-complete-project-s3-bucket" {
  bucket = aws_s3_bucket.complete-project-s3-bucket.id
  versioning_configuration {
    status = "Suspended"
  }
}

#Enabling the Dynamo-DB for backend
resource "aws_dynamodb_table" "complete-project-dynamodb-table" {
  name           = var.dynamodb-name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

    tags = {
        Name = var.s3-bucket-name
        Environment = var.environment
        Class = dynamo-db
    }
}


  
