terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_user_arn" {
  value = data.aws_caller_identity.current.arn
}

resource "aws_security_group" "web_sg" {
  name        = "terraform-web-sg"
  description = "Security Group created by Terraform"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "aws_instance" "webserver" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  key_name = "terraform-key"

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install nginx -y
              systemctl enable nginx
              systemctl start nginx
              echo "<h1>Hello from Terraform + Nginx + AWS</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Terraform-WebServer"
  }
}
