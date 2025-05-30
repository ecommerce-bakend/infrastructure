#!/bin/bash

set -e

environments=("stage" "develop" "main")

for env in "${environments[@]}"; do
  echo "=== Deploying to $env environment ==="
  
  cd "environments/$env"
  
  echo "Initializing Terraform..."
  terraform init
  
  echo "Applying Terraform configuration..."
  terraform apply -auto-approve
  
  echo "Getting cluster credentials..."
  gcloud container clusters get-credentials "$(terraform output -raw cluster_name)" \
    --region "$(terraform output -raw location)" \
    --project "$(terraform output -raw project_id)"
  
  echo "Deploying microservices..."
  for manifest in manifests/*.yaml; do
    echo "Applying $manifest..."
    kubectl apply -f "$manifest"
  done
  
  cd ../..
  echo "=== Deployment to $env completed ==="
  echo
done

echo "All deployments completed successfully!"