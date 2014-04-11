#!/bin/bash

# Remove all yum data
yum clean --enablerepo=’*’ all
# Remove /tmp and /var/tmp contents
rm -rf /tmp/* /var/tmp/*
# Remove MAC adress
find /etc/sysconfig/network-scripts/ -maxdepth 1 -name "ifcfg-*" -type f -exec sed -i -e '/^HWADDR/d' {} \;
rm -f /etc/udev/rules.d/70-persistent*
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules
# Remove cache of dhclient lease
rm -f /var/lib/dhclient/dhclient-*.leases
# Remove detected configurations
rm -rf /dev/.udev
# nuke the bash history
echo "Removing bash history..."
unset HISTFILE
rm -f /root/.bash_history
rm -f /home/vagrant/.bash_history
# clean up the logs
echo "Cleaning up logs..."
find /var/log -type f | while read f; do echo -ne '' > $f; done;
# whiteout the swap
echo "Cleaning up swap partitions..."
swapuuid=$(blkid -o value |grep swap -B 1 |head -1)
swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
swapoff $swappart;
dd if=/dev/zero of=$swappart;
mkswap $swappart -U $swapuuid;
swapon $swappart;

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
