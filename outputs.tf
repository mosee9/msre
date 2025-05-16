output "deployment_name" {
  value = kubernetes_deployment.example.metadata[0].name
}
