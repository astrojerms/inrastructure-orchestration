// envs/dev.tfvars
enabled            = false
aws_region         = "us-west-2"
vpc_cidr           = "10.0.0.0/16"
cluster_name       = "dev-cluster"
cluster_version    = "1.31"
node_desired_size  = 2
node_min_size      = 1
node_max_size      = 3
node_instance_type = "t3.small"
subnet_ids         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
