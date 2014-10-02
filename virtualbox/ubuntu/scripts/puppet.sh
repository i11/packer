#!/bin/bash

curl https://apt.puppetlabs.com/puppetlabs-release-precise.deb > /tmp/puppetlabs-release-precise.deb
dpkg -i /tmp/puppetlabs-release-precise.deb
apt-get update
apt-get -y install puppet
rm -f /tmp/puppetlabs-release-precise.deb
