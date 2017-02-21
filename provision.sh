#!/bin/bash
zypper -q -n install --replacefiles plymouth plymouth-scripts plymouth-plugin-script plymouth-x11-renderer plymouth-plugin-label sed
zypper -q -n up
cd /vagrant && ./export.sh  "source/sandbox/default" "preview_theme" && ln -sf "/vagrant/export/preview_theme" /usr/share/plymouth/themes/ && plymouth-set-default-theme -R "preview_theme"
