#!/bin/bash -e

chkconfig --level 345 tuned on
tuned-adm profile virtual-guest
