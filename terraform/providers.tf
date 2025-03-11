terraform {

  required_version = ">= 1.11"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.89"
    }
  }
}

provider "aws" {
  region = var.aws_region
}