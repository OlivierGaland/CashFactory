#!/bin/bash
#######################################################################
# File name : setup.sh 
# Author : Olivier Galand (31/12/2021)
# Author email : galand.olivier.david@gmail.com
# Project : CashFactory
# Project repository : https://github.com/OlivierGaland/CashFactory
# 
# Setup script for docker environment
#######################################################################

# install and setup docker on the host, the following command will need a sudo to correctly run : sudo ./setup.sh
# apt-get update
# apt-get -y install ca-certificates curl gnupg lsb-release git
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# apt-get update 
# apt-get -y install docker-ce docker-ce-cli containerd.io
# systemctl enable docker.service
# apt-get -y install docker-compose

# Check if running with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or with sudo"
    exit 1
fi

# Detect Linux distribution
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "Cannot detect Linux distribution. Exiting."
    exit 1
fi

echo "Detected Linux distribution: $DISTRO"

# Install Docker based on distribution
case $DISTRO in
    ubuntu|debian|linuxmint)
        echo "Installing Docker for Debian/Ubuntu-based system..."
        apt-get update
        apt-get -y install ca-certificates curl gnupg lsb-release git
        mkdir -p /etc/apt/keyrings
        curl -fsSL https://download.docker.com/linux/$(echo $DISTRO | tr '[:upper:]' '[:lower:]')/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$(echo $DISTRO | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
        apt-get update
        apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        systemctl enable docker.service
        apt-get -y install docker-compose
        ;;
    centos|rhel|fedora|rocky|almalinux)
        echo "Installing Docker for RHEL/CentOS/Fedora-based system..."
        yum -y install yum-utils git
        yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
        yum -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
        systemctl enable docker.service
        # Install docker-compose
        curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
        ;;
    arch|manjaro)
        echo "Installing Docker for Arch-based system..."
        pacman -Syu --noconfirm
        pacman -S --noconfirm docker docker-compose git
        systemctl enable docker.service
        ;;
    opensuse*|suse)
        echo "Installing Docker for openSUSE-based system..."
        zypper refresh
        zypper -n install docker docker-compose git
        systemctl enable docker.service
        ;;
    *)
        echo "Unsupported distribution: $DISTRO"
        echo "Please install Docker manually following the official documentation: https://docs.docker.com/engine/install/"
        exit 1
        ;;
esac

# Start Docker service
systemctl start docker.service


mkdir -p data/bitping #create data directory for bitping credentials

echo "Docker installation completed successfully!"


