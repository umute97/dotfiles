#!/bin/bash

msgId="424242"
mute=$(pactl list | grep Mute: | head -n1 | cut -b7-)
volume=$(pactl list | grep Volume | head -n1 | awk {'print $5'} | cut -b-2)
iconpath="/usr/share/icons/Archdroid-BlueGrey/status/scalable/audio-volume-high-panel.svg"
iconnonepath="/usr/share/icons/Archdroid-BlueGrey/status/scalable/audio-output-none-panel.svg"

function setvolume () {

     if [ "$1" == "+" ]; then
        # Raise volume
        pactl set-sink-volume @DEFAULT_SINK@ +$2%
     else
        # Lower volume
        pactl set-sink-volume @DEFAULT_SINK@ -$2%
     fi
}

if [[ $volume == 0 || "$mute" == "yes" ]]; then
     # Show the sound muted notification
     dunstify -a "changeVolume" -u low -i ${iconnonepath} -r "$msgId" "Volume muted" 
else
     # Show the volume notification
     setvolume $1 $2
     volume=$(pactl list | grep Volume | head -n1 | awk {'print $5'} | cut -b-2)
     dunstify -a "changeVolume" -u low -i ${iconpath} -r "$msgId" "Volume: ${volume}%" 
fi
