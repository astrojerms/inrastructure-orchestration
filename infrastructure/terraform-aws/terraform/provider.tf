provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  default_tags {
    tags = {
      "Terraform" = "true"
    }
  }
}


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "terraform-state-fcxp32"
    key    = "terraform/terraform.tfstate"
    region = "us-west-1"
  }
}

