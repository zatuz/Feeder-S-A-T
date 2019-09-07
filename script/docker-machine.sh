#!/bin/bash
set -o pipefail
##variables para usuario
if [ -e "/usr/local/bin/docker-machine" ];then
    echo "docker machine all installed"
else
    base=https://github.com/docker/machine/releases/download/v0.16.0 &&
    curl -L $base/docker-machine-"$(uname -s)"-"$(uname -m)" >/tmp/docker-machine &&
    sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
    chmod +x /usr/local/bin/docker-machine
fi