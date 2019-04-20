#!/bin/bash
set -o pipefail
## dependencia para ansible
if [ -f  /etc/apt/sources.list.d/ansible ]; then
   echo tenemos ansible
else
    touch /etc/apt/sources.list.d/ansible
    echo '#deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list.d/ansible
fi
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update
#sudo apt-get install ansible