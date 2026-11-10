#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Lookup-Aliases-Mac
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup-Aliases-Mac..." }
# @raycast.description lookup macaliases (.zshrc)
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"

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



# 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 
# ASK GPT THIS QUESTION FOR THIS SCRIPT, just like I did for LOOKUP-REF script:
# I want to enhance this script by adding some formatting to the matches it's showing in the output.
# 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 