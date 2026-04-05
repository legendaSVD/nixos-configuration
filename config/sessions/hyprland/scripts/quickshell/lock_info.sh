#!/usr/bin/env bash
BAT_PATH="/sys/class/power_supply/BAT0"
if [ ! -d "$BAT_PATH" ]; then
    BAT_PATH="/sys/class/power_supply/BAT1"
fi
if [ -d "$BAT_PATH" ]; then
    BAT_PCT=$(cat "$BAT_PATH/capacity" 2>/dev/null || echo "100")
    BAT_STATUS=$(cat "$BAT_PATH/status" 2>/dev/null || echo "Unknown")
else
    BAT_PCT="100"
    BAT_STATUS="AC"
fi
CURRENT_USER=$(getent passwd "$USER" | cut -d: -f5 | cut -d, -f1)
if [ -z "$CURRENT_USER" ]; then
    CURRENT_USER=${USER^}
fi
LAYOUT=$(hyprctl devices -j 2>/dev/null | jq -r '.keyboards[] | select(.main == true) | .active_keymap' | head -n 1)
if [[ "$LAYOUT" == *"English (US)"* ]]; then
    KB_LAYOUT="US"
elif [[ "$LAYOUT" == *"Russian"* ]]; then
    KB_LAYOUT="RU"
elif [ -z "$LAYOUT" ] || [ "$LAYOUT" == "null" ]; then
    KB_LAYOUT="UNK"
else
    KB_LAYOUT="${LAYOUT:0:3}"
fi
echo "$BAT_PCT"
echo "$BAT_STATUS"
echo "$CURRENT_USER"
echo "$KB_LAYOUT"