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
# FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"[NOT-USING THIS ONE ANYMORE]
# /Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.rtf


#### EXPL WHY WE "DO" in fact need to make madden doc a .txt file INSTEAD of .rtf file:
# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨
# NOTE: Actually we SHOULD EVENTUALLY convert the madden .rtf file to .txt file BECAUSE... while the search DOES STILL FUNCTION on 
# the .rtf file, it's actually searching the .txt-REPRESENTATION of the file, which is drowning is gibberish text related to all 
# the color/formatting I have atm...
#     SO... we can keep using the .rtf file FOR NOW... but DEFINITELY SHOULD change it to .txt file ASAP...
# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨



# FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.rtf"
FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"
# ❗TODO❗ STILL NEED TO save a SNAPSHOT of the curr MADDEN06 doc as backup THEN...
# ❗TODO❗ THEN I need to cleanup the doc itself, removing all the duplicate entries AND...
# ❗TODO❗ AND... confirming what the CURRENT-ACTIVE entry is for each Entry ...
# ❗TODO❗ AND FINALLY...maybe some general formatting rules/order if I feel like it...

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