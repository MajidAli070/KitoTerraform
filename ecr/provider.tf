terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Remote state - bucket is created by the s3-bucket/ folder
  backend "s3" {
    bucket       = "kito-tf-bucket"
    key          = "env/dev/ecr/terraform.tfstate"
    region       = "eu-west-3"
    encrypt      = true
    use_lockfile = true # S3 native locking - no DynamoDB table needed
  }
}

# Configure the AWS Provider
provider "aws" {
  region =  var.region
}
