#!/bin/bash

## Create Plymouth Splash Theme     ##
##      by mdeniz                   ##
##    www.github.com/mdeniz         ##
##    License: GPL v3               ##


if [ $# -eq 2 ]; then
  THEME_PATH=$1 # Source directory
  THEME_NAME=$2 # Name of the theme
  EXPORT_PATH="source/$THEME_PATH/$THEME_NAME"
  SCRIPT_FILE="$EXPORT_PATH/$THEME_NAME.script"
  PLYMOUTH_FILE="$EXPORT_PATH/$THEME_NAME.plymouth"

  echo "Creating theme '$THEME_NAME' into 'source/$THEME_PATH'"

  # Cleaning target path
  if [ -d "$EXPORT_PATH" ]; then
    echo "Directory already exists... Cleaning"
    rm -rf "$EXPORT_PATH"
  fi
  mkdir -p "$EXPORT_PATH"

  # Copying template
  cp -rf source/templates/default/* "$EXPORT_PATH/"

  # Renaming files
  if [ "$THEME_NAME" != "default" ]; then
    mv "$EXPORT_PATH/default.plymouth.template" "$EXPORT_PATH/$THEME_NAME.plymouth.template"
    mv "$EXPORT_PATH/default.script" "$EXPORT_PATH/$THEME_NAME.script"
  fi

  echo "Creation Done!"
else
  echo "Usage: ./create.sh PATH NAME"
  echo "  - PATH: Path to the directory for the theme, it will be created under source/"
  echo "          It will remove the previous code if there is any"
  echo "  - NAME: Name of the created theme"
fi
