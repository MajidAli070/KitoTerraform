# ---------------- APP ----------------
resource "aws_ecs_task_definition" "app_dev" {
  family                   = var.app_task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_execution.arn
  task_role_arn            = aws_iam_role.ecs_execution.arn

  container_definitions = jsonencode([
    {
      name      = var.app_container_name
      image     = "071691732057.dkr.ecr.eu-west-3.amazonaws.com/${var.app_image_repo}:${var.app_image_tag}"
      cpu       = 0
      essential = true

      portMappings = [
        {
          name          = "kitoapp-nginix"
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]

      environment = [
        { name = "JWT_SECRET", value = local.dev_env.JWT_SECRET }
      ]

      environmentFiles = []
      mountPoints      = []
      volumesFrom      = []
      ulimits          = []
      systemControls   = []

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = var.log_group
          "awslogs-create-group"  = "true"
          "awslogs-region"        = "eu-west-3"
          "awslogs-stream-prefix" = "ecs"
        }
        secretOptions = []
      }
    }
  ])
}

# ---------------- API ----------------
resource "aws_ecs_task_definition" "api_dev" {
  family                   = var.api_task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution.arn
  task_role_arn            = aws_iam_role.ecs_execution.arn

  container_definitions = jsonencode([
    {
      name      = var.api_container_name
      image     = "071691732057.dkr.ecr.eu-west-3.amazonaws.com/${var.api_image_repo}:${var.api_image_tag}"
      cpu       = 0
      essential = true

      portMappings = [
        {
          name          = "kitoapi-container-8000-tcp"
          containerPort = 8000
          hostPort      = 8000
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]

      environment = [
        { name = "Secret_access_key", value = local.dev_env.Secret_access_key },
        { name = "JWT_SECRET", value = local.dev_env.JWT_SECRET },
        { name = "Access_key_ID", value = local.dev_env.Access_key_ID }

      ]

      mountPoints    = []
      volumesFrom    = []
      systemControls = []

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = var.log_group
          "mode"                  = "non-blocking"
          "awslogs-create-group"  = "true"
          "max-buffer-size"       = "25m"
          "awslogs-region"        = "eu-west-3"
          "awslogs-stream-prefix" = "ecs"
        }
        secretOptions = []
      }
    }
  ])
}
