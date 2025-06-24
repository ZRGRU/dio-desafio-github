#!/bin/bash

LOG_FILE="/vagrant/vagrant_up.log"

exec >> "$LOG_FILE" 2>&1
echo "--- Início do script master_config em $(date) ---"

sudo docker swarm init --advertise-addr=10.0.0.240 # Inicializar o Swarm com o IP do master

# Parte 1: Capturar o Comando de Join
JOIN_COMMAND=$(sudo docker swarm join-token worker | grep 'docker swarm join')

# Parte 2: Gerar o Script com "Here Document" e 'tee'
sudo tee /vagrant/worker_config.sh > /dev/null <<EOF
#!/bin/bash

# Arquivo de log para o worker
LOG_FILE="/vagrant/vagrant_up.log"

# Redireciona toda a saída (stdout e stderr) para o arquivo de log
exec >> "\$LOG_FILE" 2>&1
echo "--- Início do script worker_config em $(date) ---"

# Comando para se juntar ao Swarm
echo "Executando o comando para se juntar ao Swarm..."
$JOIN_COMMAND
echo "Configuração do worker concluída."
echo "--- Fim do script worker_config em $(date) ---"
EOF

# Parte 3: Tornar o Script Executável
sudo chmod +x /vagrant/worker_config.sh

echo "--- Fim do script master_config em $(date) ---"