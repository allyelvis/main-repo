#!/bin/bash

# Update package list and install essential packages
echo "Updating package list..."
sudo apt-get update

echo "Installing essential packages..."
sudo apt-get install -y build-essential curl git

# Install Node.js and npm
echo "Installing Node.js and npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Python and pip
echo "Installing Python and pip..."
sudo apt-get install -y python3 python3-pip

# Install additional tools if needed (e.g., PostgreSQL, MySQL)
echo "Installing PostgreSQL and MySQL..."
sudo apt-get install -y postgresql postgresql-contrib mysql-server

# Install project dependencies for each app
echo "Installing dependencies for each application..."

for dir in apps/*; do
  if [ -d "" ]; then
    echo "Installing dependencies for $(basename "$dir")..."
    cd ""
    npm install || pip3 install -r requirements.txt || echo "No dependencies to install for $(basename "$dir")"
    cd ../..
  fi
done

echo "Environment setup completed."
