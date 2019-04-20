#!/bin/bash
set -o pipefail
echo "$VAR2" | sudo -p apt-get update
## instalamos lo requisitos etc
echo "emos actualizado "
## instalamos programas requeridos y finales y etc
# instalamos paquetes apt
sudo apt update
sudo apt install -y \
  ansible \
  build-essential \
  nano \
  libssl-dev \
  libffi-dev \
  python3-dev \
  python3-pip \
  python-dev \
  python-pip
m-a prepare
## actualizo e instalo docker
echo
echo "se instala docker nodejs y npm"
sudo apt install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	nodejs
pip install docker-py
sudo npm install npm --global