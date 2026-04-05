#!/usr/bin/env bash
SAVE_DIR="$HOME/Images/Screenshots"
mkdir -p "$SAVE_DIR"
time=$(date +'%Y-%m-%d-%H%M%S')
FILENAME="$SAVE_DIR/Screenshot_$time.png"
SLURP_ARGS="-b 1B1F2844 -c E06B74ff -s C778DD0D -w 2"
send_notification() {
    if [ -s "$FILENAME" ]; then
        notify-send -a "Screenshot" \
                    -i "$FILENAME" \
                    "Screenshot Saved" \
                    "File: Screenshot_$time.png\nFolder: $SAVE_DIR"
    fi
}
EDIT_MODE=false
for arg in "$@"; do
    case $arg in
        --edit) EDIT_MODE=true ;;
    esac
done
GEOMETRY=$(slurp $SLURP_ARGS)
if [ -z "$GEOMETRY" ]; then
    exit 0
fi
if [ "$EDIT_MODE" = true ]; then
    grim -g "$GEOMETRY" - | GSK_RENDERER=gl satty --filename - --output-filename "$FILENAME" --init-tool brush --copy-command wl-copy
    send_notification
else
    grim -g "$GEOMETRY" - | tee "$FILENAME" | wl-copy
    send_notification
fi