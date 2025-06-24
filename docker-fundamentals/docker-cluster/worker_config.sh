#!/bin/bash

LOG_FILE="/vagrant/vagrant_up.log"

exec >> "$LOG_FILE" 2>&1
echo "--- Início do script worker_config em $(date) ---"

