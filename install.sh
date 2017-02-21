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
  if [ "$1" == "preview_theme" ]; then
    echo "Error: preview_theme is the default exporting point, please use another name for the project"
  else
    echo "Installing $1 in Plymouth directory"
    cp -rf "/vagrant/export/$1" /usr/share/plymouth/themes/
    plymouth-set-default-theme -R "$1"
    echo "Done!"
  fi
else
  echo "Usage: ./install.sh NAME"
  echo "  - NAME: Name of the exported theme to install"
fi
