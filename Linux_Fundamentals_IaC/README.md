# Desafio GitHub Linux Fundamentals

Neste desafio foi criado dois arquivos para configuração automatizada do Linux.

 - Script de Configuração Inicial

   Inclui configuração básica do sistema como:

   - Criação de pastas: `/publico`, `/adm`, `/ven`, `/sec`.

     ```bash
     echo "Criando pastas no diretório principal..."
     
     mkdir /publico /adm /ven /sec
     
     echo "Pastas criadas com sucesso!"
     ```

   - Criação dos grupos de usuários: `GRP_ADM`, `GRP_VEN`, `GRP_SEC`.

     ```bash
     echo "Criando grupos de usuário..."
     
     echo
     
     groupadd GRP_ADM
     groupadd GRP_VEN
     groupadd GRP_SEC
     
     echo "Grupos criados com sucesso!"
     ```

   - Definindo pasta principal para cada grupo e atribuindo as respectivas permissões.

     ```bash
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
     ```

   - Criação de usuários de cada grupo, com pasta de usuário, senha, terminal padrão e adição ao respectivo grupo.

     ```bash
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
     ```

 - Configuração de um servidor web com um modelo de site

   Inclui alguns passos para colocar o site no ar utilizando o `apache2`, como:

      - Faz a atualização de pacotes e atualização do Linux.

        ```bash
        echo "Iniciando a tualização do sistema..."
        sudo apt-get update && sudo apt-get upgrade -y
        ```

      - Faz a instalação do `apache2` para a hospedagem do site.

        ```bash
        echo "Instalando aplicação para rodar servidor web local..."
        apt-get install apache2 git -y
        ```

      - Clona o repositório onde se encontra o modelo do site utilizado para a pasta `/tmp`.

        ```bash
        echo "Clonando o repositório github para /tmp..."
        cd /tmp/ || exit
        git clone https://github.com/denilsonbonatti/linux-site-dio.git
        ```

      - Copia recursivamente os arquivos do site (`linux-site-dio/*`) para a pasta do apache (`/var/www/html/`).

        ```bash
        echo "Copiando arquivos do site para a pasta apache..."
        cd linux-site-dio/ || exit
        cp -R ./* /var/www/html/
        ```
