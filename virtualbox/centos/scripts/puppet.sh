#!/bin/bash

relver=$(sed -rn 's/.*([0-9])\.[0-9].*/\1/p' /etc/redhat-release)
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-${relver}.noarch.rpm
yum -y install puppet
