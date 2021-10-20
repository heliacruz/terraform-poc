terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  access_key = ""
  secret_key = ""
}

# launch an ec2
resource "aws_instance" "instance_created_from_terrafrom" {
  ami = "ami-0a9d27a9f4f5c0efc"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0bba1a2896d708ad9"]
  key_name = "DevOps Learning"
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<p> My Instance! </p>" >> /var/www/html/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  EOF
  
  tags = {
    "Name"      = "Created from terraform"
    "Terraform" = "true"
  }
  
}

