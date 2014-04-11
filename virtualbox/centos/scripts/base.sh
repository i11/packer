#!/bin/bash

# Base install
sed -i 's/Defaults\s*requiretty/# Defaults    requiretty/' /etc/sudoers
sed -i 's/^[ \t]*#[ \t]*\(%wheel[ \t].*NOPASSWD.*\)$/\1/' /etc/sudoers

yum clean all
yum upgrade -y

reboot
