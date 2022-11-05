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
  ws_api_gateway_ssm_api_id_key = format("%s-ws-api-gateway-api-id", var.project_name)
  operation_name                = format("%s-operation-%s", var.project_name, var.route_key)
}

data "aws_ssm_parameter" "this" {
  provider = aws.environment

  name = local.ws_api_gateway_ssm_api_id_key
}

resource "aws_apigatewayv2_integration" "this" {
  provider = aws.environment

  api_id = data.aws_ssm_parameter.this.value

  connection_type      = "INTERNET"
  description          = local.operation_name
  integration_type     = "AWS_PROXY"
  integration_method   = "POST"
  integration_uri      = var.lambda_function_invoke_arn
  passthrough_behavior = "NEVER"
}

resource "aws_apigatewayv2_route" "this" {
  provider = aws.environment

  depends_on = [
    aws_apigatewayv2_integration.this
  ]

  api_id = data.aws_ssm_parameter.this.value

  route_key          = var.route_key
  operation_name     = local.operation_name
  authorization_type = "NONE"
  target             = format("integrations/%s", aws_apigatewayv2_integration.this.id)
}

resource "aws_lambda_permission" "this" {
  provider = aws.environment

  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"
}