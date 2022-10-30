variable "region" {
  type        = string
  description = "The region name"
}

variable "project_name" {
  type        = string
  description = "The project name"
}

variable "domain" {
  type        = string
  description = "The domain address"
}

variable "environment" {
  type        = string
  description = "The current environment"
}

variable "aws_env_access_key" {
  type        = string
  description = "AWS Access Key for current environment"
}

variable "aws_env_secret_key" {
  type        = string
  description = "AWS Secret Key for current environment"
}

variable "aws_general_access_key" {
  type        = string
  description = "AWS Access Key for general environment"
}

variable "aws_general_secret_key" {
  type        = string
  description = "AWS Secret Key for general environment"
}