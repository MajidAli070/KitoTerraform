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
  id = "arn:aws:ecs:eu-west-3:071691732057:task-definition/kito-app-task-dev:235"
}

import {
  to = aws_ecs_task_definition.api_dev
  id = "arn:aws:ecs:eu-west-3:071691732057:task-definition/kito-api-task-dev:9"
}

import {
  to = aws_ecs_service.app_dev
  id = "kito-health-app/kito-app-service-dev"
}

import {
  to = aws_ecs_service.api_dev
  id = "kito-health-app/kito-api-service-dev"
}

import {
  to = aws_lb_target_group.app_dev
  id = "arn:aws:elasticloadbalancing:eu-west-3:071691732057:targetgroup/kito-app-dev-tg-ecs/8f2295c203b3006e"
}

import {
  to = aws_lb_target_group.api_dev
  id = "arn:aws:elasticloadbalancing:eu-west-3:071691732057:targetgroup/kito-api-dev-tg-ecs/0f44dbbb956efe12"
}

import {
  to = aws_lb_listener_rule.api_dev
  id = "arn:aws:elasticloadbalancing:eu-west-3:071691732057:listener-rule/app/kito-app-alb/72f7d49b45b0a0dc/062745382e4cc22a/8d6227f78b6a2783"
}
