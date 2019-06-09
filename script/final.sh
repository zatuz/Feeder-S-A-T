#!/bin/bash
set -o pipefail
## instalamos lo requisitos etc
echo "actualizare los repositorios "
sleep 4
## instalamos programas requeridos y finales y etc
# instalamos paquetes apt
sudo apt update
echo -E "###########################################################################"
echo -E "#      procedere con la instalacion de librerias python etc               #"
echo -E "#esto puede tardar algo no me molestes por favor solo soy un simple script#"
echo -E "###########################################################################"
sleep 4
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
htop  
  ## actualizo e instalo docker
echo -E "#############################################################################"
echo -E "#             procedere con la instalacion de docker y nodejs               #"
echo -E "#               aun nose como piensa mi programador,                        #"
echo -E "#         sin embargo tengo fe en el pronto sera grande ya veras            #"
echo -E "#############################################################################"
sleep 4
sudo apt install -y \
	docker-ce \
	docker-ce-cli \
	containerd.io \
	nodejs
pip install docker-py
sudo npm install npm --global