variable "app_repo_name" {
  description = "ECR repository name for the app image"
  type        = string
  default     = "kitoapp"
}

variable "api_repo_name" {
  description = "ECR repository name for the api image"
  type        = string
  default     = "kitoapi"
}

variable "image_tag_mutability" {
  description = "Tag mutability — MUTABLE ya IMMUTABLE"
  type        = string
  default     = "MUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
    error_message = "MUTABLE ya IMMUTABLE hona chahiye."
  }
}

variable "scan_on_push" {
  description = "Push par image vulnerability scan"
  type        = bool
  default     = false
}


variable "region" {
  description = "AWS region for all resources"
  type        = string
  default     = "eu-west-3"
}