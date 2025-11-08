# Default values for development
aws_region = "us-east-1"
cluster_name = "flask-microservices-cluster"
kubernetes_version = "1.33"

# VPC Configuration
vpc_cidr = "10.0.0.0/16"
subnet_count = 2

# Node Group Configuration
node_group_desired_size = 2
node_group_max_size = 4
node_group_min_size = 1
node_group_instance_types = ["t3.medium"]
node_group_capacity_type = "ON_DEMAND"
node_group_disk_size = 20

# Add-on versions (adjust based on your Kubernetes version)
coredns_version = "v1.10.1-eksbuild.5"
kube_proxy_version = "v1.33.2-eksbuild.2"
vpc_cni_version = "v1.15.1-eksbuild.1"