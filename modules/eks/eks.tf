resource "aws_eks_cluster" "example" {
  name     = "example"
  role_arn = var.eks_role

  vpc_config {
    subnet_ids = var.subnets
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  # depends_on = [
  #   aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
  #   aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController,
  # ]
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

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  # depends_on = [
  #   aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
  #   aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
  #   aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  # ]

}

# resource "null_resource" "example" {
#   provisioner "local-exec" {
#     command = "aws eks --region eu-west-1 update-kubeconfig --name example"
#     # command = <<-EOT
#     #   aws eks --region eu-west-1 update-kubeconfig --name example
#     #   sleep 10
#     # EOT
#   }

#   depends_on = [ aws_eks_node_group.example ]
# }

# resource "time_sleep" "wait_30_seconds" {
#   depends_on = [null_resource.example]

#   create_duration = "60s"
# }


# module "k8s" {
#     source = "../k8s"

#     # depends_on = [ module.eks ]
# }

