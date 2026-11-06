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


#####################################
### ENHANCEMENTS TO IMPLEMENT SOON
#####################################
## 1. have it be able to search across more than 1 file
##### - maybe rule where itll only search the next file if the original search yields no results
######## - as it may slow the search process if there are many files to check EVERY time, since it would have to iterate through all of them regardless of whether the first file had matches. And tbh, most of the time it will find results for the first file anyway. (at least for this narrowed-down keyb-shortcut files instead of the main 2 giant ref.txt files)


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