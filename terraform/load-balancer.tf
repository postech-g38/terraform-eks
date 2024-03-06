# resource "kubernetes_service" "LoadBalancer" {
#   metadata {
#     name = "load-balancer"
#   }
#   spec {
#     selector = {
#       nome = "load-balancer"
#     }
#     port {
#       port = 8000
#       target_port = 8000
#     }
#     type = "LoadBalancer"
#   }
# }

# data "kubernetes_service" "nomeDNS" {
#     metadata {
#       name = "load-balancer-django-api"
#     }
# }
