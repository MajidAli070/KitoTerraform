resource "aws_lb_target_group" "app_dev" {
  name        = var.app_tg_name
  port        = var.app_tg_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

resource "aws_lb_target_group" "api_dev" {
  name        = var.api_tg_name
  port        = var.api_tg_port
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    enabled             = true
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }
}

# api.develop.kitohealth.org -> api dev TG
resource "aws_lb_listener_rule" "api_dev" {
  listener_arn = var.https_listener_arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.api_dev.arn

    forward {
      target_group {
        arn    = aws_lb_target_group.api_dev.arn
        weight = 102
      }

      stickiness {
        enabled  = false
        duration = 3600
      }
    }
  }

  condition {
    host_header {
      values = ["api.develop.kitohealth.org"]
    }
  }
}
