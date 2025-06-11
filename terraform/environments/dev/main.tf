module "vpc" {
  source = "../../modules/vpc"

  name             = "dev-vpc"
  vpc_cidr         = "10.0.0.0/16"
  public_subnets   = ["10.0.1.0/24"]
  private_subnets  = ["10.0.2.0/24", "10.0.3.0/24"]
  azs              = ["us-east-1a", "us-east-1b"]
}

module "iam" {
  source = "../../modules/iam"
}

module "eks" {
  source  = "../../modules/eks"
  cluster_name    = var.cluster_name
  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  cluster_iam_role_arn = module.iam.eks_role_arn
  node_group_iam_role_arn = module.iam.node_group_role_arn
}
