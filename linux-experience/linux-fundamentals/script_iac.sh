#!/bin/bash

echo "### Script de Configuração Inicial ###"

echo "Criando pastas no diretório principal..."

mkdir /publico /adm /ven /sec

echo "Pastas criadas com sucesso!"

echo

echo "Criando grupos de usuário..."

echo

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Grupos criados com sucesso!"

echo

echo "Definindo permissões de pastas..."

echo

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Permissões aplicadas com sucesso!"

echo

echo "Criando usuários..."

echo

echo "Usuários administrativos..."

useradd carlos -m -c "Carlos da Silva" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_ADM
useradd maria -m -c "Maria de Oliveira" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_ADM
useradd joao -m -c " João Machado" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_ADM

echo "OK!"

echo

echo "Usuários vendas..."

useradd debora -m -c "Debora Siqueira" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_VEN
useradd sebastiana -m -c "Sebastiana Olinda" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_VEN
useradd roberto -m -c "Roberto Santos" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_VEN

echo "OK!"

echo

echo "Usuários secretaria"

useradd josefina -m -c "Josefina de Jesus" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_SEC
useradd amanda -m -c "Amanda Ortiz" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_SEC
useradd rogerio -m -c "Rogerio Matheus" -p "$(openssl passwd -6 Senha123)" -s /bin/bash -G GRP_SEC

echo "OK!"

echo

echo "Usuários criados com sucesso!"

echo

echo "Configurações foram todas concluídas com sucesso!"
