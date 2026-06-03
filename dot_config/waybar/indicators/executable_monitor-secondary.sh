#!/bin/bash
TOGGLE_FILE="$HOME/.local/state/omarchy/toggles/hypr/external-monitor-hdmi-a2-disable.lua"

if [[ -f $TOGGLE_FILE ]]; then
  echo '{"text": "󰍹", "tooltip": "Secondary monitor: OFF\nClick to turn on", "class": "off"}'
else
  echo '{"text": "󰍹", "tooltip": "Secondary monitor: ON\nClick to turn off", "class": "active"}'
fi
