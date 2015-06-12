# Bamboo scripts
Deployment script for ZETN

Installs Bamboo globally, deploys bmb.dev, builds the product from Stash, creates distribution tarballs, deploys to $HOME and creates json config for pm2

Tested on Amazon Linux AMI 2015.03 (PV) - ami-1ccae774 on m1.small (ENOMEM on t1.micro)

Prerequisites:
* Stash account with read access
* Bamboo hub configuration file (.bmb.hub.cfg.json) in $HOME including authentication token (required when there is no browser to perform authentication with the hub). Set the desired hub to default.
* node.js
* npm.js
* pm2 (if you want to demonize node)

When the script finishes, configure ~/dist/app/vars.json to point to desired Velvet endpoint and you should be able to run the application by calling either

$ pm2 start zeteo.pm2.json

or

$ cd ~/dist/app
$ node app.js

Navigate with your browser to http://your-hostname:8000/ and enjoy.