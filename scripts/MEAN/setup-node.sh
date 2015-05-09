#!/bin/bash

# install pre-requisites
sudo yum -y install gcc-c++ make
sudo yum -y install git

# update in case you've forgotten
sudo yum -y update

cd ~

# install node.js
git clone git://github.com/joyent/node.git
cd node
# git checkout v0.12.2 (see current version on https://nodejs.org/download/)
./configure
make
sudo env PATH=$PATH:/usr/local/bin make install

# install npm
cd ~
git clone https://github.com/isaacs/npm.git
cd npm
sudo env PATH=$PATH:/usr/local/bin make install

# install pm2
cd ~
sudo env PATH=$PATH:/usr/local/bin npm install pm2 --global

# configure pm2 for startup
# (!) ONLY as a user that will run the apps
pm2 startup amazon