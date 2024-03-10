resource "kubernetes_deployment" "ByteBurguer-API" {
  metadata {
    name = "byteburguer-api"
    labels = {
      nome = "byteburguer"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        nome = "byteburguer"
      }
    }

    template {
      metadata {
        labels = {
          nome = "byteburguer"
        }
      }

      spec {
        container {
          image = "hiltonbruno633/byte-burguer-api:latest"
          name  = "byteburguer"
        }
      }
    }
  }
}

resource "kubernetes_service" "LoadBalancer" {
  metadata {
    name = "load-balancer-byteburguer-api"
  }
  spec {
    selector = {
      nome = "byteburguer"
    }
    port {
      port = 8000
    }
    type = "LoadBalancer"
  }
}

