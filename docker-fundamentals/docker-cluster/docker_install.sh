#!/bin/bash

LOG_FILE="/vagrant/vagrant_up.log"

exec >> "$LOG_FILE" 2>&1
echo "--- Início do script docker_install em $(date) ---"

curl -fsSL https://get.docker.com | sudo bash
sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant

echo "--- Fim do script docker_install em $(date) ---"