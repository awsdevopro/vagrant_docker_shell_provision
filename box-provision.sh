#!/usr/bin/env bash
echo -ne "Installing cURL, Git, Python... " && \
sudo DEBIAN_FRONTEND=noninteractive apt-get update && \
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
apt-transport-https \
ca-certificates \
software-properties-common \
build-essential \
python \
git \
curl && \
echo 'done' && \
# saving credentials in cache
git config --global credential.helper 'cache --timeout=360000' && \
# Installing docker
echo 'Installing latest Docker...' && \
wget -qO- https://get.docker.com/ | sh && \
sudo usermod -aG docker $USER  && \
sudo systemctl enable docker && \
# Installing Docker compose
echo 'Installing Docker Compose v1.20.0' && \
curl -SsL "https://github.com/docker/compose/releases/download/1.20.0/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose && \
sudo mv ./docker-compose /usr/local/bin/docker-compose && \
sudo chmod +x /usr/local/bin/docker-compose && \
echo 'Creating Docker bridge network...'
<<<<<<< HEAD
sudo docker network create -d bridge pub_vpn 
=======
sudo docker network create -d bridge ronsvpn
>>>>>>> 19f18928c28f7279390a36df51c3c6be9edf64ba

