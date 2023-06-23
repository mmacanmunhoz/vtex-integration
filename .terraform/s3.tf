resource "aws_s3_bucket" "this" {
  bucket = "${local.name_app}-ebs"
  acl    = "private"

  tags = {
    Name = "Vtex Integration EBS"
  }
}

resource "aws_s3_bucket_object" "this" {
  bucket = aws_s3_bucket.this.id
  key    = "Dockerrun.aws.json"
  source = "Dockerrun.aws.json"
  etag = filemd5("Dockerrun.aws.json")
}