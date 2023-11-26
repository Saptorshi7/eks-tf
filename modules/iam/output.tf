output "eks_role" {
        value = aws_iam_role.example.arn
}

output "node_role" {
        value = aws_iam_role.node_example.arn
}