#!/bin/bash
#
# /usr/local/bin must be on the secure_paths for sudo user
# sudo vi /etc/sudoers
# change: Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

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
sudo make install

# install npm
cd ~
git clone https://github.com/isaacs/npm.git
cd npm
sudo make install

cd ~