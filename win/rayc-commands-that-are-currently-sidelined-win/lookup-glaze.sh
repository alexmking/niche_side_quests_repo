# !/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Lookup Glaze
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup Glaze..." }
# @raycast.description Lookup Glaze config
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
# FILE="C:\Users\aking\Downloads\cmder\config\user_aliases.cmd"
FILE="C:\Users\aking\.glzr\glazewm\config.yaml"

QUERY="$1"

if [ -z "$QUERY" ]; then
  head -n 15 "$FILE"
  exit 0
fi

PRIMARY=$(rg -i -F "$QUERY" "$FILE" | head -n 5)

if [ -n "$PRIMARY" ]; then
  echo "$PRIMARY"
  echo ""
  echo "--- More results ---"
fi

rg -i -F "$QUERY" "$FILE" | head -n 20


# ---------------------
# OLD DEFAULT RIP GREP CODE: (before we fixed the regex part that was only catching matches at START of lines)
# ---------------------
# QUERY="$1"

# if [ -z "$QUERY" ]; then
#   head -n 15 "$FILE"
#   exit 0
# fi

# PRIMARY=$(rg -i "^$QUERY\b" "$FILE")

# if [ -n "$PRIMARY" ]; then
#   echo "$PRIMARY"
#   exit 0
# fi

# rg -i "$QUERY" "$FILE" | head -n 20
