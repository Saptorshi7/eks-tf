resource "kubernetes_pod" "example_pod" {
  metadata {
    name      = "example-pod"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"
    }
  }
}