#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Lookup-KeybVis
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup-KeybVis..." }
# @raycast.description lookup keyboard visualization html
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"

QUERY="$1"

if [ -z "$QUERY" ]; then
  head -n 15 "$FILE"
  exit 0
fi

PRIMARY=$(rg -i "^$QUERY\b" "$FILE")

if [ -n "$PRIMARY" ]; then
  echo "$PRIMARY"
  exit 0
fi

rg -i "$QUERY" "$FILE" | head -n 20