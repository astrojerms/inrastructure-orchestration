// main.tf


// Count causes the module to be created only if the condition is true, and causes the return types to be lists
// Using locals to reduce the list to a single value, the first value.
// If the value is not created, one(...) returns null.
locals {
  aws_vpc_id                        = one(module.vpc[*].vpc_id)
  aws_subnet_ids                    = one(module.vpc[*].subnet_ids)
  aws_eks_cluster_name              = one(module.eks[*].cluster_name)
  aws_eks_cluster_endpoint          = one(module.eks[*].cluster_endpoint)
  aws_eks_cluster_security_group_id = one(module.eks[*].cluster_security_group_id)
}

module "vpc" {
  count           = var.enabled ? 1 : 0
  source          = "../../modules/vpc"
  vpc_name        = var.vpc_name
  vpc_cidr        = var.vpc_cidr
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
}

module "eks" {
  count              = var.enabled ? 1 : 0
  source             = "../../modules/eks"
  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = local.aws_vpc_id
  subnet_ids         = local.aws_subnet_ids
  node_desired_size  = var.node_desired_size
  node_min_size      = var.node_min_size
  node_max_size      = var.node_max_size
  node_instance_type = var.node_instance_type
}
