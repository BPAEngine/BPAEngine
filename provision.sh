#!/bin/bash
##  Provision script for vagrant    ##
##      by mdeniz                   ##
##    www.github.com/mdeniz         ##
##    License: GPL v3               ##

zypper -q -n install --replacefiles plymouth plymouth-scripts plymouth-plugin-script plymouth-x11-renderer plymouth-plugin-label sed
zypper -q -n up
cd /vagrant && ./export.sh  "source/sandbox/default" "preview_theme" && ln -sf "/vagrant/export/preview_theme" /usr/share/plymouth/themes/ && mkdir -p /usr/share/fonts/truetype/plymouth_fonts && ln -sf "/vagrant/export/preview_theme/fonts" /usr/share/fonts/truetype/plymouth_fonts && plymouth-set-default-theme -R "preview_theme"
