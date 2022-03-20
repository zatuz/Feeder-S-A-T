#!/bin/bash
set -o pipefail
## instalamos repositorios oficiales como usuario root
add-apt-repository main
add-apt-repository contrib
add-apt-repository non-free
if [ -f  /etc/apt/sources.list.d/backports.list ]; then
        echo "existe archivo de repo backports"
        grep -q -F "deb http://ftp.debian.org/debian $(lsb_release -cs)-backports main" /etc/apt/sources.list.d/backports.list && \
                echo "existe repo deb" || \
                echo "#deb http://ftp.debian.org/debian  $(lsb_release -cs)-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/backports.list
        grep -q -F "deb-src http://ftp.debian.org/debian  $(lsb_release -cs)-backports main" /etc/apt/sources.list.d/backports.list && \
                echo "existe repo deb-src" || \
                echo "#deb-src http://ftp.debian.org/debian  $(lsb_release -cs)-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/backports.list
else
        sudo touch /etc/apt/sources.list.d/backports.list
        echo "#deb http://ftp.debian.org/debian  $(lsb_release -cs)-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/backports.list
        echo "#deb-src http://ftp.debian.org/debian  $(lsb_release -cs)-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list.d/backports.list
fi
