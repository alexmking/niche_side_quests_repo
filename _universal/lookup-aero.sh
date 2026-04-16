#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Lookup Aero
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup Aero..." }

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"

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