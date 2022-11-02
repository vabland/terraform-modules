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
  http_api_gateway_ssm_api_id_key = format("%s-http-api-gateway-api-id", var.project_name)
  route_key                       = format("%s /%s", upper(var.http_method), var.resource_name)
}

data "aws_ssm_parameter" "this" {
  provider = aws.environment

  name = local.http_api_gateway_ssm_api_id_key
}

data "aws_apigatewayv2_api" "this" {
  provider = aws.environment

  api_id = data.aws_ssm_parameter.this.value
}

resource "aws_apigatewayv2_integration" "this" {
  provider = aws.environment

  api_id           = data.aws_apigatewayv2_api.this.id
  integration_type = "AWS_PROXY"

  integration_method = "POST"
  integration_uri    = var.lambda_invoke_arn

  connection_type = "INTERNET"
}

resource "aws_apigatewayv2_route" "this" {
  provider = aws.environment

  api_id = data.aws_apigatewayv2_api.this.id

  route_key = local.route_key
  target    = "integrations/${aws_apigatewayv2_integration.this.id}"
}

resource "aws_lambda_permission" "this" {
  provider = aws.environment

  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "apigateway.amazonaws.com"

  # The /*/*/* part allows invocation from any stage, method and resource path
  # within API Gateway REST API.
  source_arn = "${data.aws_apigatewayv2_api.this.execution_arn}/*/*/${var.resource_name}"
}