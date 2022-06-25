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
apt-get update
apt-get -y install ca-certificates curl gnupg lsb-release git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update 
apt-get -y install docker-ce docker-ce-cli containerd.io
systemctl enable docker.service
apt-get -y install docker-compose

mkdir -p data/bitping #create data directory for bitping credentials


