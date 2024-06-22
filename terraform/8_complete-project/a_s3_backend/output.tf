output "S3-Bucket-Details" {
    description = "provides the S3-Bucket-id as output"
    value = aws_s3_bucket.complete-project-s3-bucket.id
}

output "DynamoDB_Details" {
    description = "provides the Dynamo-DB-Name as output"
    value = {
        Name = aws_dynamodb_table.complete-project-dynamodb-table.name
        id   = aws_dynamodb_table.complete-project-dynamodb-table.id
    }
}