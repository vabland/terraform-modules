variable "project_name" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "Environment that will be used"
}

variable "resource_name" {
  type        = string
  description = "HTTP Api Gateway resource name"
}

variable "http_method" {
  type        = string
  description = "http method"
  default     = "GET"
}

variable "lambda_invoke_arn" {
  type        = string
  description = "Lambda arn to be triggered by this resource integration"
}

variable "lambda_function_name" {
  type        = string
  description = "Lambda Function name"
}