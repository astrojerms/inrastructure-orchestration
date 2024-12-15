variable "aws_access_key" {
  description = "AWS access key ID"
  type        = string
  default     = null
}

variable "aws_secret_key" {
  description = "AWS secret access key"
  type        = string
  default     = null
}

variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
}

// modules/eks/variables.tf
variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "example-eks-cluster"
}

variable "cluster_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.21"
}

# variable "vpc_id" {
#   description = "VPC ID for the EKS cluster"
#   type        = string
# }

variable "subnet_ids" {
  description = "Subnet IDs for EKS"
  type        = list(string)
}

variable "node_desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 3
}

variable "node_instance_type" {
  description = "Instance type for EKS nodes"
  type        = string
  default     = "t3.medium"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "example-vpc"
}

variable "private_subnets" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "enabled" {
  description = "CIDR block for the VPC"
  type        = bool
  default     = false
}