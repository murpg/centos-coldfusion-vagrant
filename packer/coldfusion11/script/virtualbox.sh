#!/bin/bash -eux

echo "==> Installing the VirtualBox guest additions"
mount -o loop VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11
umount /mnt
rm -f VBoxLinuxAdditions.iso

echo "==> Removing packages needed for building guest tools"
yum -y remove bzip2 gcc cpp kernel-devel kernel-headers perl
