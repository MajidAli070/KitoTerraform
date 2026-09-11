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
  description = "Task execution role — live :235/:9 secrets wala role use karte hain"
  type        = string
  default     = "arn:aws:iam::071691732057:role/ecsTaskExecutionRole-secrets"
}

variable "dev_secret_arn" {
  description = "kito_dev_api secret ka full ARN — ECS secrets valueFrom ke liye"
  type        = string
  default     = "arn:aws:secretsmanager:eu-west-3:071691732057:secret:kito_dev_api-cH6qc9"
}
