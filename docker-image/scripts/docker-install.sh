#!/bin/bash

set -eo pipefail

echo "Starting docker install..."
sudo apt-get update
echo "Installing ca-certificates curl and gnupg..."
sudo apt-get install ca-certificates curl gnupg
echo "Add Docker's official GPG key:"
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repository
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Update package index again to include Docker repository"
sudo apt update

echo "Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Starting and enabling Docker service"
sudo systemctl start docker
sudo systemctl enable docker

echo "Docker installed and started successfully."
