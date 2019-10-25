res=$(echo " poweroff| reboot| suspend" | rofi -sep "|" -dmenu -theme .config/rofi/themes/overlay.rasi -i)

if [ "$res" = " poweroff" ]; then
    systemctl poweroff 
fi
if [ "$res" = " reboot" ]; then
    systemctl reboot 
fi
if [ "$res" = " suspend" ]; then
    systemctl suspend
fi
exit 0
