provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5NEM3OJS2BPF44V2"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
  ami = "ami-026b57f3c383c2eec"
  instance_type = "t2.micro"
}

