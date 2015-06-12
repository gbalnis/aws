#!/bin/bash

# check if the version is specified
# version string is not checked against valid semver syntax - expect surprises if it is not!
if [ "$1" == "" ]; then
  echo Please specify a build version. Version must be a valid semver string.
  exit 1
fi

# check if $HOME/.bmb.hub.cfg.json exists, exit if not
if ! [ -f "$HOME/.bmb.hub.cfg.json" ]
	then
		echo 'Hub config file .bmb.hub.cfg.json is missing, put it in $HOME.'
		exit 1
fi

# install bmb tools
sudo env PATH=$PATH:/usr/local/bin npm install http://bmb.wolterskluwer.com/install -g

# get the app
cd ~
git clone https://stash.bw-sl.com/scm/zet/zeteo.git
cd zeteo

# should checkout the no-urm tag but there is no tag yet		
# git checkout 0.0.3-no-urm

# install bmb
bmb install

# build the product
bmb build --version $1

# create tarball with the app
tar -czf ~/zetn.$1.app.tgz ./dist

# deploy standalone
tar -xzf ~/zetn.$1.app.tgz -C ~

# install node dependencies
cd ~/dist/app
npm install

# create pm2 config json
pm2conf="{
  \"apps\" : [{
    \"name\"        : \"zeteo\",
    \"script\"      : \"/home/ec2-user/dist/app/app.js\",
    \"cwd\"         : \"/home/ec2-user/dist/app\"
  }]
}"
echo "$pm2conf" > ~/zeteo.pm2.json

# you may remove the build directory
# rm -rf ~/zeteo
# ...or move it somewhere
mv ~/zeteo ~/zeteo.bak

# done
echo "Done. Use pm2 start zeteo.pm2.json to start the app."