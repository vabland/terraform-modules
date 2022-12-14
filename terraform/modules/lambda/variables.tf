variable "project_name" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "Environment that will be used"
}

variable "lambda_name" {
  type        = string
  description = "Lambda name used"
}

variable "zip_file" {
  type        = string
  description = "Path to the zipfile to be deployed"
}

variable "zip_source_code_hash" {
  type        = string
  description = "Source code hash to check if changed"
}

variable "env_variables" {
  type = list(object({
    variables = map(string)
  }))
  default = [{
    variables = {
      "some-key" = "some-value"
    }
  }]
}