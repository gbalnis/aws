#!/bin/bash

# install pre-requisites
sudo yum install gcc-c++ make
sudo yum install git
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
