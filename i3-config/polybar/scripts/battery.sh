#!/bin/bash
# ~/.config/polybar/battery.sh
#
#




# Define colors
TOGGLE_FILE="/tmp/polybar_battery_toggle"
BACKGROUND="#b16286"
FOREGROUND_TEXT="#ebdbb2"
FOREGROUND="#ebdbb2"
FOREGROUND_AC="#b8bb26"  # Color when AC is connected
FOREGROUND_BATTERY="#fabd2f"  # Color when on battery
ICON=""


# Check if the AC directory exists
AC_STATUS=$(cat /sys/class/power_supply/AC/online)

# Retrieve battery information
BATTERY_PATH="/sys/class/power_supply/BAT0"

ENERGY_FULL0=$(cat "$BATTERY_PATH/energy_full")
ENERGY_NOW0=$(cat "$BATTERY_PATH/energy_now")
POWER0=$(cat "$BATTERY_PATH/power_now")


BATTERY_PATH="/sys/class/power_supply/BAT1"

ENERGY_FULL1=$(cat "$BATTERY_PATH/energy_full")
ENERGY_NOW1=$(cat "$BATTERY_PATH/energy_now")
POWER1=$(cat "$BATTERY_PATH/power_now")

PERCENTAGE=$(awk "BEGIN {printf \"%.2f\", ($ENERGY_NOW0 + $ENERGY_NOW1) / ($ENERGY_FULL0 + $ENERGY_FULL1) * 100 }")
POWER=$(awk "BEGIN {printf \"%.2f\", ($POWER0 + $POWER1) / 1000000}")

ETA=$(awk "BEGIN {printf \"%.1f\", (($ENERGY_FULL0 + $ENERGY_FULL1) / 1000000) / (($POWER0 + $POWER1) / 1000000)}")

if [ -f "$TOGGLE_FILE" ]; then

echo "%{B$BACKGROUND} %{F$FOREGROUND_TEXT}ETA: $ETA%{F-}%%{B-}"

else

# Determine status and set colors accordingly
if [ "$AC_STATUS" -eq 1 ]; then
    STATUS="AC Connected"
    FOREGROUND=$FOREGROUND_AC
    ICON="󰂄"
else
    STATUS="On Battery"
    FOREGROUND=$FOREGROUND_BATTERY
    PERCENT=$(printf "%.0f" "$PERCENTAGE")
    if [ "$PERCENT" -gt 80 ]; then
      ICON="󰂁"
    elif [ "$PERCENT" -gt 60 ]; then
      ICON="󰁿"
    elif [ "$PERCENT" -gt 40 ]; then
      ICON="󰁽"
    elif [ "$PERCENT" -gt 20 ]; then
      ICON="󰁻"
    else
      ICON="󰂃"
      FOREGROUND_TEXT="#cc241d"
    fi
fi

# if [ $(printf "%.0f" "$POWER" ) -eq "0" ]; then
#   POWER=""
# else
 POWER=" ($POWER W)"
# fi


# Output with formatting
echo "%{B$BACKGROUND} %{F$FOREGROUND_TEXT}%{F-}%{F$FOREGROUND}$STATUS%{F-} %{F$PERCENTAGE_COLOR}$ICON$PERCENTAGE%%{F-}$POWER %{B-}"

fi

