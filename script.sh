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
mkdir msdr_client
cd msdr_client
sudo git clone https://tihiydo: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@github.com/tihiydo/msdr_client.git .
