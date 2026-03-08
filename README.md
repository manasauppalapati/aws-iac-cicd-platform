# AWS Infrastructure as Code & CI/CD Automation Platform

Production-style Terraform project demonstrating reusable modules, remote state, and CI/CD automation for AWS infrastructure.

## What this project includes

- Reusable Terraform modules for:
  - VPC networking
  - ECS cluster
  - IAM role for CI/CD
- Environment-based deployment structure (`environments/dev`)
- Remote Terraform state configuration example using S3 + DynamoDB locking
- GitHub Actions workflow for `fmt`, `validate`, and `plan`
- Example architecture documentation ready for GitHub portfolio use

## Architecture

This project provisions:

- A VPC with public and private subnets across two availability zones
- Internet Gateway and NAT Gateway
- Route tables for public and private routing
- An ECS cluster for container workloads
- IAM role and policy for CI/CD-driven Terraform execution

## Repository Structure

```text
aws-iac-cicd-platform/
├── .github/workflows/terraform.yml
├── environments/dev/
│   ├── backend.hcl.example
│   ├── main.tf
│   ├── outputs.tf
│   ├── terraform.tfvars.example
│   ├── variables.tf
│   └── versions.tf
├── modules/
│   ├── ecs_cluster/
│   ├── iam_ci_cd/
│   └── vpc/
└── README.md
```

## Remote State

This project is designed to use remote state with:

- **S3 backend** for Terraform state storage
- **DynamoDB table** for state locking

Example init command:

```bash
tfenv use 1.6.6 || true
cd environments/dev
terraform init -backend-config=backend.hcl.example
terraform plan -var-file=terraform.tfvars.example
```

## GitHub Actions CI/CD

The included workflow runs on pull requests and pushes:

- `terraform fmt -check`
- `terraform init`
- `terraform validate`
- `terraform plan`

To enable plan in GitHub Actions, add these repository secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

For production usage, prefer GitHub OIDC + AWS IAM role assumption instead of long-lived secrets.

## How to use

1. Create an S3 bucket for Terraform state.
2. Create a DynamoDB table for state locking.
3. Copy `backend.hcl.example` and update values.
4. Copy `terraform.tfvars.example` to `terraform.tfvars` and fill in values.
5. Run:

```bash
cd environments/dev
terraform init -backend-config=backend.hcl.example
terraform fmt -recursive
terraform validate
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars
```

## Resume-ready highlights

- Designed reusable Terraform modules for AWS networking and ECS
- Implemented remote Terraform state with S3 backend and DynamoDB locking
- Automated Terraform validation and plan checks using GitHub Actions
- Standardized environment provisioning and reduced configuration drift

## Suggested GitHub repo name

`aws-iac-cicd-platform`

## Suggested commit message

`Initial commit: reusable Terraform modules with CI/CD and remote state`
