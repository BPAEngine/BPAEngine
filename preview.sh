#!/bin/bash

## Preview Plymouth Splash theme    ##
##      by mdeniz                   ##
##    www.github.com/mdeniz         ##
##    License: GPL v3               ##

chk_root () {
  if [ ! $( id -u ) -eq 0 ]; then
    echo Must be run as root
    exit
  fi
}

chk_root

DURATION=10
if [ $# -gt 0 ]; then
  DURATION=$1
fi

THEME_PATH="source/sandbox/default"
if [ $# -gt 1 ]; then
  THEME_PATH="$2"
fi

if [[ $DEBUG_ON -eq 1 ]]; then
  WITH_DEBUG="--debug --debug-file=/tmp/plymouth-debug-out.log"
fi

 # Exporting to the provisioned default theme
./export.sh "$THEME_PATH" "preview_theme"

# Preview it
echo "Previewing theme during $DURATION seconds..."

echo "Starting daemon.."
plymouthd $WITH_DEBUG ;
sleep 1;

# check if the plymouthd daemon is alive
plymouth --ping
if [[ $? -eq 1 ]]
then
    echo "ERROR: Plymouth daemon not running"
    exit 1
fi

# Show splash
echo "Showing theme..."
plymouth show-splash
plymouth change-mode  --updates
sleep 5

# Ask for password
echo "Asking for password..."
plymouth ask-for-password --prompt="Introduce the password"
sleep 1

# Ask a random question
echo "Asking a question..."
plymouth ask-question --prompt="What is your name?"
sleep 1

echo "Reproducing updates..."
for ((I=0; I<$DURATION; I++)); do
  plymouth update --status="Update number $I            OK";
  plymouth display-message --text="Message test $I --> $(date)";
  sleep 1;
  done;

# Set mode to boot-up
echo "Change mode to boot-up..."
plymouth change-mode --boot-up
sleep 1
plymouth display-message --text="Change mode to boot-up...";
sleep 3

# Set mode to shutdown
echo "Change mode to shutdown..."
plymouth change-mode --shutdown
sleep 1
plymouth display-message --text="Change mode to shutdown...";
sleep 3

plymouth quit
echo "Preview Done!"
