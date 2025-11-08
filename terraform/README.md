# AWS EKS Terraform Configuration

This directory contains Terraform configuration to provision an AWS EKS (Elastic Kubernetes Service) cluster for deploying the Flask microservices application.

## Architecture Overview

The Terraform configuration creates:

- **VPC** with public and private subnets across multiple AZs
- **EKS Cluster** with managed node groups
- **Security Groups** for cluster and worker nodes
- **IAM Roles** and policies for EKS cluster and worker nodes
- **KMS Key** for envelope encryption of Kubernetes secrets
- **EKS Add-ons** (CoreDNS, kube-proxy, VPC CNI)

## Prerequisites

### Required Tools
1. **Terraform** (>= 1.0)
   ```bash
   # Install Terraform
   curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
   sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
   sudo apt-get update && sudo apt-get install terraform
   ```

2. **AWS CLI** (>= 2.0)
   ```bash
   # Install AWS CLI
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   unzip awscliv2.zip
   sudo ./aws/install
   ```

3. **kubectl**
   ```bash
   # Install kubectl
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
   ```

### AWS Configuration
1. **Configure AWS credentials:**
   ```bash
   aws configure
   ```
   Enter your:
   - AWS Access Key ID
   - AWS Secret Access Key
   - Default region (e.g., us-west-2)
   - Default output format (json)

2. **Verify AWS access:**
   ```bash
   aws sts get-caller-identity
   ```

## Configuration

### Variables
Edit `terraform.tfvars` to customize your deployment:

```hcl
# AWS Configuration
aws_region = "us-west-2"
cluster_name = "flask-microservices-cluster"

# Kubernetes Configuration
kubernetes_version = "1.33"

# Network Configuration
vpc_cidr = "10.0.0.0/16"
subnet_count = 2

# Node Group Configuration
node_group_desired_size = 2
node_group_max_size = 4
node_group_min_size = 1
node_group_instance_types = ["t3.medium"]
node_group_capacity_type = "ON_DEMAND"  # or "SPOT"
node_group_disk_size = 20
```

### Cost Considerations
- **t3.medium instances**: ~$0.0416/hour per instance
- **EKS cluster**: $0.10/hour
- **NAT Gateway**: $0.045/hour per gateway
- **EBS volumes**: $0.10/GB-month

**Estimated monthly cost for default setup**: ~$150-200/month

## Deployment

### Option 1: Automated Deployment (Recommended)
```bash
# Navigate to terraform directory
cd terraform/

# Run the deployment script
./deploy.sh
```

### Option 2: Manual Deployment
```bash
# Navigate to terraform directory
cd terraform/

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply

# Configure kubectl
aws eks update-kubeconfig --region us-east-1 --name flask-microservices-cluster
```

## Verification

After deployment, verify your cluster:

```bash
# Check cluster nodes
kubectl get nodes

# Check system pods
kubectl get pods --all-namespaces

# Check cluster info
kubectl cluster-info
```

## Outputs

After successful deployment, Terraform provides these outputs:

- `cluster_endpoint`: EKS cluster API endpoint
- `cluster_name`: Name of the EKS cluster
- `vpc_id`: VPC ID where cluster is deployed
- `private_subnets`: Private subnet IDs
- `public_subnets`: Public subnet IDs

## File Structure

```
terraform/
├── main.tf              # VPC, subnets, security groups
├── eks.tf               # EKS cluster and node groups
├── variables.tf         # Variable definitions
├── outputs.tf           # Output definitions
├── terraform.tfvars     # Variable values
├── kubeconfig.tpl       # kubectl config template
├── deploy.sh            # Automated deployment script
├── destroy.sh           # Automated destruction script
└── README.md            # This file
```

## Security Features

- **Private worker nodes**: All worker nodes are in private subnets
- **Encryption at rest**: Kubernetes secrets encrypted with KMS
- **Security groups**: Restrictive ingress/egress rules
- **IAM roles**: Least privilege access for cluster and nodes
- **VPC isolation**: Dedicated VPC with proper network segmentation

## Cleanup

### Option 1: Automated Cleanup
```bash
./destroy.sh
```

### Option 2: Manual Cleanup
```bash
terraform destroy
```

**⚠️ Warning**: This will permanently delete all resources and cannot be undone!

## Troubleshooting

### Common Issues

1. **Permission Denied**
   ```bash
   # Check AWS credentials
   aws sts get-caller-identity
   
   # Ensure proper IAM permissions for EKS
   ```

2. **Terraform State Lock**
   ```bash
   # If deployment fails, unlock state
   terraform force-unlock <LOCK_ID>
   ```

3. **kubectl Access Denied**
   ```bash
   # Update kubeconfig
   aws eks update-kubeconfig --region us-west-2 --name flask-microservices-cluster
   ```

4. **Addon Version Conflicts**
   - Check AWS documentation for compatible addon versions
   - Update `terraform.tfvars` with correct versions

### Useful Commands

```bash
# Check Terraform state
terraform state list

# Show specific resource
terraform state show aws_eks_cluster.main

# Import existing resources (if needed)
terraform import aws_eks_cluster.main cluster-name

# Validate configuration
terraform validate

# Format code
terraform fmt
```

## Next Steps

After successful cluster deployment:

1. **Deploy Flask Application**: Create Kubernetes manifests
2. **Set up Ingress**: Configure ALB or NGINX ingress controller
3. **Monitoring**: Deploy Prometheus and Grafana
4. **Logging**: Set up ELK stack or CloudWatch
5. **CI/CD**: Configure deployment pipelines

## Support

For issues with:
- **Terraform**: Check [Terraform AWS Provider docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- **EKS**: Check [AWS EKS documentation](https://docs.aws.amazon.com/eks/)
- **kubectl**: Check [Kubernetes documentation](https://kubernetes.io/docs/)