module "vpc" {
  source = "./VPC_Module"
  # Any other required inputs
}

module "eks" {
  source = "./EKS_Module"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets
  control_plane_subnet_ids = module.vpc.private_subnets
  # Any other required inputs
}
