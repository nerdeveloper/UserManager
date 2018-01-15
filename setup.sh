



#!/bin/bash
####################
# This bash script was developed Obinna Odirionye
# This might take sometime
############


echo "*****Some Programs will be checked and installed********"
#this will validate whether the user wants to install the programs or not
read -p "Do you want to Continue (y/n)?" -r choice 
case "$choice" in 
  y|Y ) echo "YES";;
  n|N ) echo "NO";;
  * ) echo "INVALID";;
esac

if [[ "$choice" =~ ^[Yy]$ ]]
 then
 echo ''
  else
  	exit 0;

fi
#this will check if docker is installed or not
if [ -x "$(command -v docker)" ]; then
  echo 'Waoh!! Docker is installed.' >&2
  
  else
  	echo 'Oops! Docker is not installed.' >&2

  	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
  	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
  	sudo apt-get update && \
  	apt-cache policy docker-ce && \
  	sudo apt-get install -y docker-ce 
  	echo '******DOCKER IS NOW INSTALLED!!**********.' >&2
fi

#this will check if Docker-machine is installed or not
if [ -x "$(command -v docker-machine)" ]; then
  echo 'Waoh!! Docker-machine is installed.' >&2

else 

"curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
chmod +x /tmp/docker-machine && \
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine
 sudo apt-get update"

echo '******DOCKER-MACHINE IS NOW INSTALLED!!**********.' >&2


fi


#this will check if docker-compose is installed or not

if [ -x "$(command -v docker-compose)" ]; then
  echo 'Waoh!! docker-compose is installed.' >&2

else 

sudo apt-get -y install python-pip && \
sudo pip install docker-compose && \
 sudo apt-get update

echo '******DOCKER-COMPOSE IS NOW INSTALLED!!**********.' >&2

fi
#Check to see if VirtualBox is installed or not
if [ -x "$(command -v virtualbox)" ]; then
  echo 'Waoh!! VirtualBox is installed.' >&2

else 
echo 'Oops! VirtualBox is not installed.' >&2
sudo apt-get install virtualbox && \
 sudo apt-get update

echo '******VirtualBox IS NOW INSTALLED!!**********.' >&2
fi
# On successful install, run the bash comands
echo "***Shutting down any running machine...***"
docker-machine stop default
echo "************Creating a Docker machine******************"
docker-machine create --driver virtualbox default
echo "************Fire up machine******************"
docker-machine start default
echo "*********Running process for Node-MongoDB docker Application.******"
docker-compose build
docker-compose up
sudo docker rm nerdeveloperdb


sudo docker pull node

# Pull mongo image from Docker Hub
sudo docker pull mongo
# Create a container using the mongo image from step 2
sudo docker run --name nerdeveloperdb -p 27017:27017 mongo

# Build app image from the Dockerfile in the project root
sudo docker build -t nerdeveloper/usermanger .

# Create a container using the docker image from step 4
sudo docker run  --name nerdeveloper/usermanager -d
