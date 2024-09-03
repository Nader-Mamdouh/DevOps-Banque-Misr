provider "aws" {
  region = "us-east-2"
}

# Data source to fetch the latest Amazon Linux 2023 AMI ID
data "aws_ami" "base_ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
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
  ami           = data.aws_ami.base_ami.id  # Use the correct AMI ID
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0]
  security_groups = [module.security_group.security_group_id]

  tags = {
    Name = "MyWebServer"
  }
}
