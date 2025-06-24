#!/bin/bash
echo "Iniciando a tualização do sistema..."
sudo apt-get update && sudo apt-get upgrade -y

echo "Instalando aplicação para rodar servidor web local..."
apt-get install apache2 git -y

echo "Clonando o repositório github para /tmp..."
cd /tmp/ || exit
git clone https://github.com/denilsonbonatti/linux-site-dio.git

echo "Copiando arquivos do site para a pasta apache..."
cd linux-site-dio/ || exit
cp -R ./* /var/www/html/

echo "Instalação completa!!!"