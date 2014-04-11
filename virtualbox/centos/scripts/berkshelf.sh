#!/bin/bash

# For compiling native gems
yum groupinstall -y development
yum install libxml2-devel -y
yum install libxslt-devel -y

source /etc/profile.d/rvm.sh
gem install bundler --no-rdoc --no-ri
# The latest solve getting installed is incompatible
gem install solve -v '0.8.2' --no-rdoc --no-ri
gem install berkshelf --no-rdoc --no-ri
