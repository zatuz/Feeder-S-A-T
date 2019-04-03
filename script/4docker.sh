#!/bin/bash
sudo apt-get update
## instalamos lo requisitos etc
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
## desistalamos paquetes docker anteriores
sudo apt-get remove docker docker-engine docker.io containerd runc
## agregamos claves docker
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
##agrego repositorios docker
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
## actualizamos
 sudo apt-get update
## actualizo e instalo docker
sudo apt-get install -y \
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
usermod -aG docker "$VAR1"
