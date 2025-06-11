variable "cluster_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "cluster_iam_role_arn" {
  type = string
}

variable "node_group_iam_role_arn" {
  type = string
}
