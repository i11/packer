#!/bin/bash -ex

#apt-get install linux-image-generic-lts-raring linux-headers-generic-lts-raring -y

# add the Docker repository key to the local keychain
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

echo "deb https://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install lxc-docker -y

# Add the docker group if it doesn't already exist.
groupadd docker || true

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
if id -u vagrant >/dev/null 2>&1; then
  gpasswd -a vagrant docker
fi
