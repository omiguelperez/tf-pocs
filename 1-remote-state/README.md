# Remote State 

This section contains example of how to use several Terraform Backend to persist the state remotely.

We can't manage the remote state bucket with the same terraform state. I got some permissions errors trying to do that.

## S3

You have to create manually a new bucket from AWS console called `tf-remote-state-s3-bucket-sample` and you 
apply your configuration you will see in that bucket a new file with your state.

```terraform
backend "s3" {
    bucket = "tf-remote-state-s3-bucket-sample"
    key = "envs/test/terraform.tfstate"
    region = "us-east-1"
}
```

To lock the Terraform state we have to set the `dynamodb_table` attribute to the backend block:

```terraform
backend "s3" {
    bucket = "tf-remote-state-s3-bucket-sample"
    key = "envs/test/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tf_remote_state_s3_bucket_sample_lock"
}
```

You can create that table manually or with Terraform using the resource in the `dynamo.tf` file.