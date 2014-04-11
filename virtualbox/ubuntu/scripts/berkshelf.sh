#!/bin/bash

apt-get install libxml2-dev libxslt-dev libxml2 -y

source /etc/profile.d/rvm.sh
gem install bundler --no-rdoc --no-ri
# The latest solve getting installed is incompatible
gem install solve -v '0.8.2' --no-rdoc --no-ri
gem install nokogiri -- --use-system-libraries --no-rdoc --no-ri
gem install berkshelf --no-rdoc --no-ri
