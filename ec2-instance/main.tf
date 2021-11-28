terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami             = "ami-030e490c34394591b"
  instance_type   = "t2.micro"
  security_groups = ["default", "epam-by-ru"]
  key_name        = "YK_DevOps_School"

  tags = {
    owner = "yevgeny_kungurov@epam.com"
  }
}
