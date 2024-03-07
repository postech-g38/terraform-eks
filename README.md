# Terraform AWS EKS Cluster Setup

This Terraform script allows you to easily provision an Amazon EKS (Elastic Kubernetes Service) cluster on AWS. Amazon EKS is a managed Kubernetes service that makes it easy to deploy, manage, and scale containerized applications using Kubernetes.

## Prerequisites

Before you begin, ensure you have the following:

- AWS account with appropriate permissions to create EKS clusters.
- Terraform installed on your local machine. You can download it from [here](https://www.terraform.io/downloads.html).
- AWS CLI installed and configured with appropriate credentials. You can download it from [here](https://aws.amazon.com/cli/).

## Setup Instructions

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/your-username/terraform-eks-cluster.git
    ```

2. Navigate to the cloned directory:

    ```bash
    cd terraform-eks-cluster
    ```

3. Create a `terraform.tfvars` file and provide necessary variables. You can use the `terraform.tfvars.example` as a template.

    ```bash
    cp terraform.tfvars.example terraform.tfvars
    ```

4. Modify the `terraform.tfvars` file with your AWS credentials and desired configurations for the EKS cluster.

5. Initialize Terraform:

    ```bash
    terraform init
    ```

6. Review the execution plan:

    ```bash
    terraform plan
    ```

7. Apply the Terraform configuration to create the EKS cluster:

    ```bash
    terraform apply
    ```

8. Once the cluster is provisioned, configure `kubectl` to communicate with the newly created EKS cluster:

    ```bash
    aws eks --region <region> update-kubeconfig --name <cluster_name>
    ```

    Replace `<region>` and `<cluster_name>` with your AWS region and EKS cluster name.

9. Verify that `kubectl` is configured correctly and you can access the EKS cluster:

    ```bash
    kubectl get nodes
    ```

## Cleanup

To avoid incurring charges, make sure to destroy the EKS cluster after you are done testing:

```bash
terraform destroy