module "vpc" {
  source = "../../modules/vpc"

  name             = "dev-vpc"
  vpc_cidr         = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.4.0/24"]
  private_subnets  = ["10.0.2.0/24", "10.0.3.0/24"]
  azs              = ["us-east-1a", "us-east-1b"]
  cluster_name     = var.cluster_name
}


module "iam" {
  source = "../../modules/iam"
}

module "eks" {
  source               = "../../modules/eks"
  cluster_name         = var.cluster_name
  cluster_version      = var.cluster_version
  vpc_id               = module.vpc.vpc_id
  private_subnets      = module.vpc.private_subnets
  cluster_iam_role_arn = module.iam.cluster_iam_role_arn
  node_group_role_arn  = module.iam.node_group_role_arn
}

module "ecs" {
  source = "../../modules/ecs"

  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnets
  private_subnets    = module.vpc.private_subnets
  execution_role_arn = module.iam.ecs_execution_role_arn
  task_role_arn      = module.iam.ecs_task_role_arn

  appointment_image  = "825765405000.dkr.ecr.us-east-1.amazonaws.com/sattiipatwala:latest"
  patient_image      = "825765405000.dkr.ecr.us-east-1.amazonaws.com/sattiipatwala:latest"
}




