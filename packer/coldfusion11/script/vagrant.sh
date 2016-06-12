#!/bin/bash -eux

echo '==> Installing Vagrant SSH key'
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

echo '==> Recording box config date'
date > /etc/box_build_time

echo '==> Customizing message of the day'
echo 'Welcome to your Packer-built virtual machine.' > /etc/motd
