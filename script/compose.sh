#!/bin/bash
set -o pipefail
##se instalara complemento docker "docker compose"
if [ -e "/usr/local/bin/docker-compose" ];then
    echo "docker-compose installed"
else
    curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /tmp/docker-compose &&
    mv /tmp/docker-compose /usr/local/bin/docker-compose &&
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi