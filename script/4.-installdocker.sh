#!/bin/bash
## instalamos lo requisitos etc
apt-get install -y \
		ca-certificates \
		gnupg2 
## agregamos claves docker
	
##agrego repositorios docker
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
## actualizo e instalo docker
apt update 
apt-get install -y \
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