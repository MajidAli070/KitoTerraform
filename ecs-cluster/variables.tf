variable "jwt_secret" {
  description = "JWT signing secret (dev task definitions)"
  type        = string
  sensitive   = true
}

variable "api_access_key_id" {
  description = "Access_key_ID env var for kito-api dev container"
  type        = string
  sensitive   = true
}

variable "api_secret_access_key" {
  description = "Secret_access_key env var for kito-api dev container"
  type        = string
  sensitive   = true
}
