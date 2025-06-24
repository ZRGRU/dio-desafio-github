#!/bin/bash

LOG_FILE="/vagrant/docker_install.log"

{
echo "--- Início do script em $(date) ---"

curl -fsSL https://get.docker.com | sudo bash
sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant

} >> "$LOG_FILE" 2>&1
