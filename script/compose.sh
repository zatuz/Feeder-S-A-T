#!/bin/bash
set -o pipefail
##comprobamos que existe la carpeta de plugins de docker 

##se instalara complemento docker "docker compose"
if [ -e "/usr/local/bin/docker-compose" ];then
    echo "docker-compose installed"
else
     sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
&&
    mv /tmp/docker-compose /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose 
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi
if [[ -d ~/.docker/cli-plugins/ ]];then
    echo "ya esta creada docker cli plugins"
        if [ -e "~/.docker/cli-plugins/docker-compose" ];then
                echo "ya existe docker compose en la carpeta plugins"
            else
                curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
                echo "docker compose v2 instalado correctamente" 
                chmod +x ~/.docker/cli-plugins/docker-compose
        fi    
else
        mkdir -p ~/.docker/cli-plugins/
        curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
        echo "docker compose v2 instalado correctamente" 
        chmod +x ~/.docker/cli-plugins/docker-compose
fi
