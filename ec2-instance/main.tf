terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

  backend "local" {
    path = "../terraform.tfstate"
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-030e490c34394591b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0d8622a1aab1b77ce", "sg-04c43975b00d95343"]
  key_name               = "yk-my-aws-keypair"

  tags = {
    owner = "yevgeny_kungurov@epam.com"
  }
  
  volume_tags = {
    owner = "yevgeny_kungurov@epam.com"
  }  
}
