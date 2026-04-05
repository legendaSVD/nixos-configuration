#!/usr/bin/env bash
VAULT_DIR="$HOME/Life/Obsidian"
VAULT_NAME="Obsidian"
YEAR=$(date +%Y)
DAY=$(date +%d)
MONTH=$(date +%m)
FILENAME="${DAY}.${MONTH}"
FILEPATH="Diary/${YEAR}/${FILENAME}.md"
FULL_PATH="${VAULT_DIR}/${FILEPATH}"
CONTENTS_PATH="${VAULT_DIR}/Diary/Contents.md"
mkdir -p "${VAULT_DIR}/Diary/${YEAR}"
if [ ! -f "$FULL_PATH" ]; then
    echo "#diary" > "$FULL_PATH"
    echo "" >> "$FULL_PATH"
fi
if [ -f "$CONTENTS_PATH" ]; then
    if ! grep -q "\[\[${FILENAME}\]\]" "$CONTENTS_PATH"; then
        awk -v year="## ${YEAR}" -v entry="- [[${FILENAME}]]" '
        BEGIN { in_year=0; inserted=0 }
        $0 == year { in_year=1; print; next }
        /^
        { print }
        END {
            if (in_year && !inserted) {
                print entry
            } else if (!in_year && !inserted) {
                print ""
                print year
                print entry
            }
        }
        ' "$CONTENTS_PATH" > "${CONTENTS_PATH}.tmp" && mv "${CONTENTS_PATH}.tmp" "$CONTENTS_PATH"
    fi
else
    mkdir -p "$(dirname "$CONTENTS_PATH")"
    echo "## ${YEAR}" > "$CONTENTS_PATH"
    echo "- [[${FILENAME}]]" >> "$CONTENTS_PATH"
fi
xdg-open "obsidian://open?vault=${VAULT_NAME}&file=Diary/${YEAR}/${FILENAME}"