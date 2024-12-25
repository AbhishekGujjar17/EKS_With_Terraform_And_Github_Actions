# Production Ready EKS Cluster with Terraform and GitHub Actions

![architecture_diagram](./eks_tf_github_actions.gif)

This project demonstrates how to configure a production-ready EKS (Elastic Kubernetes Service) cluster using Terraform (an Infrastructure as Code tool) and automate the deployment pipeline using GitHub Actions. The setup follows best practices for industry-level implementations.

## Overview

The project involves configuring a modular EKS cluster and automating its deployment through GitHub Actions. Key components include:

1. **Terraform**: Used to provision and manage AWS resources for the EKS cluster, including VPC, IAM roles, and EKS itself.
2. **GitHub Actions**: Automates the deployment process, ensuring consistent and repeatable infrastructure setups.

### Why GitHub Actions?

GitHub Actions is a trending CI/CD tool in the DevOps market, offering seamless integration with repositories and a wide range of features. This project provides an opportunity to explore its capabilities by automating the deployment of AWS infrastructure.

## Features

- **Modular Approach**: Resources for VPC, IAM, and EKS are organized into reusable modules.
- **Private Cluster Setup**: Configures a private EKS cluster with both ON-DEMAND and SPOT node groups for cost optimization.
- **CI/CD Integration**: Automates Terraform commands using GitHub Actions workflows.
- **Remote State Management**: Utilizes an S3 bucket for storing the Terraform state file and DynamoDB for state locking.

## Prerequisites

To get started, ensure the following:

1. **AWS Account**: Have an AWS account with appropriate permissions.
2. **Terraform Installed**: Install Terraform on your local machine.
3. **GitHub Repository Secrets**: Add AWS access and secret keys as secrets in your GitHub repository. Navigate to Settings > Secrets and variables > Actions and add the keys (`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`).

## Directory Structure

```
├── module
│   ├── data.tf
│   ├── vpc.tf
│   ├── iam.tf
│   ├── variables.tf
│   └── eks.tf

├── eks
│   ├── main.tf
│   ├── backend.tf
│   ├── variables.tf
│   └── dev.tfvars
├── .github
│   └── workflows
│       └── pipeline.yml
```

- **module/**: Contains modularized Terraform scripts for VPC, IAM, and EKS.
- **eks/**: Calls the module resources and provides environment-specific configurations.
- **.github/workflows/**: Contains the GitHub Actions workflow file for CI/CD.

## Deployment Steps

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/AbhishekGujjar17/EKS_With_Terraform_And_Github_Actions.git
   ```

2. **Initialize and Apply Terraform**:
    ```bash
     cd eks
    ```
   - Modify `backend.tf` for S3 bucket and DynamoDB table.
   - Initialize and validate Terraform:
     ```bash
     terraform init
     terraform validate
     ```
   - Plan and apply the infrastructure:
     ```bash
     terraform plan -var-file=dev.tfvars
     terraform apply -var-file=dev.tfvars --auto-approve
     ```

4. **Configure GitHub Actions**:

   - Add AWS credentials to your GitHub repository secrets.
   - Review and customize the workflow file (`.github/workflows/terraform.yaml`).

5. **Run GitHub Actions Workflow**:

   - Trigger the workflow manually through the Actions tab in your repository.
   - Provide the required parameters (e.g., `.tfvars` file path and action type).

6. **Validate Resources**:
   - Verify the creation of VPC, subnets, NAT gateway, EKS cluster, and node groups in the AWS Management Console.

## Cleanup

To avoid incurring unnecessary costs, destroy the resources:

```bash
terraform destroy
```

## Notes

- Ensure your configurations align with security best practices, such as using least privilege permissions and private subnets.
- The project can be customized to integrate other CI/CD tools or to adapt to specific organizational requirements.
- While this project isn't covered by the AWS free tier and may incur some costs, they typically range between $1 to $2 if you create, test, and then promptly destroy the resources. However, leaving them running continuously will result in a gradual increase in your bill.

## Questions?

For any inquiries, feel free to reach out at abhishekgujjar.info@gmail.com.
