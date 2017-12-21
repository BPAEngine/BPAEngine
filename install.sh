#!/bin/bash

## Install Plymouth Splash Theme ##
##   for SUSE systems            ##
##      by mdeniz                ##
##    www.github.com/mdeniz      ##
##    License: GPL v3            ##

chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo Must be run as root
    exit
  fi
}

chk_root

if [ $# -eq 1 ]; then
  rm -f /usr/share/fonts/truetype/plymouth_fonts
  ln -sf "/vagrant/export/$1/fonts" /usr/share/fonts/truetype/plymouth_fonts
  if [ "$1" == "preview_theme" ]; then
    plymouth-set-default-theme -R "$1"
  else
    echo "Installing $1 in Plymouth directory"
    echo "NOTE: installing other theme inside the vagrant box will set it as the "
    echo "      default preview theme, run install with preview_theme to recover that"
    cp -rf "/vagrant/export/$1" /usr/share/plymouth/themes/
    plymouth-set-default-theme -R "$1"
    echo "Done!"
  fi
else
  echo "Usage: ./install.sh NAME"
  echo "  - NAME: Name of the exported theme to install"
fi
