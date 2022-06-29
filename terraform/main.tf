provider "aws" {
  default_tags {
    tags = {
      Project   = "AWS ECR"
      Lesson    = "15"
      Terraform = "True"
    }
  }
}

locals {
  registry_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"
}

resource "aws_ecr_repository" "example_app" {
  name = var.ecr_repo_name
  image_scanning_configuration {
    scan_on_push = true
  }
}

output "repo_name" {
  value     = local.registry_url
  sensitive = false
}
