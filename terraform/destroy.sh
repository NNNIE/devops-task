#!/bin/bash

# AWS EKS Cluster Destruction Script
set -e

echo "🗑️  Starting AWS EKS Cluster Destruction..."

# Check if Terraform is initialized
if [ ! -d ".terraform" ]; then
    echo "❌ Terraform not initialized. Please run './deploy.sh' first or 'terraform init'."
    exit 1
fi

# Warning message
echo "⚠️  WARNING: This will destroy your EKS cluster and all associated resources!"
echo "⚠️  This action cannot be undone!"
echo ""
read -p "Are you sure you want to continue? Type 'yes' to confirm: " -r

if [[ $REPLY != "yes" ]]; then
    echo "❌ Destruction cancelled."
    exit 1
fi

echo ""
echo "🗑️  Destroying EKS cluster..."

# Destroy Terraform resources
terraform destroy -auto-approve

echo ""
echo "✅ EKS cluster destroyed successfully!"
echo "💡 Remember to check AWS console to ensure all resources are cleaned up."