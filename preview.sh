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

MODE="short"
if [ $# -gt 2 ]; then
  MODE=$3
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

# ----------------------------------------------------------------------
if [ -f "$THEME_PATH/preview.inc.sh" ]; then
  source "$THEME_PATH/preview.inc.sh"
else
  if [ $MODE == "long" ]; then
    # Ask for password
    echo "Asking for password..."
    plymouth ask-for-password --prompt="Introduce the password"
    sleep 1

    # Ask a random question
    echo "Asking a question..."
    plymouth ask-question --prompt="What is your name?"
    sleep 1
    plymouth unpause-progress

    echo "Reproducing updates..."
    IFS=$'\r\n' GLOBIGNORE='*' command eval  'LOG=($(cat /var/log/boot.log))'
    for ((I=0; I<$DURATION * 2; I++)); do
      if [ $MODE == "long" ]; then
        plymouth update --status="${LOG[$I]}";
      else
        plymouth update --status="Status update number $I";
      fi
      sleep 0.5;
      done;
    #  plymouth display-message --text="Message test $I --> $(date)";
  else
    sleep $DURATION
  fi

  if [ $MODE == "long" ]; then
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
  fi
fi
# ------------------------------------------------------------

plymouth quit
echo "Preview Done!"
