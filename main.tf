terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "cupumel0dy"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  
  cloud {
    organization = "cupumel0dy"
    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
}

provider "random" {
  # Configuration options
}

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
 
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
