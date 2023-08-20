terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
  required_version = "~> 1.3"
  backend "s3" {
    bucket = "my-eks-cluster-01"
    region = "us-east-1"
    key    = "terraform.tfstate"
  }
}

provider "aws" {
  region = var.region
}
