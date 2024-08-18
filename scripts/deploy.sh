#!/bin/bash

# Function to deploy a single application
deploy_app() {
  local app_dir=$1
  local service_name=$2

  echo "Deploying $app_dir..."

  cd "$app_dir" || exit 1

  # Pull the latest changes from the repository
  git pull origin main

  # Build and restart the application
  npm run build || echo "No build step for $(basename "$app_dir")"
  sudo systemctl restart "$service_name"

  echo "$app_dir deployed successfully."
}

# Deploy each application
deploy_app "apps/inventory-system" "inventory-system.service"
deploy_app "apps/crm-system" "crm-system.service"
deploy_app "apps/pos-system" "pos-system.service"
deploy_app "apps/ecommerce" "ecommerce.service"
deploy_app "apps/community-forum" "community-forum.service"
deploy_app "apps/reporting-tools" "reporting-tools.service"

echo "All applications deployed successfully."
