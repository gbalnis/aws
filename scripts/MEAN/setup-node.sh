#!/bin/bash

if [ "$1" == "" ]; then
  echo Please specify a desired node.js version. See current version on https://nodejs.org/download.
  exit 1
fi

# install pre-requisites
sudo yum -y install gcc-c++ make
sudo yum -y install git

# update in case you've forgotten
sudo yum -y update

cd ~

# install node.js
git clone git://github.com/joyent/node.git
cd node

# see if the specified version is valid
if ! git tag | grep $1; then
   echo There is no tag corresponding to the specified version.
   exit 1
fi

git checkout $1
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