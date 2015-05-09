# aws
Environment config script for deploying MEAN to AWS Linux AMI

Currently deployment of node.js and npm is implemented. Time required approx. 50 mins.

Tested on Amazon Linux AMI 2015.03 (PV) - ami-1ccae774 on t1.micro

When the script finishes you should be able to see node working:

$ node
> console.log("test");

and npm

$ npm version