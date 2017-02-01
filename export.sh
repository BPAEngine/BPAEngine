#!/bin/bash

## Export Plymouth Splash scripts  ##
##      by mdeniz                   ##
##    www.github.com/mdeniz         ##
##    License: GPL v3               ##


if [ $# -eq 2 ]; then
  PATH=$1 # Source directory
  THEME=$2 # Name of the theme
  EXPORT_PATH="export/$THEME"
  SCRIPT_FILE="$EXPORT_PATH/$THEME.script"
  PLYMOUTH_FILE="$EXPORT_PATH/$THEME.plymouth"

  echo "Exporting theme '$PATH' to '$EXPORT_PATH'"

  # Cleaning target path
  rm -rf "$EXPORT_PATH"
  mkdir -p "$EXPORT_PATH"

  # Compiling source scripts
  cat lib/**/*.script > "$SCRIPT_FILE" # Compile Engine scripts
  cat $PATH/lib/**/*.script >>  "$SCRIPT_FILE" # Compile lib subdirs
  cat $PATH/lib/*.script >>  "$SCRIPT_FILE" # Compile lib dir
  cat $PATH/*.script >>  "$SCRIPT_FILE" # Compile base source

  # Generating plymouth configuration file
  cat $PATH/*.plymouth.template > "$PLYMOUTH_FILE"
  sed -i -e "s/THEME_EXPORT/$THEME/g" "$PLYMOUTH_FILE"

  # Copying images directory
  cp -rf $PATH/images "$EXPORT_PATH"

  echo "Exporting Done!"
fi
