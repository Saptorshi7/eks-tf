module "eks" {
  source = "./modules/eks"

  eks_role  = module.iam.eks_role
  node_role = module.iam.node_role
  subnets   = var.subnets

  depends_on = [module.iam]
}

module "iam" {
  source = "./modules/iam"
}

module "k8s" {
  source = "./modules/k8s"

  ns_role      = module.iam.ns_role
  eks_role     = module.iam.eks_role
  cluster_name = module.eks.eks_cluster_name

  depends_on = [module.eks]
}