resource "kubernetes_role" "k8s_test_role" {
  metadata {
    name      = "k8s-test-role"
    namespace = "test"
  }

  rule {
    api_groups = [""]
    resources  = ["configmaps", "cronjobs", "deployments", "events", "ingresses", "jobs", "pods", "pods/attach", "pods/exec", "pods/log", "pods/portforward", "secrets", "services"]
    verbs      = ["create", "delete", "describe", "get", "list", "patch", "update"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments"]
    verbs      = ["create", "delete", "describe", "get", "list", "patch", "update"]
  }

  rule {
    api_groups = ["batch"]
    resources  = ["cronjobs"]
    verbs      = ["create", "delete", "describe", "get", "list", "patch", "update"]
  }

  rule {
    api_groups = ["extensions"]
    resources  = ["deployments"]
    verbs      = ["create", "delete", "describe", "get", "list", "patch", "update"]
  }
}

resource "kubernetes_role_binding" "k8s_test_rolebinding" {
  metadata {
    name      = "k8s-test-rolebinding"
    namespace = "test"
  }

  subject {
    kind = "User"
    name = "k8s-test-user"
  }

  role_ref {
    kind      = "Role"
    name      = "k8s-test-role"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "null_resource" "example" {
  # ...

  provisioner "local-exec" {
    command = "eksctl create iamidentitymapping --cluster ${var.cluster_name} --arn ${var.ns_role} --username k8s-test-user"
  }
}
