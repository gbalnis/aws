# MEAN deployment scripts
Environment config script for deploying MEAN to AWS Linux AMI

Currently deployment of node.js, npm and pm2 is implemented (pm2 requires your attention to finish startup). Time required approx. 50 min.

Tested on Amazon Linux AMI 2015.09 (PV) - ami-cf1066aa on t1.micro

When the script finishes you should be able to see node working:

$ node --version

and npm

$ npm --version

and pm2

$ pm2 --version	