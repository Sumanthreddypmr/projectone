output "cluster_iam_role_arn" {
  value = module.eks_iam_role.iam_role_arn
}

output "node_group_role_arn" {
  value = module.eks_node_group_role.iam_role_arn
}
