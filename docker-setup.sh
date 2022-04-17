#!/bin/bash

# Install jq
sudo apt-get install jq -y

# Install Docker
curl -fsSL https://get.docker.com | sudo bash

# Add current user to docker
sudo usermod -aG docker $(whoami)

# Install docker-compose v2
DOCKER_COMPOSE_VERSION=$(curl -sSL https://api.github.com/repos/docker/compose/releases/latest | jq '.tag_name' | sed 's/"//g')
sudo mkdir -p /usr/local/lib/docker/cli-plugins
sudo curl -SL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-aarch64 -o /usr/local/lib/docker/cli-plugins/docker-compose
sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Done
echo "Done"
