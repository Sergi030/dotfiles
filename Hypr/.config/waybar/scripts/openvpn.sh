#!/usr/bin/env bash
# Waybar custom/openvpn module for the NetworkManager profile WS-EU-VPN
#   (no arg)  -> print JSON status for the bar (color via class)
#   toggle    -> nmcli up/down the connection, then refresh the bar
#
# Color comes from the "class" field, styled in style.css:
#   .connected (green) / .disconnected (red)

UUID="e481befc-570a-4279-9287-f872982dcb97"
NAME="sgarcia@worldsensing.com_WS-EU-VPN"

ICON=$(printf '\U000f0582')   # nf-md-vpn  (color = state)

is_up() { nmcli -t -f NAME connection show --active 2>/dev/null | grep -Fxq "$NAME"; }

# --- click handler: toggle up/down ----------------------------------------
if [ "$1" = "toggle" ]; then
  if is_up; then
    nmcli connection down uuid "$UUID" >/dev/null 2>&1
  else
    nmcli connection up uuid "$UUID" >/dev/null 2>&1
  fi
  pkill -RTMIN+9 waybar   # refresh the module immediately
  exit 0
fi

# --- status output ----------------------------------------------------------
if is_up; then
  ip=$(nmcli -t -f IP4.ADDRESS connection show "$NAME" 2>/dev/null | head -1 | cut -d: -f2)
  printf '{"text":"%s","class":"connected","tooltip":"WS-EU-VPN: connected\\n%s\\nClick to disconnect"}\n' \
    "$ICON" "${ip:-up}"
else
  printf '{"text":"%s","class":"disconnected","tooltip":"WS-EU-VPN: disconnected\\nClick to connect"}\n' \
    "$ICON"
fi
