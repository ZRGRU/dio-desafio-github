#!/bin/bash

LOG_FILE="volume_consistency_client.log"

{
echo "--- Início do script em $(date) ---"

IP_SERVER="10.0.0.240" # IP do servidor NFS
APP="my_web_app" # Nome do volume que será criado no Docker
WORK_DIR="/var/lib/docker/volumes/$APP/_data" # Diretório de trabalho onde os dados persistentes serão armazenados

# Criar volume no Docker
docker volume create $APP

# Instalar o firewall UFW e permitir o protocolo NFS
apt-get update
apt-get install -y ufw
ufw allow nfs
ufw --force enable
ufw reload

# Instalar NFS nos node worker
apt-get install nfs-common -y

# Verififcar export do server
showmount -e $IP_SERVER

# Montar persistência
mount $IP_SERVER:$WORK_DIR $WORK_DIR

} >> "$LOG_FILE" 2>&1