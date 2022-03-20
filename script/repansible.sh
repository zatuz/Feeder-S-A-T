#!/bin/bash
set -o pipefail
## dependencia para ansible
if [ -f /etc/apt/sources.list.d/ansible.list ] && grep -qi 'http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' /etc/apt/sources.list.d/ansible.list; then
   echo "tenemos ansible"
else
    echo "instalando ansible"
    echo '#deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' > /etc/apt/sources.list.d/ansible.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
sudo apt-get update
fi
