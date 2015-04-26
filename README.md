# aws
Environment config script for deploying MEAN to AWS Linux AMI

/usr/local/bin must be on the secure_paths for sudo user
sudo vi /etc/sudoers and change: Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin

Tested on Amazon Linux AMI 2015.03 (PV) - ami-1ccae774 on t1.micro

When the script finishes you should be able to see node working:

$ node
> console.log("test");

and npm

$ npm version