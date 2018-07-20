#!/bin/bash

sudo apt-get update -y
sudo apt-get install nginx -y
sudo apt-get upgrade -y

sudo apt-get install python-software-properties
curl -sL http://deb.nodesource.com/setup_6.x | sudo -E bash -

sudo apt-get install nodejs -y

sudo npm install pm2 -g

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# update the sources list
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update -y

# install nginx
sudo apt-get install mongodb-org -y

# configure and restart mongo
sudo rm /etc/mongod.conf
sudo cp /db/templates/mongod.conf /etc/mongod.conf
sudo service mongod restart

# copy the profiles.d directory
sudo cp /home/ubuntu/profile.d/* /etc/profile.d