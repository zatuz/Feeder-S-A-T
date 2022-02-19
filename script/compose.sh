#!/bin/bash
set -o pipefail
##comprobamos que existe la carpeta de plugins de docker 

##se instalara complemento docker "docker compose"
if [ -e "/usr/local/bin/docker-compose" ]; then
    echo "docker-compose installed"
 elif [ -e "~/.docker/cli-plugins/docker-compose" ]; then
    echo "docker-compose installed"
 else
    echo "docker-compose no instalado"
    echo "quieres instalar la version 1 de docker compose escribe 1 y enter"
    echo "o si quieres instalar la version 2 de docker-compose escribe 2 y enter"
    read -r COMPOSER
    if [ "$COMPOSER" == "1" ]; then
        sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o "/usr/local/bin/docker-compose"
        sudo chmod +x "/usr/local/bin/docker-compose"
        sudo ln -s "/usr/local/bin/docker-compose" "/usr/bin/docker-compose"
        echo "docker compose v1 instalado correctamente"
     elif [ "$COMPOSER" == "2" ]; then
        mkdir -p "~/.docker/cli-plugins/"
        curl -SL "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64" -o "~/.docker/cli-plugins/docker-compose"
        chmod +x "~/.docker/cli-plugins/docker-compose"
        echo "docker compose v2 instalado correctamente"
    fi
fi
