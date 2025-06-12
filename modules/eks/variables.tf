variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for the cluster"
  type        = list(string)
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node group configurations"
  type        = any
  default     = {}
}

variable "self_managed_node_groups" {
  description = "Map of self managed node group configurations"
  type        = any
  default     = {}
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID for ExternalDNS"
  type        = string
}

variable "alb_controller_helm_version" {
  description = "Helm chart version for AWS Load Balancer Controller"
  type        = string
  default     = "1.7.1"
}

variable "external_dns_helm_version" {
  description = "Helm chart version for ExternalDNS"
  type        = string
  default     = "1.14.4"
}

variable "cluster_autoscaler_helm_version" {
  description = "Helm chart version for Cluster Autoscaler"
  type        = string
  default     = "9.29.3"
}

variable "metrics_server_helm_version" {
  description = "Helm chart version for Metrics Server"
  type        = string
  default     = "3.11.0"
}

variable "cluster_addons" {
  description = "Map of EKS cluster addons to enable"
  type        = any
  default = {
    coredns         = {}
    kube-proxy      = {}
    vpc-cni         = {}
    ebs-csi-driver  = {}
  }
}
