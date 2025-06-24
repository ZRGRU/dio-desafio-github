#!/bin/bash

LOG_FILE="/vagrant/master_config.log"

{
echo "--- Início do script em $(date) ---"

sudo docker swarm init --advertise-addr=10.0.0.240 # Inicializar o Swarm com o IP do master
sudo docker swarm join-token worker | grep docker >> /vagrant/worker_config.sh # Salvar o comando de join do worker em um arquivo
} >> "$LOG_FILE" 2>&1