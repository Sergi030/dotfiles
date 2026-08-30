#!/usr/bin/env bash
# Waybar custom/tailscale module
#   (no arg)  -> print JSON status for the bar (text + class for color + tooltip)
#   toggle    -> bring tailscale up/down, then refresh the bar
#
# Color comes from the "class" field, styled in style.css:
#   .connected (green) / .disconnected (red) / .needslogin (yellow)

# Single glyph; color carries the state (like the openvpn widget).
ICON=$(printf '\U000f0565')   # nf-md-shield-check

get_state() { tailscale status --json 2>/dev/null | jq -r '.BackendState // "NoState"'; }

# --- click handler: toggle up/down ----------------------------------------
if [ "$1" = "toggle" ]; then
  if [ "$(get_state)" = "Running" ]; then
    tailscale down 2>/dev/null || pkexec tailscale down
  else
    # `up` with no flags reuses saved prefs (your --login-server headscale.sgarcia.dev)
    tailscale up 2>/dev/null || pkexec tailscale up
  fi
  pkill -RTMIN+8 waybar   # refresh the module immediately
  exit 0
fi

# --- status output ----------------------------------------------------------
json=$(tailscale status --json 2>/dev/null)
state=$(printf '%s' "$json" | jq -r '.BackendState // "NoState"')
self=$(printf '%s'  "$json" | jq -r '.Self.DNSName // ""' | sed 's/\.$//')
peers=$(printf '%s' "$json" | jq -r '[.Peer[]? | select(.Online==true)] | length')
total=$(printf '%s' "$json" | jq -r '(.Peer // {}) | length')

case "$state" in
  Running)
    printf '{"text":"%s","class":"connected","tooltip":"Tailscale: connected\\n%s\\nPeers online: %s/%s\\nClick to disconnect"}\n' \
      "$ICON" "$self" "$peers" "$total" ;;
  NeedsLogin|NoState|Starting)
    printf '{"text":"%s","class":"disconnected","tooltip":"Tailscale: %s\\nClick to connect"}\n' \
      "$ICON" "$state" ;;
  *)
    printf '{"text":"%s","class":"disconnected","tooltip":"Tailscale: stopped\\nClick to connect"}\n' \
      "$ICON" ;;
esac
