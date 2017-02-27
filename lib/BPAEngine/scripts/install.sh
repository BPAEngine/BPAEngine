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

echo "Installing Plymouth Splash Screen..."
cp -rf . /usr/share/plymouth/themes/THEME_EXPORT
ln -sf /usr/share/plymouth/themes/THEME_EXPORT/fonts /usr/share/fonts/truetype/THEME_EXPORT
plymouth-set-default-theme -R .
echo "Done!"
