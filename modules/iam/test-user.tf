resource "aws_iam_role" "eks_namespace_role" {
  name = "eks-namespace-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "${data.aws_caller_identity.current.arn}"
        },
        "Action" : "sts:AssumeRole"
      },
    ],
  })
}