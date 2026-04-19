#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Lookup-Ref
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup-Ref..." }
# @raycast.description lookup ssot-ref doc
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"

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