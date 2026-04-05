#!/usr/bin/env bash
ACTION=$1
TYPE=$2
ID=$3
VAL=$4
case $ACTION in
    set-volume)
        pactl set-$TYPE-volume "$ID" "$VAL%"
        ;;
    toggle-mute)
        pactl set-$TYPE-mute "$ID" toggle
        ;;
    set-default)
        pactl set-default-$TYPE "$ID"
        ;;
esac