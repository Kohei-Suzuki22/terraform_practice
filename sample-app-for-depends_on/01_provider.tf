terraform {
  required_version = "~> 1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.1"
    }
  }
}


provider "aws" {
  region  = "ap-northeast-1"
  profile = "default"
}

