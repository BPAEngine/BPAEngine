#!/bin/bash
zypper -q -n install --replacefiles plymouth plymouth-scripts plymouth-plugin-script plymouth-x11-renderer plymouth-plugin-label sed
zypper -q -n up
cd /vagrant && ./export.sh  "source/sandbox" "preview_theme" && ./install.sh "preview_theme"
