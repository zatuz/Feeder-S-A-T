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
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"
fi