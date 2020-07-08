#!/bin/bash
apt update && apt -y upgrade
apt-get -y install apache2
export HOSTNAME=$(curl -H Metadata:true "http://169.254.169.254/metadata/instance/compute/name?api-version=2017-08-01&format=text")
export PUBLIC_IPV4=$(curl -H Metadata:true "http://169.254.169.254/metadata/instance/network/interface/0/ipv4/ipAddress/0/publicIpAddress?api-version=2017-08-01&format=text")
echo "<p><center><H1>Hostname: $HOSTNAME,</p><p>IP Address: $PUBLIC_IPV4</H1></center></p>" > /var/www/html/index.html
