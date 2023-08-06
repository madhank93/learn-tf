resource "aws_s3_bucket" "backend-storage" {
  bucket = "madhank93/learn-tf"
}

resource "aws_dynamodb_table" "tf-state-lock" {
  name = "tf-state-lock"
  hash_key = "lock_id"
  read_capacity = 20
  write_capacity = 20
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "lock_id"
    type = "S"
  }
}
