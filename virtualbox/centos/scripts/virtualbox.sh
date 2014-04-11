#!/bin/bash

# Workaround for OpenGL headers on 6.5
cd /usr/src/kernels/`uname -r`/include/drm/
ln -s /usr/include/drm/drm.h drm.h
ln -s /usr/include/drm/drm_sarea.h drm_sarea.h
ln -s /usr/include/drm/drm_mode.h drm_mode.h
ln -s /usr/include/drm/drm_fourcc.h drm_fourcc.h
cd -

mkdir -p /mnt/virtualbox
mount -o loop /root/VBoxGuestAdditions.iso /mnt/virtualbox
sh /mnt/virtualbox/VBoxLinuxAdditions.run

# Cleanup
umount /mnt/virtualbox
rmdir /mnt/virtualbox
