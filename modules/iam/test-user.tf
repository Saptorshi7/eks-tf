resource "aws_iam_role" "eks_namespace_role" {
  name = "eks-namespace-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::636361317523:user/Administrator"
            },
            "Action": "sts:AssumeRole"
        },
    ],
  })
}

# resource "aws_iam_role_policy_attachment" "eks_namespace_role_attachment" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#   role       = aws_iam_role.eks_namespace_role.name
# }