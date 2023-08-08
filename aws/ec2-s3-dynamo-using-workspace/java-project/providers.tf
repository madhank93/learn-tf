terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.15.0"
    }
  }
}

provider "aws" {
  region = lookup(var.region, terraform.workspace)
}
