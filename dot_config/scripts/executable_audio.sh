#!/bin/bash

msgId="424242"
mute=$(pactl list | grep Mute: | head -n1 | cut -b7-)

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
     dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume muted" 
 else
     # Show the volume notification
     setvolume $1 $2
     volume=$(pactl list | grep Volume | head -n1 | awk {'print $5'} | cut -b-2)
     dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" "Volume: ${volume}%" 
 fi
