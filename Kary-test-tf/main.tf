provider "aws" {
  region = "us-east-1"
}

# Data source to fetch the latest Ubuntu AMI ID
data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/ubuntu-*-*-amd64-server-*"]
  }
}

module "vpc" {
  source         = "./VPC_Module"
  cidr_block     = "10.0.0.0/16"
  vpc_name       = "MyVPC"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-east-1a", "us-east-1b"]
}

module "security_group" {
  source  = "./SecurityGroup_Module"
  sg_name = "EC2-SG"
  vpc_id  = module.vpc.vpc_id
}

resource "aws_instance" "web" {
  ami           = data.aws_ami_ids.ubuntu.ids[0]  # Use the first AMI ID
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  security_groups = [module.security_group.security_group_id]

  tags = {
    Name = "MyWebServer"
  }
}

