resource "aws_ecs_cluster" "main" {
  name = "kito-health-app"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}