provider "aws" {
  alias      = "general"
  region     = var.region
  access_key = var.aws_general_access_key
  secret_key = var.aws_general_secret_key
}

provider "aws" {
  alias      = "environment"
  region     = var.region
  access_key = var.aws_env_access_key
  secret_key = var.aws_env_secret_key
}

module "example" {
  source = "./modules/example"

  providers = {
    aws.general     = aws.general
    aws.environment = aws.environment
  }

  project_name = var.project_name
  environment  = var.environment
  domain       = var.domain
}