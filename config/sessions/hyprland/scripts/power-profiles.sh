#!/usr/bin/env bash
if pgrep -x "rofi" > /dev/null; then
    pkill rofi
    exit 0
fi
CURRENT=$(powerprofilesctl get)
ROFI_OVERRIDE="
    /* 1. Global Reset */
    * {
        font: \"JetBrainsMono Nerd Font Bold 13\";
        background-color: transparent;
        text-color:
        margin: 0;
        padding: 0;
        spacing: 0;
    }
    /* 2. Window Container */
    window {
        width: 450px;
        height: 380px;
        background-color:
        border: 2px;
        border-color: rgba(255, 255, 255, 0.08);
        border-radius: 20px;
        anchor: center;
        location: center;
    }
    mainbox {
        orientation: vertical;
        children: [ inputbar, listview ];
        padding: 30px;
        spacing: 20px;
    }
    /* 3. Header */
    inputbar {
        children: [ prompt ];
        orientation: horizontal;
    }
    prompt {
        background-image: linear-gradient(to right,
        text-color:
        padding: 12px;
        border-radius: 12px;
        font: \"JetBrainsMono Nerd Font ExtraBold 14\";
        horizontal-align: 0.5;
        width: 100%;
        margin-bottom: 5px;
    }
    /* 4. The List */
    listview {
        layout: vertical;
        lines: 3;
        spacing: 12px;
    }
    /* 5. THE FIX: Explicit State Definitions */
    /* This styling applies to the 'box' of the item */
    element {
        orientation: horizontal;
        children: [ element-text ];
        padding: 15px 20px;
        border-radius: 12px;
        border: 1px;
        border-color: transparent;
    }
    /* Force NORMAL and ALTERNATE rows to use the dark grey surface color */
    /* This overwrites the default yellow/white zebra striping */
    element normal.normal, element alternate.normal {
        background-color: rgba(49, 50, 68, 0.4);
        text-color:
    }
    /* Selected State */
    element selected.normal {
        background-image: linear-gradient(to right,
        border-color:
        text-color:
    }
    /* Text Alignment */
    element-text {
        vertical-align: 0.5;
        horizontal-align: 0.0;
        text-color: inherit;
    }
"
ICO_PERF=""
ICO_BAL=""
ICO_SAVE=""
TXT_PERF="Performance"
TXT_BAL="Balanced"
TXT_SAVE="Power Saver"
OPT_PERF="<span font='16px' weight='bold' color='#f38ba8'>${ICO_PERF}</span>   <span weight='bold'>${TXT_PERF}</span>"
OPT_BAL="<span font='16px' weight='bold' color='#89b4fa'>${ICO_BAL}</span>   <span weight='bold'>${TXT_BAL}</span>"
OPT_SAVE="<span font='16px' weight='bold' color='#a6e3a1'>${ICO_SAVE}</span>   <span weight='bold'>${TXT_SAVE}</span>"
OPTIONS="$OPT_PERF\n$OPT_BAL\n$OPT_SAVE"
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu \
    -markup-rows \
    -p "Current: ${CURRENT^}" \
    -config /dev/null \
    -theme-str "$ROFI_OVERRIDE")
if [ -z "$CHOICE" ]; then
    exit 0
fi
case "$CHOICE" in
    *"Performance"*)
        powerprofilesctl set performance
        notify-send "System Power" "Switched to Performance Mode "
        ;;
    *"Balanced"*)
        powerprofilesctl set balanced
        notify-send "System Power" "Switched to Balanced Mode "
        ;;
    *"Power Saver"*)
        powerprofilesctl set power-saver
        notify-send "System Power" "Switched to Power Saver "
        ;;
esac