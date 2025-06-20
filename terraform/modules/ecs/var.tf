variable "vpc_id" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "execution_role_arn" {}
variable "task_role_arn" {}
variable "appointment_image" {}
variable "patient_image" {}
