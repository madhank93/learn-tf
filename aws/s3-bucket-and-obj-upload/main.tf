resource "random_uuid" "uuid" {
}

resource "aws_s3_bucket" "static-bucket" {
  bucket = "finace-${random_uuid.uuid.result}"
}

resource "aws_s3_object" "pdf-file" {
  bucket = aws_s3_bucket.static-bucket.id
  key    = "sample-file"
  source = "sample.pdf"
}

