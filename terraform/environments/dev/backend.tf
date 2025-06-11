terraform {
  backend "s3" {
    bucket         = "eks-project-tf-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-project-tf-lock"
    encrypt        = true
  }
}




