# ---------------- APP ----------------
resource "aws_ecs_task_definition" "app_dev" {
  family                   = "kito-app-task-dev"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "512"
  memory                   = "1024"
  execution_role_arn       = aws_iam_role.ecs_execution.arn
  task_role_arn            = aws_iam_role.ecs_execution.arn

  container_definitions = jsonencode([
    {
      name      = "kito-app-container-dev"
      image     = "071691732057.dkr.ecr.eu-west-3.amazonaws.com/kitoapp:77fb891"
      cpu       = 0
      essential = true

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]

      environment = [
        { name = "JWT_SECRET", value = var.jwt_secret }
      ]

      environmentFiles = []
      mountPoints      = []
      volumesFrom      = []
      ulimits          = []
      systemControls   = []

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "dev-logs"
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
  family                   = "kito-api-task-dev"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_execution.arn
  task_role_arn            = aws_iam_role.ecs_execution.arn

  container_definitions = jsonencode([
    {
      name      = "kito-api-container-dev"
      image     = "071691732057.dkr.ecr.eu-west-3.amazonaws.com/kitoapi:6e8b88e-4"
      cpu       = 0
      essential = true

      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
          protocol      = "tcp"
        }
      ]

      environment = [
        { name = "Secret_access_key", value = var.api_secret_access_key },
        { name = "JWT_SECRET", value = var.jwt_secret },
        { name = "Access_key_ID", value = var.api_access_key_id }
      ]

      mountPoints    = []
      volumesFrom    = []
      systemControls = []

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "dev-logs"
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
