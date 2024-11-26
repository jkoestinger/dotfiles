#!/bin/bash

pkill -x waybar || true
sleep 1

waybar &

notify-send "Waybar restarted"

hyprctl dispatch submap reset
