# Terraform EKS Module

This repository provides a reusable Terraform module for deploying an Amazon EKS
cluster and a folder structure for managing multiple environments.

## Module Usage

The module is located in [`modules/eks`](modules/eks) and wraps the official
[`terraform-aws-modules/eks`](https://github.com/terraform-aws-modules/terraform-aws-eks)
module. It also installs common addons such as the AWS Load Balancer Controller,
ExternalDNS, Cluster Autoscaler and Metrics Server via Helm. Default EKS
add-ons including CoreDNS, kube-proxy, VPC CNI and the EBS CSI driver are
enabled.

### Example

```hcl
module "eks" {
  source = "../../modules/eks"

  region        = var.region
  cluster_name  = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id        = var.vpc_id
  subnet_ids    = var.subnet_ids

  eks_managed_node_groups  = var.eks_managed_node_groups
  self_managed_node_groups = var.self_managed_node_groups

  tags            = var.tags
  route53_zone_id = var.route53_zone_id
  cluster_addons  = var.cluster_addons
  cluster_autoscaler_helm_version = var.cluster_autoscaler_helm_version
  metrics_server_helm_version     = var.metrics_server_helm_version
}
```

Input variables are defined in [`modules/eks/variables.tf`](modules/eks/variables.tf)
and outputs are in [`modules/eks/outputs.tf`](modules/eks/outputs.tf).

## Environments

Environment specific configurations live under the [`environments`](environments)
folder. Each environment (`dev`, `stage`, `prod`) contains Terraform code that
invokes the EKS module with settings for that environment.

```
environments/
  dev/
  stage/
  prod/
```

Each environment includes a sample `terraform.tfvars.example` file that shows
how to set input variables. Copy this file to `terraform.tfvars` and modify it
for your environment.

### Deploying

1. Change into the desired environment directory, e.g. `cd environments/dev`.
2. Create a `terraform.tfvars` file or set variables via CLI.
3. Initialize and apply:

```bash
terraform init
terraform apply
```

Backend configuration for state storage is defined in each environment's
`main.tf`. Update the S3 bucket or key as needed.

## Requirements

- Terraform 0.14 or later
- AWS credentials configured in your environment

## License

MIT
