module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.37.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"
  vpc_id          = var.vpc_id
  subnet_ids      = var.private_subnets

  enable_cluster_creator_admin_permissions = true
  iam_role_arn = var.cluster_iam_role_arn

  eks_managed_node_groups = {
    default = {
      node_group_name = "example"

      desired_size = 1
      max_size     = 1 
      min_size     = 1

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"

      update_config = {
        max_unavailable = 1
      }

      tags = {
        "Name" = "example-node-group"
      }
    }
  }
}
