provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "example" {
  metadata {
    name = "example-deployment"
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "example"
      }
    }

    template {
      metadata {
        labels = {
          app = "example"
        }
      }

      spec {
        container {
          image = "nginx:latest"
          name  = "example-container"

          port {
            container_port = 80
          }
        }
      }
    }
  }
}
