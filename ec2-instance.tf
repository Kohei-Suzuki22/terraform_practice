# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal
  region = "ap-northeast-1"
}

# Resource lock
resource "aws_instance" "ec2demo" {
  ami = "ami-0e0820ad173f20fbb" #amazon Linux in ap-northeast-1, update as
  instance_type = "t2.micro"
}