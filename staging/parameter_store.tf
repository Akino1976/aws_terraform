resource "aws_ssm_parameter" "db_password" {
  name        = "${local.project}-password-${local.tags.environment}"
  description = "Database Password Paramater"
  type        = "SecureString"
  value       = random_password.db_password.result

  tags = {
    environment = "stage"
  }
}

resource "random_password" "db_password" {
  length           = 8
  special          = true
  override_special = "!#*"
}


data "aws_iam_policy_document" "for_ssm" {
  statement {
    effect   = "Allow"
    resources = [module.ssm_role.iam_role_arn]

    actions = [
      "ssm:GetParameter",
      "ssm:GetParameters",
    ]
  }
  version = "2012-10-17"
}

module "ssm_role" {
  source     = "../modules/iam"
  name       = "lambda-test-terraform"
  identifier = "lambda.amazonaws.com"
  policy     = data.aws_iam_policy_document.for_ssm.json
}

