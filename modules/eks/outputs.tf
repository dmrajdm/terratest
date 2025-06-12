output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID of the cluster"
  value       = module.eks.cluster_security_group_id
}

output "node_groups_role_arn" {
  description = "IAM role ARN used by the node groups"
  value       = module.eks.node_groups_role_arn
}
