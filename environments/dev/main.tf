terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0"
    }
  }
  backend "s3" {
    bucket = "my-terraform-state"
    key    = "eks/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

module "eks" {
  source = "../../modules/eks"

  region                    = var.region
  cluster_name              = var.cluster_name
  cluster_version           = var.cluster_version
  vpc_id                    = var.vpc_id
  subnet_ids                = var.subnet_ids
  eks_managed_node_groups   = var.eks_managed_node_groups
  self_managed_node_groups  = var.self_managed_node_groups
  tags                      = var.tags
  route53_zone_id           = var.route53_zone_id
  alb_controller_helm_version = var.alb_controller_helm_version
  external_dns_helm_version   = var.external_dns_helm_version
  cluster_autoscaler_helm_version = var.cluster_autoscaler_helm_version
  metrics_server_helm_version     = var.metrics_server_helm_version
  cluster_addons                  = var.cluster_addons
}
