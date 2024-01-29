#random string explanation
#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower    = true
  upper    = false
  length   = 32
  special  = false
}

resource "aws_s3_bucket" "example" {
  bucket =random_string.bucket_name.result
 #bucket explain
 #https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
 
 tags = {
    UserUuid = var.user_uuid
  }
}

