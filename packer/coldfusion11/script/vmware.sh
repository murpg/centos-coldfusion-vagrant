#!/bin/bash -eux

echo "==> Fixing kernel headers issue for VMware Tools"
ln -sf /usr/src/kernels/$(uname -r)/include/generated/uapi/linux/version.h /usr/src/kernels/$(uname -r)/include/linux/version.h

cd /tmp
mkdir -p /mnt/cdrom
mount -o loop /home/vagrant/linux.iso /mnt/cdrom
tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/

cd /tmp/vmware-tools-distrib

echo "==> Installing VMware Tools"
/tmp/vmware-tools-distrib/vmware-install.pl --default
rm /home/vagrant/linux.iso
umount /mnt/cdrom
rmdir /mnt/cdrom

echo "==> Removing packages needed for building guest tools"
yum -y remove bzip2 gcc cpp kernel-devel kernel-headers perl
