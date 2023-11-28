output "endpoint" {
  value = module.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = module.eks.kubeconfig-certificate-authority-data
}