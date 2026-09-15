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
  description = "Tag mutability - MUTABLE or IMMUTABLE"
  type        = string
  default     = "MUTABLE"

  validation {
    condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
    error_message = "Must be either MUTABLE or IMMUTABLE."
  }
}

variable "scan_on_push" {
  description = "Scan the image for vulnerabilities on push"
  type        = bool
  default     = false
}


variable "region" {
  description = "AWS region for all resources"
  type        = string
  default     = "eu-west-3"
}