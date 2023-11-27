output "endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}

output "eks_cluster_name" {
  value = aws_eks_cluster.example.name
}

# output "token" {
#   value = aws_eks_cluster.example.certificate_authority[]
# }