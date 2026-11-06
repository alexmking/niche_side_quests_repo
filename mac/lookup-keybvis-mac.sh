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
FILE2="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/vscode-shortcuts.html"



QUERY="$1"

if [ -z "$QUERY" ]; then
  head -n 15 "$FILE"
  exit 0
fi

search_file() {
  local file="$1"
  local filename="${file##*/}"
  local primary
  local matches

  primary=$(rg -i "^$QUERY\b" "$file")
  if [ -n "$primary" ]; then
    printf 'Results from %s:\n%s\n\n' "$filename" "$primary"
    return
  fi

  matches=$(rg -i "$QUERY" "$file" | head -n 20)
  if [ -n "$matches" ]; then
    printf 'Results from %s:\n%s\n\n' "$filename" "$matches"
  fi
}

search_file "$FILE"
search_file "$FILE2"

# 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 
# ASK GPT THIS QUESTION FOR THIS SCRIPT, just like I did for LOOKUP-REF script:
# I want to enhance this script by adding some formatting to the matches it's showing in the output.
# 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 