#!/bin/bash

# Show a volume bar like ------- or Muted
# 
# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume {
    pamixer --get-volume 
}

function is_mute {
    pamixer --get-mute
}

function send_notification {
    volume=`get_volume`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    bar=$(seq -s "─" $(($volume / 5)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -a "VOLUME" -r 2593 -u normal "$bar"
}

volume=`get_volume`
case $1 in
    up)
        # Set the volume on (if it was muted)
        pamixer -u
           # up the volume (+ 5%)
        pamixer -i 5
        send_notification
	;;
    down)
        pamixer -u
        pamixer -d 5
	    send_notification
	;;
    mute)
        # Toggle mute
        pamixer -t
	    if is_mute ; then
            dunstify -a "VOLUME" -r 2593 -u normal "Mute"
        else
            send_notification
        fi
    ;;
esac

echo "$volume "
