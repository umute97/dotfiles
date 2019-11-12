#!/usr/bin/bash

level=$(cat /sys/class/power_supply/BAT0/capacity)

dunstify "Battery low!" "Current percentage: $level%" -i /usr/share/icons/Archdroid-BlueGrey/status/scalable/battery-caution.svg -u critical 
