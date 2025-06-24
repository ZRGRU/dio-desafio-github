#!/bin/bash

LOG_FILE="/vagrant/vagrant_up.log"

exec >> "$LOG_FILE" 2>&1
echo "--- Início do script volume_consistency_server em $(date) ---"

# IP_SERVER="10.0.0.240" # IP do servidor NFS será usado no client
APP="my_web_app" # Nome do volume que será criado no Docker
WORK_DIR="/var/lib/docker/volumes/$APP/_data" # Diretório de trabalho onde os dados persistentes serão armazenados
EXPORT_LINE="$WORK_DIR *(rw,sync,subtree_check)"
# Criar volume no Docker
docker volume create $APP

# Instalar o firewall UFW e permitir o protocolo NFS
apt-get update
apt-get install -y ufw
ufw allow nfs
ufw --force enable
ufw reload

# Instalar NFS server no node master
apt-get install nfs-server -y

# Add ao final do arquivo, salvar e sair
if ! grep -qF "$EXPORT_LINE" /etc/exports; then
  echo "Adicionando a seguinte linha a /etc/exports:"
  echo "  $EXPORT_LINE"
  # Usar printf para maior segurança e consistência
  printf "%s\n" "$EXPORT_LINE" >> /etc/exports
else
  echo "A configuração para $WORK_DIR já existe em /etc/exports. Nenhuma alteração feita."
fi

# Exportar arquivos pelo servidor
exportfs -ar

echo "--- Fim do script volume_consistency_server em $(date) ---"