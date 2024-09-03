terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" { 
 region = "us-east-2" 
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}


# module "variables" {
#  source = "./variables.tf" 
# }



# # Create a VPC
# resource "aws_vpc" "Macarious-VPC" { 
#  cidr_block = var.vpc_cidr_block 
#  tags = { 
#   Name = "Macarious-vpc"
#  }
# }