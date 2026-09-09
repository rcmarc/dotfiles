#!/bin/sh
formatted_date=$(date  "+%D %R")
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
current_brightness=$(cat /sys/class/backlight/*/brightness)
max_brightness=$(cat /sys/class/backlight/*/max_brightness)
percentage_brightness=$((100 * current_brightness / max_brightness ))
echo "date: $formatted_date | bat: $battery_level% | bri: $percentage_brightness%"
