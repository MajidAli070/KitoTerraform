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
