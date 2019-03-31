#!/bin/bash
## instalamos lo requisitos etc
apt-get install -y \
		ca-certificates \
		gnupg2 \
## agregamos claves docker
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
##agrego repositorios docker
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" && 
## actualizo e instalo docker
apt-get update 
apt-get install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	docker.io nodejs \
	npm 
pip install docker-compose==1.9.0
pip install docker-py
npm install npm --global
## se agrega $user a grupo docker
usermod -aG docker "$VAR1"