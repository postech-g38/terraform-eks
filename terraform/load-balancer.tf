# resource "aws_lb" "alb" {
#     name = "ALB-LoadBalancer"
#     internal = false
#     load_balancer_type = "application"
#     # security_groups = ["${aws_security_group.security-group.id}"] 
#     subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]  
#     idle_timeout = 120
#  }
#     resource "aws_lb_listener" "alb_listener-redirect" {
#         load_balancer_arn = aws_lb.alb
#         port                = "8000"
#         protocol            = "HTTP"

#       default_action {
#         type = "forward"
#         # target_group_arn = aws_lb_target_group.tg.arn
#       }
#     }

resource "aws_lb" "my_load_balancer" {
  name               = "my-load-balancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]# Substitua pelos IDs das sub-redes onde o Load Balancer será criado

  tags = {
    Name = "MyLoadBalancer"
  }
}



resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}
