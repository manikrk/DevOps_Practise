# Backend configuration for saving and locking tfstate file
/*terraform {

  backend "s3" {
    bucket         = "eks-tf-s3-19880528-devenv"
    key            = "platform/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = false
    dynamodb_table = "eks-tf-dynamo-db"
  }
}

*/