output "S3-Bucket-ID" {
    description = "provides the S3-Bucket-id as output"
    value       = aws_s3_bucket.complete-project-s3-bucket.id
}

output "S3-Bucket-Name" {
    description = "provides the S3-Bucket-name as output"
    value       = aws_s3_bucket.complete-project-s3-bucket.name
}

output "Dynamo-DB-Name" {
    description = "provides the Dynamo-DB-Name as output"
    value       = aws_dynamodb_table.complete-project-dynamodb-table.name
}   

output "Dynamo-DB-ID" {
    description = "provides the Dynamo-DB-Name as output"
    value       = aws_dynamodb_table.complete-project-dynamodb-table.id
} 

#############################################################

output "S3-Bucket-Details" {
    description = "provides the S3-Bucket-id as output"
    value = {
        Name = aws_s3_bucket.complete-project-s3-bucket.name
        ID = aws_s3_bucket.complete-project-s3-bucket.id
    }
}

output "DynamoDB_Details" {
    description = "provides the Dynamo-DB-Name as output"
    value = {
        Name = aws_dynamodb_table.complete-project-dynamodb-table.name
        id   = aws_dynamodb_table.complete-project-dynamodb-table.id
    }
}