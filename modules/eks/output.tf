output "endpoint" {
  value = aws_eks_cluster.example.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.example.certificate_authority[0].data
}

output "eks_cluster_name" {
  value = aws_eks_cluster.example.name
}

output "cluster_id" {
  value = aws_eks_cluster.example.cluster_id
}