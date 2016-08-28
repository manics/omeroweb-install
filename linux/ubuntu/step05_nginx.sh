#!/bin/bash

#start-install
apt-get -y install software-properties-common
add-apt-repository -y ppa:nginx/stable
apt-get update
apt-get -y install nginx

#end-install
sed -i.bak -re 's/( default_server.*)/; #\1/' /etc/nginx/nginx.conf
rm /etc/nginx/sites-enabled/default
mv /home/omero/nginx.conf.tmp /etc/nginx/conf.d/omeroweb.conf

if [ ! "${container:-}" = docker ]; then
    service nginx start
fi