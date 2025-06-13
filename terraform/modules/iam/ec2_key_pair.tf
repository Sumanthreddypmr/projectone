resource "tls_private_key" "eks" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "eks" {
  key_name   = "eks-key"
  public_key = tls_private_key.eks.public_key_openssh
}

resource "local_file" "eks_private_key" {
  content  = tls_private_key.eks.private_key_pem
  filename = "${path.module}/eks-key.pem"
  file_permission = "0400"
}
