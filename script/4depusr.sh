#!/bin/bash
set -o pipefail
sudo -p "$VAR2" apt-get update
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
sudo apt remove -y docker docker-engine docker.io containerd runc
## actualizamos
sudo apt update
## actualizo e instalo docker
sudo apt install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	nodejs \
	npm
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
pip install docker-py
npm install npm --global
## se agrega $user a grupo docker
sudo usermod -aG docker "$VAR1"
