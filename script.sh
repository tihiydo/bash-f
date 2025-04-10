#!/bin/bash

echo "Installing docker"
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Clone repo
sudo rm -rf msdr_client
sudo mkdir msdr_client
sudo cd msdr_client
sudo git clone https://tihiydo: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@github.com/tihiydo/msdr_client.git .
sudo chmod +x ./start.sh

sudo ./start.sh
