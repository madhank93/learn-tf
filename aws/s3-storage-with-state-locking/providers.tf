terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
  backend "s3" {
    encrypt        = true
    bucket         = "madhank93-learn-tf"
    dynamodb_table = "tf-state-lock"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}