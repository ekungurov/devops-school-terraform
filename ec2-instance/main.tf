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

/*
data "aws_security_group" "selected" {
  id = "sg-8d0f0dfe"
}

resource "aws_security_group" "new" {
  id = data.aws_security_group.selected.id
  ingress {
    from_port = 0
    protocol  = ""
    to_port   = 0
  }
}
*/

resource "aws_instance" "app_server" {
  ami                    = "ami-030e490c34394591b"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-8d0f0dfe", "sg-0a8b5db2a7dcca42a"]
  subnet_id              = "subnet-dc4a30b6"
  key_name               = "YK_DevOps_School"

  tags = {
    owner = "yevgeny_kungurov@epam.com"
  }
}
