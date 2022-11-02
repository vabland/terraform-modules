terraform {
  required_version = "1.3.3"

  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "4.36.1"
      configuration_aliases = [aws.general, aws.environment]
    }
  }
}

locals {
  lambda_exec_role_name = format("%s-lambda-exec-role", var.project_name)
  lambda_name           = format("%s-%s-%s", var.project_name, var.environment, var.lambda_name)
}

######################################################## lambda
data "aws_iam_role" "this" {
  provider = aws.environment

  name = local.lambda_exec_role_name
}

resource "aws_lambda_function" "this" {
  provider = aws.environment

  function_name = local.lambda_name
  role          = data.aws_iam_role.this.arn

  filename = var.zip_file
  handler  = "index.handler"

  dynamic "environment" {
    for_each = var.env_variables

    content {
      variables = environment.value.variables
    }
  }

  runtime = "nodejs16.x"

  tracing_config {
    mode = "Active"
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

output "invoke_arn" {
  value = aws_lambda_function.this.invoke_arn
}

output "function_name" {
  value = aws_lambda_function.this.function_name
}

output "arn" {
  value = aws_lambda_function.this.arn
}