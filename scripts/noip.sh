#!/bin/bash
# Install and configure noip. Requires an account on http://no-ip.com/.
# http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dynamic-dns.html

sudo yum-config-manager --enable epel
sudo yum install -y noip
sudo noip2 -C
sudo chkconfig noip on
sudo service noip start