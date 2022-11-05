variable "project_name" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "Environment that will be used"
}

variable "route_key" {
  type        = string
  description = "Route Key used by websocket API to redirect to a given lambda name"
  default     = "$default"
}

variable "lambda_function_name" {
  type        = string
  description = "Lambda Function name"
}

variable "lambda_function_invoke_arn" {
  type        = string
  description = "Lambda Invoke Arn"
}