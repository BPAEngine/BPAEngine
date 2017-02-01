#!/bin/bash

## Install Plymouth Splash  ##
##   for SUSE systems       ##
##      by mdeniz           ##
##    www.github.com/mdeniz ##
##    License: GPL v3       ##

chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo Must be run as root
    exit
  fi
}

chk_root

if [ $# -eq 1 ]; then
  echo "Installing $1 in Plymouth directory"
  ln -sf "/vagrant/export/$1" /usr/share/plymouth/themes/
  plymouth-set-default-theme -R "$1"
  echo "Done!"
fi
