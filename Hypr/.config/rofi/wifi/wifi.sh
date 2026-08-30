# #!/bin/bash
# TO CONNECT TO WIFI USING DMENU | ROFI WHICH IS CONNECTED BEFORE
# bssid=$(nmcli device wifi list | sed -n '1!P'| cut -b 9- | dmenu -p "Wifi" -l 10 | awk '{print $1}')

theme="$HOME/.config/rofi/launchers/type-2/style-1.rasi"

# [ -z "$bssid" ] && exit 1
# nmcli device wifi connect $bssid
# notify-send "📶 WiFi Connected"

bssid=$(nmcli device wifi list | sed -n '1!P'| cut -b 9- | rofi -dmenu -theme ${theme} -p " " -lines 10 | awk '{print $1}')
[ -z "$bssid" ] && exit 1
nmcli device wifi connect $bssid
notify-send "📶 WiFi Connected"
