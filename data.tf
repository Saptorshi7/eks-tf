data "aws_eks_cluster" "cluster" {
  name = module.eks.eks_cluster_name

  depends_on = [module.eks]
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.eks_cluster_name

  depends_on = [module.eks]
}