#!/bin/bash
set -o pipefail
## instalamos repositorios oficiales como usuario root
add-apt-repository main
add-apt-repository contrib
add-apt-repository non-free
if [ -f  /etc/apt/sources.list ]; then
    grep -q -F 'deb http://ftp.debian.org/debian stretch-backports main' /etc/apt/sources.list || \
        echo '#deb http://ftp.debian.org/debian stretch-backports main contrib non-free' >> /etc/apt/sources.list
    grep -q -F 'deb-src http://ftp.debian.org/debian stretch-backports main' /etc/apt/sources.list || \
        echo '#deb-src http://ftp.debian.org/debian stretch-backports main contrib non-free' >> /etc/apt/sources.list
fi