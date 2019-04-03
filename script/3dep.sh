#!/bin/bash
set -o pipefail
## instalamos Dependencias como usuario root
## Disable IPv6
if [ -f /etc/sysctl.d/99-sysctl.conf ]; then
    grep -q -F 'net.ipv6.conf.all.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || \
        echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
    grep -q -F 'net.ipv6.conf.default.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || \
        echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
    grep -q -F 'net.ipv6.conf.lo.disable_ipv6 = 1' /etc/sysctl.d/99-sysctl.conf || \
        echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.d/99-sysctl.conf
    sysctl -p
fi
# Install Pre-Dependencies
apt-get install -y --reinstall \
		apt-transport-https \
		dirmngr \
		software-properties-common \
    curl
## Add APT repos
add-apt-repository main
add-apt-repository contrib
add-apt-repository non-free
## agrega repositorios ansible
sh -c 'echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
#se agrega llaves de doker
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
##agrego repositorios docker
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
##repositorios para node js y npm
curl -sL https://deb.nodesource.com/setup_11.x | bash -

apt update
