terraform {
  required_version = "0.13.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  version = "~> 3.0"
  profile = "profile_name"
}

terraform {
  backend "s3" {
    profile = "profile_name"
    bucket         = "company-terraform-state-bucket"
    key            = "staging/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-table"
    encrypt        = true
    skip_region_validation = true
  }
}
