#!/usr/bin/env bash
get_sink() { pactl get-default-sink; }
get_vol() { pamixer --get-volume; }
get_mute() { pamixer --get-mute; }
last_sink=$(get_sink)
last_vol=$(get_vol)
last_mute=$(get_mute)
pactl subscribe | grep --line-buffered "Event 'change' on sink" | while read -r line; do
    current_sink=$(get_sink)
    current_vol=$(get_vol)
    current_mute=$(get_mute)
    if [[ "$current_sink" != "$last_sink" ]]; then
        last_sink="$current_sink"
        last_vol="$current_vol"
        last_mute="$current_mute"
        continue
    fi
    if [[ "$current_vol" != "$last_vol" ]] || [[ "$current_mute" != "$last_mute" ]]; then
        swayosd-client --output-volume 0
        last_vol="$current_vol"
        last_mute="$current_mute"
    fi
done