#!/bin/bash -eux

echo "==> Turning off sshd DNS lookup to prevent timeout delay"
echo "UseDNS no" >> /etc/ssh/sshd_config

echo "==> Disabling GSSAPI authentication to prevent timeout delay"
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

echo "==> Installing packages for VMware Tools or VirtualBox guest additions"
yum -y install bzip2 gcc cpp glibc-headers kernel-devel kernel-headers perl patch curl wget net-tools unzip
yum -y install libxslt epel-release
yum -y update kernel

echo "==> Rebooting after kernel update"
reboot
