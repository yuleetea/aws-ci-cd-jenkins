terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

# i'm creating a resource that is an aws_instance, CALLED app_server
resource "aws_instance" "app_server" {
  ami           = "ami-07761f3ae34c4478d"
  instance_type = "t2.micro"
  # the first argument the file method takes is the path to the file
  user_data = file("./ec2_bash_script.sh")
  # this is for the key pair, if the keypair exists in same directory then you dont need to add the .pem extension for it
  key_name      = "mykeypair"

  // reference security group and place ec2 instance inside of it, has permissions to ssh/http/https/and port forwarding 8080 for jenkins
  security_groups = ["WebServerSG"]

  tags = {
    Name = "TerraformServer"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("./mykeypair.pem") # Replace with the path to your key pair's private key file
  }
}

# resource "aws_security_group" "terraform_sg" {
#   name        = "terraform_sg"
#   description = "My security group for EC2 instances built with Terraform"

#   // Inbound rules
#   # for inbound rules I want SSH, HTTP, and HTTPS
#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["100.34.2.23/32"]  // Allow SSH access from my IP only
#   }

#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  // Allow HTTPS access from anywhere
#   }

#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  // Allow HTTP access from anywhere
#   }

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]  // 8080 for jenkins
#   }

#   // Outbound rules
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]  // Allow all outbound traffic
#   }
# }

// next steps: store state file in s3 bucket

