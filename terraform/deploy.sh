#!/bin/bash

# AWS EKS Cluster Deployment Script
set -e

echo "🚀 Starting AWS EKS Cluster Deployment..."

# Check if required tools are installed
check_dependencies() {
    echo "📋 Checking dependencies..."
    
    if ! command -v terraform &> /dev/null; then
        echo "❌ Terraform is not installed. Please install Terraform first."
        exit 1
    fi
    
    if ! command -v aws &> /dev/null; then
        echo "❌ AWS CLI is not installed. Please install AWS CLI first."
        exit 1
    fi
    
    if ! command -v kubectl &> /dev/null; then
        echo "❌ kubectl is not installed. Please install kubectl first."
        exit 1
    fi
    
    echo "✅ All dependencies are installed."
}

# Check AWS credentials
check_aws_credentials() {
    echo "🔐 Checking AWS credentials..."
    
    if ! aws sts get-caller-identity &> /dev/null; then
        echo "❌ AWS credentials not configured. Please run 'aws configure' first."
        exit 1
    fi
    
    echo "✅ AWS credentials are configured."
}

# Initialize Terraform
init_terraform() {
    echo "🔧 Initializing Terraform..."
    terraform init
    echo "✅ Terraform initialized."
}

# Plan Terraform deployment
plan_terraform() {
    echo "📋 Planning Terraform deployment..."
    terraform plan -out=tfplan
    echo "✅ Terraform plan completed."
}

# Apply Terraform deployment
apply_terraform() {
    echo "🚀 Applying Terraform deployment..."
    terraform apply tfplan
    echo "✅ EKS cluster deployed successfully!"
}

# Configure kubectl
configure_kubectl() {
    echo "⚙️ Configuring kubectl..."
    
    # Get cluster name from Terraform output
    CLUSTER_NAME=$(terraform output -raw cluster_name)
    AWS_REGION=$(terraform output -raw aws_region || echo "us-west-2")
    
    # Update kubeconfig
    aws eks update-kubeconfig --region $AWS_REGION --name $CLUSTER_NAME
    
    echo "✅ kubectl configured successfully!"
}

# Verify cluster
verify_cluster() {
    echo "🔍 Verifying cluster..."
    
    kubectl get nodes
    kubectl get pods --all-namespaces
    
    echo "✅ Cluster verification completed!"
}

# Main execution
main() {
    check_dependencies
    check_aws_credentials
    init_terraform
    plan_terraform
    
    echo ""
    echo "⚠️  About to create AWS resources that will incur costs."
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        apply_terraform
        configure_kubectl
        verify_cluster
        
        echo ""
        echo "🎉 EKS cluster deployment completed successfully!"
        echo "📝 Next steps:"
        echo "   1. Deploy your Flask microservice to the cluster"
        echo "   2. Set up monitoring and logging"
        echo "   3. Configure ingress controller"
        echo ""
        echo "💡 To destroy the cluster later, run: terraform destroy"
    else
        echo "❌ Deployment cancelled."
        exit 1
    fi
}

# Run main function
main "$@"