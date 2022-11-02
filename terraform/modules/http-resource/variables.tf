variable "project_name" {
  type        = string
  description = "The project name"
}

variable "environment" {
  type        = string
  description = "Environment that will be used"
}

variable "zip_file" {
  type        = string
  description = "Path to the zipfile to be deployed"
}

variable "resource_name" {
  type        = string
  description = "Lambda name"
}

variable "http_method" {
  type        = string
  description = "http method"
  default     = "GET"
}