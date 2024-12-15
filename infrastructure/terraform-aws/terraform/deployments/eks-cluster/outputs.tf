output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = local.aws_eks_cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ids attached to the cluster control plane"
  value       = local.aws_eks_cluster_security_group_id
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.aws_eks_cluster_name
}