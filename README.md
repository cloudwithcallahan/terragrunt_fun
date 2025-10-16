# Terragrunt Fun - AWS Infrastructure Management

This repository demonstrates the evolution of infrastructure-as-code management using Terragrunt with AWS, showcasing different approaches to structure and maintain infrastructure code.

## Project Structure

The repository contains multiple versions of infrastructure management, each demonstrating different levels of code reuse and maintainability:

### Version 1 (`infrastructure-live-v1/`)
- Basic Terraform structure without Terragrunt
- Separate configurations for dev and staging environments
- Manual copying of code between environments

### Version 2 (`infrastructure-live-v2/`)
- Simplified Terraform structure
- Reduced code duplication
- Still requires manual environment management

### Version 3 (`infrastructure-live-v3/`)
- Introduction of Terragrunt
- Basic code reuse between environments
- Single source of truth for module configurations

### Version 4 (`infrastructure-live-v4/`) - Current Best Practice
- Advanced Terragrunt implementation
- Complete DRY (Don't Repeat Yourself) approach
- Includes:
  - VPC configuration
  - EKS cluster setup
  - Kubernetes addons (including cluster autoscaler)
  - Environment-specific configurations

### Modules (`infrastructure-modules/`)
Reusable Terraform modules for:
- VPC
- EKS
- Kubernetes addons

## Prerequisites

- Terraform >= 1.0
- Terragrunt >= 0.36
- AWS CLI configured with appropriate credentials
- kubectl (for Kubernetes operations)

## Usage

1. Navigate to the desired version and environment:
   ```bash
   cd infrastructure-live-v4/dev
   ```

2. Deploy infrastructure:
   ```bash
   terragrunt run-all plan    # Review changes
   terragrunt run-all apply   # Apply changes
   ```

## Module Dependencies

The modules are designed to be deployed in the following order:
1. VPC
2. EKS
3. Kubernetes Addons

Terragrunt will automatically handle these dependencies based on the configurations.

## Environment Management

Each environment (dev, staging) has its own configuration while sharing the same underlying module code. Environment-specific variables are managed through:
- `env.hcl` files
- Terragrunt input variables
- AWS provider configurations

## Security Considerations

- OIDC provider integration for EKS
- IAM roles for service accounts
- Network segregation with proper VPC configuration
- Secure cluster access management

## Credit
Anton Putra, updated his version