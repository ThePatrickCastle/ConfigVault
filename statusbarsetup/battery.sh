#!/bin/sh
BAT=/sys/class/power_supply/BAT0/capacity

# Check if the battery file exists
if [ ! -f "$BAT" ]; then
    exit
fi

# Get the current battery percentage
BATTERY_PERCENTAGE=$(cat "$BAT")

# Check if the battery is charging
if [ "$(awk -F = '/^STATUS/ {print $2}' /sys/class/power_supply/BAT0/uevent)" = "Charging" ]; then
    echo "$BATTERY_PERCENTAGE% ⚡"
else
    # Print battery percentage based on value
    case "$BATTERY_PERCENTAGE" in
        100|9[0-9]|8[0-9]) echo "$BATTERY_PERCENTAGE% ";;
        7[0-9]|6[0-9])     echo "$BATTERY_PERCENTAGE% ";;
        5[0-9]|4[0-9])     echo "$BATTERY_PERCENTAGE% ";;
        3[0-9]|2[0-9])     echo "$BATTERY_PERCENTAGE% ";;
        *)                 echo "$BATTERY_PERCENTAGE% ";;
    esac
fi
