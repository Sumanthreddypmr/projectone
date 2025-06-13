output "cluster_iam_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "node_group_role_arn" {
  value = aws_iam_role.eks_node_group_role.arn
}

output "key_name" {
  value = aws_key_pair.eks.key_name
}
