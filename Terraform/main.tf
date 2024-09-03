provider "aws" { 
 region = "us-east-2" 
}
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "Macarious-Team2-VPC"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]
  public_subnets  = ["10.0.1.0/24", "10.0.3.0/24"]

  enable_nat_gateway = true
  single_nat_gateway  = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway = false

  public_subnet_tags = {
    "map_public_ip_on_launch" = true
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "Macarious-Cluster-Team2"
  cluster_version = "1.30"

  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets

  eks_managed_node_group_defaults = {
    instance_types = ["t3.large"]
  }

  eks_managed_node_groups = {
    example = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.large"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }

  enable_cluster_creator_admin_permissions = true


  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}













































# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "~> 20.0"

#   cluster_name    = "Macarious-Cluster-Team2"
#   cluster_version = "1.30"

#   cluster_endpoint_public_access  = true

#   cluster_addons = {
#     coredns                = {}
#     eks-pod-identity-agent = {}
#     kube-proxy             = {}
#     vpc-cni                = {}
#   }

#   vpc_id                   = "vpc-1234556abcdef"
#   subnet_ids               = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
#   control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

#   # EKS Managed Node Group(s)
#   eks_managed_node_group_defaults = {
#     instance_types = ["t3.large"]
#   }

#   eks_managed_node_groups = {
#     example = {
#       # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
#       ami_type       = "AL2023_x86_64_STANDARD"
#       instance_types = ["t3.large"]

#       min_size     = 1
#       max_size     = 1
#       desired_size = 1
#     }
#   }

#   # Cluster access entry
#   # To add the current caller identity as an administrator
#   enable_cluster_creator_admin_permissions = true

#   access_entries = {
#     # One access entry with a policy associated
#     example = {
#       kubernetes_groups = []
#       principal_arn     = "arn:aws:iam::123456789012:role/Macarious"

#       policy_associations = {
#         example = {
#           policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
#           access_scope = {
#             namespaces = ["default"]
#             type       = "namespace"
#           }
#         }
#       }
#     }
#   }

#   tags = {
#     Environment = "dev"
#     Terraform   = "true"
#   }
# }