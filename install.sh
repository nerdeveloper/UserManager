#!/bin/bash
####################
# This bash script was developed Obinna Odirionye
# This might take sometime
############

echo "*****Running Application Checks********"
if [ -x "$(command -v docker)" ]; then
  echo 'Waoh!! Docker is installed.' >&2
  
  else
    echo 'Oops! Docker is not here.' >&2

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    sudo apt-get update && \
    apt-cache policy docker-ce && \
    sudo apt-get install -y docker-ce 
    echo '******DOCKER IS NOW INSTALLED!!**********.' >&2
fi

if [ -x "$(command -v docker-machine)" ]; then
  echo 'Waoh!! Docker-machine is installed.' >&2

else 

curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
chmod +x /tmp/docker-machine && \
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
 sudo apt-get update

echo '******DOCKER-MACHINE IS NOW INSTALLED!!**********.' >&2

fi

if [ -x "$(command -v docker-compose)" ]; then
  echo 'Waoh!! docker-compose is installed.' >&2

else 

sudo apt-get -y install python-pip && \
sudo pip install docker-compose && \
 sudo apt-get update

echo '******DOCKER-COMPOSE IS NOW INSTALLED!!**********.' >&2

fi

if [ -x "$(command -v virtualbox)" ]; then
  echo 'Waoh!! Virtualbox is installed.' >&2

else 

sudo apt-get update && \
sudo apt-get install virtualbox

echo '******Virtualbox IS NOW INSTALLED!!**********.' >&2

fi

echo "***Shutting down any running machine...***"
docker-machine stop default
echo "************Creating machine******************"
docker-machine create --driver virtualbox default
echo "************Firing up machine******************"
docker-machine start default
echo "*********Running process for Node-MongoDB docker Application.******"
docker-compose build
docker-compose up