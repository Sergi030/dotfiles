#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_brightness {
    xbacklight -get | cut -d '.' -f 1
}

function send_notification {
    brightness=`get_brightness`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($brightness / 5)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -a "Bright" -r 2593 -u normal "$bar"
}


brightness=`get_brightness`
case $1 in
    up)
	    xbacklight -inc 10
        send_notification
	;;
    down)
        if [ $brightness -gt 10 ]
        then
            xbacklight -dec 10
        fi        
	    send_notification
	;;
esac
echo "$brightness "
