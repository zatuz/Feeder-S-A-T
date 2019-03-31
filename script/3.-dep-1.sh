#!/bin/bash
## creditos a cloudbox que tome ideas de su archivo dep.sh cloudbox.works	
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
## Add APT repos
add-apt-repository main
add-apt-repository contrib
add-apt-repository non-free
## agrega repositorios ansible
sudo sh -c 'echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
# instalamos paquetes apt
apt update
apt install -y \
	build-essential \
	curl \
	module-assistant \
	nano \
	libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    python-dev \
    python-pip
m-a prepare
apt upgrade -y
apt dist-upgrade -y