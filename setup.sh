



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

# On successful install, run the bash comands
echo "***Pulling Node and MongoDB from Docker...***"
sudo docker pull node
sudo docker pull mongo
echo "************Remove Docker container name if exits******************"
sudo docker rm nerdeveloper
echo "************Createing a Docker container for MongoDB******************"
sudo docker run --name nrdeveloper -p 27017:27017 mongo
echo "*********Building the Docker Container Image******"
sudo docker build -t nerdeveloper/usermanger .
echo "*********Creating a Container for Docker-Image******"
sudo docker run  --name nerdeveloper/usermanager -d


