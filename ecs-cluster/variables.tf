# ---------------- APP ----------------
variable "app_task_family" {
  description = "App task definition family name"
  type        = string
  default     = "kito-app-task-dev"
}

variable "app_container_name" {
  description = "App container name - must match services.tf load_balancer"
  type        = string
  default     = "kito-app-container-dev"
}

variable "app_image_repo" {
  description = "App ECR repository name"
  type        = string
  default     = "kitoapp"
}

variable "app_image_tag" {
  description = "App image tag"
  type        = string
  default     = "77fb891"
}

# ---------------- API ----------------
variable "api_task_family" {
  description = "API task definition family name"
  type        = string
  default     = "kito-api-task-dev"
}

variable "api_container_name" {
  description = "API container name - must match services.tf load_balancer"
  type        = string
  default     = "kito-api-container-dev"
}

variable "api_image_repo" {
  description = "API ECR repository name"
  type        = string
  default     = "kitoapi"
}

variable "api_image_tag" {
  description = "API image tag"
  type        = string
  default     = "6e8b88e-4"
}

# ---------------- SHARED ----------------
variable "log_group" {
  description = "CloudWatch log group for both tasks"
  type        = string
  default     = "dev-logs"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-3"
}

# ---------------- IAM / SECRETS ----------------
variable "execution_role_arn" {
  description = "Task execution role - the secrets-enabled role used by live :235/:9"
  type        = string
  default     = "arn:aws:iam::071691732057:role/ecsTaskExecutionRole-secrets"
}

variable "dev_secret_arn" {
  description = "Full ARN of the kito_dev_api secret - used by ECS secrets valueFrom"
  type        = string
  default     = "arn:aws:secretsmanager:eu-west-3:071691732057:secret:kito_dev_api-cH6qc9"
}

# ---------------- ALB ----------------
variable "https_listener_arn" {
  description = "kito-app-alb HTTPS :443 listener - shared, not managed here"
  type        = string
  default     = "arn:aws:elasticloadbalancing:eu-west-3:071691732057:listener/app/kito-app-alb/72f7d49b45b0a0dc/062745382e4cc22a"
}

variable "vpc_id" {
  description = "KitoHealth shared VPC - dev, demo and prod all live in it"
  type        = string
  default     = "vpc-0f95db2f47b2c74be"
}

variable "app_tg_name" {
  description = "App target group name - ForceNew, must match live exactly"
  type        = string
  default     = "kito-app-dev-tg-ecs"
}

variable "app_tg_port" {
  description = "App target group port"
  type        = number
  default     = 80
}

variable "api_tg_name" {
  description = "API target group name - ForceNew, must match live exactly"
  type        = string
  default     = "kito-api-dev-tg-ecs"
}

variable "api_tg_port" {
  description = "API target group port - TG is on 80, container is on 8000"
  type        = number
  default     = 80
}
