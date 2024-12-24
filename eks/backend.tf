terraform {
  required_version = ">= 1.9.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.49.0"
    }
  }
  backend "s3" {
    bucket         = "replace-with-your-state-bucket-name"
    region         = "us-east-2"
    key            = "eks/terraform.tfstate"
    dynamodb_table = "replace-with-your-state-table-name"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws-region
}
