# Terraform AWS Deployment of a Web Application

## Introduction

This project focuses on deploying a basic web application on AWS using Terraform. The aim is to create a practical learning environment for deploying cloud infrastructure and understanding the nuances of managing web applications in the cloud.

## Project Overview

The project deploys a simple web application that includes a front-end serving as the user interface and a back-end managing a database. Docker containers encapsulate these components to maintain consistency across environments. Terraform is used to automate the provisioning of the required AWS resources.

### Learning Goals

- **Terraform:** Deepen understanding of Infrastructure as Code to automate the provisioning and management of AWS resources.
- **Docker:** Learn to containerize applications to ensure environmental consistency.
- **AWS Services:** Gain hands-on experience with AWS services essential for hosting web applications, such as EC2, RDS, and Elastic Load Balancing.

### Objectives

- **Deploy a Multi-Service Application:** Set up a multi-service web application consisting of a front-end and a database backend.
- **Automate Infrastructure with Terraform:** Use Terraform to write, plan, and create infrastructure as per defined configurations.
- **Experience with AWS:** Utilize various AWS services to host and manage the application, ensuring scalability and security.

## Terraform Deployment

This section outlines the basic Terraform setup needed to deploy the application on AWS:

1. **AWS Provider Configuration:** Configure Terraform to manage resources in AWS.
2. **Resource Definition:** Define resources like AWS EC2 for the front-end and AWS RDS for the database.
3. **Execution Plan:** Terraform will perform the plan to ensure the execution will result as expected.
4. **Apply Changes:** Execute the plan to create the defined resources.

### Terraform Configuration

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "FrontEnd"
  }
}

resource "aws_db_instance" "app_db" {
  instance_class = "db.t2.micro"
  engine         = "mysql"
  username       = "dbuser"
  password       = "securepassword"
  allocated_storage = 20
}
```

## Conclusion

This simplified project provides a foundational approach to deploying a web application using Terraform on AWS. It serves as a starting point for anyone interested in learning how to efficiently manage cloud resources and automate web application deployment.
