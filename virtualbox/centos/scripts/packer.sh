#!/bin/bash -e

# cracklib-dict has a softlink /usr/sbin/packer. remove it
rm -f /usr/sbin/packer

# Definitions
PACKER_VER=0.5.2
PACKER_ARCH=amd64 # amd64 | 386 | arm (only valid for some OS)
PACKER_OS=linux # darwin | linux | freebsd | openbsd
PACKER_FILE=$PACKER_VER"_"$PACKER_OS"_"$PACKER_ARCH".zip"
PACKER_INSTALL_DIR=/usr/local/packer/bin
  
# Fetch the file
curl -LOk "https://dl.bintray.com/mitchellh/packer/$PACKER_FILE"
  
# __INSTALL__
mkdir -p $PACKER_INSTALL_DIR
cd $PACKER_INSTALL_DIR
unzip -q ${OLDPWD}/$PACKER_FILE
rm -f ${OLDPWD}/$PACKER_FILE

# Create packer profile.d to export new path
cat << EOF > /etc/profile.d/packer.sh
if [ -x $PACKER_INSTALL_DIR ]; then
  PATH=\$PATH:$PACKER_INSTALL_DIR
fi
EOF
