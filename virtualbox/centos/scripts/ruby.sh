#!/bin/bash

curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.1.0 
rvm use 2.1.0 --default
