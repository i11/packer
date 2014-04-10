#!/bin/bash

# Try to remove any possible preinstalled packages
apt-get -y purge virtualbox-guest-utils virtualbox-guest-x11 virtualbox

mkdir -p /mnt/virtualbox
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt/virtualbox
sh /mnt/virtualbox/VBoxLinuxAdditions.run

# Cleanup
umount /mnt/virtualbox
rmdir  /mnt/virtualbox
