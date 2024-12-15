// envs/prod.tfvars
aws_region         = "us-east-1"
vpc_cidr           = "10.1.0.0/16"
subnet_count       = 3
cluster_name       = "prod-cluster"
cluster_version    = "1.31"
node_desired_size  = 3
node_min_size      = 2
node_max_size      = 5
node_instance_type = "t3.large"
