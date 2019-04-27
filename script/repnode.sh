#!/bin/bash
set -o pipefail
##repositorios para node js y npm
echo
echo "instalando repo nodejs"
curl -sL https://deb.nodesource.com/setup_11.x | bash -
apt-get install -y nodejs