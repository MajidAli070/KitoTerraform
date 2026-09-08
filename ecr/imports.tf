# =========================================================
# Existing ECR repositories -> Terraform state (DEV only)
# Terraform 1.5+ import blocks: `terraform plan` se preview
# milta hai state ko chhue baghair.
#
# Import kamyab hone ke baad ye file delete ki ja sakti hai.
#
# NOTE: demo/prod ke repos abhi manage nahi ho rahe:
#   kito-app-demo, kito-api-demo, kito-app-prod, kito-api-prod
# =========================================================

import {
  to = aws_ecr_repository.app
  id = "kitoapp"
}

import {
  to = aws_ecr_repository.api
  id = "kitoapi"
}
