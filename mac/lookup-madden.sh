#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Lookup-Madden
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup-Madden..." }
# @raycast.description lookup madden
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"

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