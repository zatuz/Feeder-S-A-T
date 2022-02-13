#!/bin/bash
set -o pipefail
##removemos antiguos progrmas docker docker
apt remove -y docker \
            docker-engine \
            docker.io \
            containerd \
            runc
apt update
echo
echo "se instala repo docker"
if grep -qi 'download.docker.com': /etc/apt/sources.list; then
       echo "hola ya tienes contenedores docker "
else
    echo "pasaremos a inestalar repositorios docker"
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
fi
