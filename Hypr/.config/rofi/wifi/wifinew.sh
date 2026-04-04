#!/bin/bash
# SCRIPT TO CONNECT TO NEW WIFI USING DMENU | ROFI

theme="$HOME/.config/rofi/launchers/type-2/style-1.rasi"
# bssid=$(nmcli device wifi list | sed -n '1!P'| cut -b 9- | dmenu -p "Wifi" -l 10 | awk '{print $1}')
# [ -z "$bssid" ] && exit 1
# pass=$(echo "" | dmenu -p "Enter password")
# [ -z "$pass" ] && notify-send "🔑 Password  not enterd" && exit 1
# nmcli device wifi connect $bssid password $pass
# notify-send "📶 New WiFi Connected"

bssid=$(nmcli device wifi list | sed -n '1!P' | cut -b 9- | rofi -dmenu -theme ${theme} -p " " -lines 10 | awk '{print $1}')
[ -z "$bssid" ] && exit 1
pass=$(echo "" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "";}' -theme ${theme} -p "Enter password")
[ -z "$pass" ] && notify-send "🔑 Password not entered" && exit 1
nmcli device wifi connect $bssid password $pass
notify-send "📶 New WiFi Connected"
