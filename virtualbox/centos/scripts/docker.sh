#!/bin/bash -e

rpm --import http://elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://elrepo.org/elrepo-release-6-5.el6.elrepo.noarch.rpm

yum install docker-io -y
chkconfig docker on

# Add vagrant to the docker group
if id -u vagrant >/dev/null 2>&1; then
  usermod -a -G docker vagrant
fi
