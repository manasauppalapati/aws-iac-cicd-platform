# AWS Infrastructure as Code & CI/CD Automation Platform
Designed and implemented reusable Terraform modules and automated CI/CD pipelines for enterprise AWS infrastructure.

## Overview
This project demonstrates a production-style Infrastructure as Code (IaC) and CI/CD setup for AWS using Terraform, GitHub Actions, and modular deployment patterns. The goal is to provide a repeatable, secure, and scalable way to deploy cloud infrastructure across multiple environments.

## Key Features

- Reusable Terraform modules for AWS infrastructure
- Automated CI/CD pipelines using GitHub Actions
- Remote Terraform state management using S3 backend with state locking
- Secure infrastructure provisioning using IAM roles and encryption
- Modular architecture supporting dev, QA, and production environments
- Reduced infrastructure provisioning time through automation

## Technology Stack
- Terraform
- AWS (EC2, VPC, IAM, RDS, ECS, S3)
- GitHub Actions
- Infrastructure as Code (IaC)
- Docker and container-based workloads

## Project Structure
```text
aws-iac-cicd-platform/
├── .github/
│   └── workflows/
│       └── terraform.yml
├── environments/
│   └── dev/
│       ├── backend.hcl.example
│       ├── main.tf
│       ├── outputs.tf
│       ├── terraform.tfvars.example
│       ├── variables.tf
│       └── versions.tf
├── modules/
│   ├── ecs_cluster/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── iam_ci_cd/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── vpc/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── .gitignore
└── README.md
```


## CI/CD Workflow
The GitHub Actions pipeline validates Terraform code and ensures infrastructure changes follow best practices.
1.	Checkout repository
2.	Set up Terraform environment
3.	Run terraform fmt to enforce formatting standards
4.	Run terraform init to initialize backend
5.	Run terraform validate to check configuration syntax
6.	Run terraform plan to preview infrastructure changes
   
## Remote State Management
Terraform remote state is configured using an S3 backend. State locking prevents concurrent updates to infrastructure, allowing safe collaboration among multiple engineers.

## Security Practices
•	Role-based access control using AWS IAM
•	Encryption using AWS Key Management Service (KMS)
•	Secrets management using AWS Secrets Manager
•	Secure infrastructure deployments through controlled CI/CD pipelines

## Use Cases
•	Provision repeatable AWS infrastructure environments
•	Automate deployment pipelines for cloud infrastructure
•	Standardize DevOps workflows using Infrastructure as Code
•	Enable secure and scalable cloud infrastructure deployments

## Future Enhancements
•	Add Terraform security scanning
•	Add ECS service deployment examples
•	Add monitoring integration with CloudWatch
•	Add multi-environment promotion pipelines

## Author
Sri Lakshmi Manasa Uppalapati
