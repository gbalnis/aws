# aws
Environment config script for deploying MEAN to AWS Linux AMI

Currently deployment of node.js, npm and pm2 is implemented (pm2 requires your attention to finish startup). Time required approx. 50 min.

Tested on Amazon Linux AMI 2015.03 (PV) - ami-1ccae774 on t1.micro

Usage: 

./setup-node.sh `node-version-tag`

When the script finishes you should be able to see node working:

$ node
> console.log("test");

and npm

$ npm version