# ---------------- APP ----------------
resource "aws_ecs_service" "app_dev" {
  name                    = "kito-app-service-dev"
  cluster                 = aws_ecs_cluster.main.arn
  task_definition         = "${aws_ecs_task_definition.app_dev.family}:${aws_ecs_task_definition.app_dev.revision}"
  desired_count           = 1
  enable_ecs_managed_tags = true
  platform_version        = "1.4.0"

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
    base              = 0
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    subnets = [
      "subnet-03b1861fac149e9e7",
      "subnet-051265b4a5b611e69",
      "subnet-0f7750747b692eba1"
    ]
    security_groups  = ["sg-0f8069cc8c273ac7a"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-3:071691732057:targetgroup/kito-app-dev-tg-ecs/8f2295c203b3006e"
    container_name   = "kito-app-container-dev"
    container_port   = 80
  }
}

# ---------------- API ----------------
resource "aws_ecs_service" "api_dev" {
  name                    = "kito-api-service-dev"
  cluster                 = aws_ecs_cluster.main.arn
  task_definition         = "${aws_ecs_task_definition.api_dev.family}:${aws_ecs_task_definition.api_dev.revision}"
  desired_count           = 1
  enable_ecs_managed_tags = true
  platform_version        = "LATEST"

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
    base              = 0
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    subnets = [
      "subnet-03b1861fac149e9e7",
      "subnet-051265b4a5b611e69",
      "subnet-0f7750747b692eba1"
    ]
    security_groups  = ["sg-0ea655a1be8af9cce"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-3:071691732057:targetgroup/kito-api-dev-tg-ecs/0f44dbbb956efe12"
    container_name   = "kito-api-container-dev"
    container_port   = 8000
  }
}
