variable "region" {
  type        = string
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "cluster_version" {
  type        = string
  default     = "1.29"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets IDs"
}

variable "eks_managed_node_groups" {
  type    = any
  default = {}
}

variable "self_managed_node_groups" {
  type    = any
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "route53_zone_id" {
  type        = string
  description = "Route53 zone ID"
}

variable "alb_controller_helm_version" {
  type    = string
  default = "1.7.1"
}

variable "external_dns_helm_version" {
  type    = string
  default = "1.14.4"
}

variable "cluster_autoscaler_helm_version" {
  type    = string
  default = "9.29.3"
}

variable "metrics_server_helm_version" {
  type    = string
  default = "3.11.0"
}

variable "cluster_addons" {
  type    = any
  default = {
    coredns        = {}
    kube-proxy     = {}
    vpc-cni        = {}
    ebs-csi-driver = {}
  }
}
