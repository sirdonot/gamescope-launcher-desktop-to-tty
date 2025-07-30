#!/usr/bin/env bash

## Makes sure steam is not running
if pidof -x steam >/dev/null; then
  steam -shutdown
fi

## Set the password and tty
PASSWORD=*password*
TTY=*number*

## Sets the password and changes to the used TTY
echo "$PASSWORD" | sudo -S sleep 14 && chvt $TTY &

## Optional
## Hides the mouse in hyprland using hyprctl
#default=$(hyprctl getoption cursor:inactive_timeout | awk '{print $NF}')
#hyprctl keyword cursor:inactive_timeout 0.0001 &
#sleep 14 && hyprctl keyword cursor:inactive_timeout "$default" &

## Intro video file name
FILENAME=gamescope.mp4

SCRIPT_DIR=${BASH_SOURCE%/*}
INTRO="$SCRIPT_DIR/$FILENAME"

## Starts the intro
mpvpaper --layer overlay ALL $INTRO
