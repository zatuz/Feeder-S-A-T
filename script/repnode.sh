#!/bin/bash
set -o pipefail
##repositorios para node js y npm
if [ ! -d /etc/apt/sources.list.d/nodesource.list ]; then
echo
echo "instalando repo nodejs"
curl -sL https://deb.nodesource.com/setup_11.x | bash -
apt-get install -y nodejs
fi