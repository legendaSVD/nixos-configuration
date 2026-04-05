#!/usr/bin/env bash
BT_PID_FILE="$HOME/.cache/bt_scan_pid"
if [ -f "$BT_PID_FILE" ]; then
    kill $(cat "$BT_PID_FILE") 2>/dev/null
    rm -f "$BT_PID_FILE"
fi
bluetoothctl scan off > /dev/null 2>&1
SEQ_END=8
print_workspaces() {
    spaces=$(hyprctl workspaces -j)
    active=$(hyprctl activeworkspace -j | jq '.id')
    echo "$spaces" | jq --unbuffered --argjson a "$active" --arg end "$SEQ_END" -c '
        (map( { (.id|tostring): . } ) | add) as $s
        |
        [range(1; ($end|tonumber) + 1)] | map(
            . as $i |
            (if $i == $a then "active"
             elif ($s[$i|tostring] != null and $s[$i|tostring].windows > 0) then "occupied"
             else "empty" end) as $state |
            (if $s[$i|tostring] != null then $s[$i|tostring].lastwindowtitle else "Empty" end) as $win |
            {
                id: $i,
                state: $state,
                tooltip: $win
            }
        )
    '
}
print_workspaces
socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
    case "$line" in
        workspace*|focusedmon*|activewindow*|createwindow*|closewindow*|movewindow*|destroyworkspace*)
            print_workspaces
            ;;
    esac
done