#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#ffffff}$metadata"      # Orange when playing
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#ffffff}$metadata"      # Greyed out info when paused
else
    echo "%{F#ffffff} not connected" # Greyed out icon when stopped
fi
