resource "aws_dynamodb_table" "tf-remote-state-s3-bucket-sample-lock" {
  name = "tf_remote_state_s3_bucket_sample_lock"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}