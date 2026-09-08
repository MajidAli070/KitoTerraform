# =========================================================
# Existing AWS resources -> Terraform state (DEV only)
# Terraform 1.5+ import blocks: `terraform plan` se preview
# milta hai state ko chhue baghair.
#
# Import kamyab hone ke baad ye file delete ki ja sakti hai.
# Demo/prod ke liye baad mein alag env directory banegi.
# =========================================================

import {
  to = aws_ecs_cluster.main
  id = "kito-health-app"
}

import {
  to = aws_security_group.api_sg
  id = "sg-0ea655a1be8af9cce"
}

import {
  to = aws_iam_role.ecs_execution
  id = "ecsTaskExecutionRole"
}

import {
  to = aws_iam_role_policy_attachment.ecs_execution
  id = "ecsTaskExecutionRole/arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

import {
  to = aws_ecs_task_definition.app_dev
  id = "arn:aws:ecs:eu-west-3:071691732057:task-definition/kito-app-task-dev:231"
}

import {
  to = aws_ecs_task_definition.api_dev
  id = "arn:aws:ecs:eu-west-3:071691732057:task-definition/kito-api-task-dev:8"
}

import {
  to = aws_ecs_service.app_dev
  id = "kito-health-app/kito-app-service-dev"
}

import {
  to = aws_ecs_service.api_dev
  id = "kito-health-app/kito-api-service-dev"
}
