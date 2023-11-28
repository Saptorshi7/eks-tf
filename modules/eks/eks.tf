resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = var.eks_role

  vpc_config {
    subnet_ids = var.subnets
  }
}

resource "aws_eks_node_group" "example" {
  cluster_name    = aws_eks_cluster.example.name
  node_group_name = "example"
  node_role_arn   = var.node_role
  subnet_ids      = var.subnets

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }
}