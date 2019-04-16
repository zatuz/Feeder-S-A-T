#!/bin/bash
set -o pipefail
echo "$VAR2" | sudo -p apt-get update 
## instalamos lo requisitos etc
echo "emos actualizado "
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
# instalamos paquetes apt
sudo apt update
sudo apt install -y \
  ansible \
	build-essential \
	module-assistant \
	nano \
	libssl-dev \
  libffi-dev \
  python3-dev \
  python3-pip \
  python-dev \
  python-pip
sudo m-a prepare
sudo apt upgrade -y
## desistalamos paquetes docker anteriores
echo
echo "se eliminara docker anterior"
sudo apt remove -y docker docker-engine docker.io containerd runc
## actualizamos
sudo apt update
## actualizo e instalo docker
echo
echo "se instala docker nodejs y npm"
sudo apt install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	nodejs \
	npm
  echo
  echo "se instala docker compose complementos docker y npm"
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
pip install docker-py
sudo npm install npm --global
