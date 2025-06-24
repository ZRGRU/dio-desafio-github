#!/bin/bash

LOG_FILE="/vagrant/worker_config.log"

exec >> "$LOG_FILE" 2>&1
echo "--- Início do script em $(date) ---"    docker swarm join --token SWMTKN-1-1oywdtw9o9kajkqq5q3yoza83v75efbm6xjf9b9abc1a9kgup6-e83ccryhreq5k8fdcftoanli8 10.0.0.240:2377
