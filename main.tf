module "eks" {
    source = "./modules/eks"

    eks_role = module.iam.eks_role
    node_role = module.iam.node_role
    subnets = var.subnets
    
    depends_on = [ module.iam ]
}

module "iam" {
    source = "./modules/iam"
}

output "endpoint" {
  value = module.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = module.eks.kubeconfig-certificate-authority-data
}