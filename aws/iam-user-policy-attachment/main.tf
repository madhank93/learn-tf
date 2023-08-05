terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.11.0"
    }
  }
}

# Creating the admin user
resource "aws_iam_user" "admin-user" {
  name = "madhan"
  tags = {
    description = "Creating admin user"
  }
}

# Creating the admin policy
resource "aws_iam_policy" "admin-policy" {
  name   = "admin-policy"
  policy = file("./admin-policy.json")
}

# Attaching the admin user with adminstator access policy
resource "aws_iam_user_policy_attachment" "admin-policy-attachment" {
    user = aws_iam_user.admin-user.name
    policy_arn = aws_iam_policy.admin-policy.arn
}