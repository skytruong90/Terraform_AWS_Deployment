# Specify the Terraform version and the provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.12"
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}

# Create an EC2 instance for the front-end
resource "aws_instance" "app_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use an appropriate AMI for your region
  instance_type = "t2.micro"

  tags = {
    Name = "FrontEnd"
  }
}

# Create an RDS instance for the database backend
resource "aws_db_instance" "app_db" {
  instance_class   = "db.t2.micro"
  allocated_storage = 20
  engine           = "mysql"
  engine_version   = "8.0"
  instance_class   = "db.t2.micro"
  name             = "appdb"
  username         = "dbuser"
  password         = "securepassword"
  publicly_accessible = true

  tags = {
    Name = "BackEndDB"
  }
}

# Output the public IP of the EC2 instance
output "public_ip" {
  value = aws_instance.app_instance.public_ip
}

# Output the database endpoint
output "db_endpoint" {
  value = aws_db_instance.app_db.address
}
