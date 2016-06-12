#!/bin/bash -eux

echo "==> Installing Nginx for ColdFusion 11"
yum install -y nginx
# custom site configs will go here
mkdir -p /etc/nginx/sites
mkdir -p /var/www

echo "==> Configuring Nginx"
cp -f /tmp/nginx.conf /etc/nginx/
