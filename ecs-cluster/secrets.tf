data "aws_secretsmanager_secret_version" "dev" {
  secret_id = "kito_dev_api"
}

locals {
  dev_env = jsondecode(data.aws_secretsmanager_secret_version.dev.secret_string)
}
