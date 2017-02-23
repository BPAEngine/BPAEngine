#!/bin/bash

## Export Plymouth Splash Theme     ##
##      by mdeniz                   ##
##    www.github.com/mdeniz         ##
##    License: GPL v3               ##


if [ $# -eq 2 ]; then
  THEME_PATH=$1 # Source directory
  THEME_NAME=$2 # Name of the theme
  EXPORT_PATH="export/$THEME_NAME"
  SCRIPT_FILE="$EXPORT_PATH/$THEME_NAME.script"
  PLYMOUTH_FILE="$EXPORT_PATH/$THEME_NAME.plymouth"

  echo "Exporting theme '$THEME_PATH' to '$EXPORT_PATH'"

  # Cleaning target path
  if [ -d "$EXPORT_PATH" ]; then
    rm -rf "$EXPORT_PATH"
  fi
  mkdir -p "$EXPORT_PATH"

  # Compiling source scripts
  cat lib/**/**/*.script > "$SCRIPT_FILE" # Compile Engine scripts
  cat $THEME_PATH/lib/**/*.script >>  "$SCRIPT_FILE" # Compile lib subdirs
  cat $THEME_PATH/lib/*.script >>  "$SCRIPT_FILE" # Compile lib dir
  cat $THEME_PATH/*.script >>  "$SCRIPT_FILE" # Compile base source

  # Generating plymouth configuration file
  cat $THEME_PATH/*.plymouth.template > "$PLYMOUTH_FILE"
  sed -i -e "s/THEME_EXPORT/$THEME_NAME/g" "$PLYMOUTH_FILE"

  # Copying images directory
  cp -rf lib/BPAEngine/images "$EXPORT_PATH"
  cp -rf $THEME_PATH/images "$EXPORT_PATH"

  echo "Exporting Done!"
else
  echo "Usage: ./export.sh PATH NAME"
  echo "  - PATH: Path to the source directory of the theme, usually under source/"
  echo "  - NAME: Name of the theme to export"
fi
