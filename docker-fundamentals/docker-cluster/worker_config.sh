#!/bin/bash

# Arquivo de log para o worker
LOG_FILE="/vagrant/vagrant_up.log"

# Redireciona toda a saída (stdout e stderr) para o arquivo de log
exec >> "$LOG_FILE" 2>&1
echo "--- Início do script worker_config em Wed Jun 25 04:12:53 AM UTC 2025 ---"

# Comando para se juntar ao Swarm
echo "Executando o comando para se juntar ao Swarm..."
    docker swarm join --token SWMTKN-1-4vfc6lk9bsrqx0dnehbn7jy84riljqozexhu8qar4cag263i9o-bfu15hzn7qrlcr8giq7s6wti1 10.0.0.240:2377
echo "Configuração do worker concluída."
echo "--- Fim do script worker_config em Wed Jun 25 04:12:53 AM UTC 2025 ---"
