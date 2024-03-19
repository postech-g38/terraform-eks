resource "kubernetes_service" "LoadBalancer" {
  metadata {
    name = "lb-byteburguer"
  }
  spec {
    selector = {
      app = "byte-burguer-pod"
    }
    port {
      port = 8000
      target_port = 8000
    }
    type = "LoadBalancer"
  }
}

# data "kubernetes_service" "nomeDNS" {
#     metadata {
#       name = "lb-byteburguer"
#     }
# }

# output "DNS" {
#   value = data.kubernetes_service.nomeDNS.status
# }