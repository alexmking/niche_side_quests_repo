#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit Madden
# @raycast.mode compact
# @raycast.description Open Madden file in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"

# FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.rtf"
FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"


#### EXPL WHY WE "DO" in fact need to make madden doc a .txt file INSTEAD of .rtf file:
# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨
# NOTE: Actually we SHOULD EVENTUALLY convert the madden .rtf file to .txt file BECAUSE... while the search DOES STILL FUNCTION on 
# the .rtf file, it's actually searching the .txt-REPRESENTATION of the file, which is drowning is gibberish text related to all 
# the color/formatting I have atm...
#     SO... we can keep using the .rtf file FOR NOW... but DEFINITELY SHOULD change it to .txt file ASAP...
# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨


# ❗TODO❗ STILL NEED TO save a SNAPSHOT of the curr MADDEN06 doc as backup THEN...
# ❗TODO❗ THEN I need to cleanup the doc itself, removing all the duplicate entries AND...
# ❗TODO❗ AND... confirming what the CURRENT-ACTIVE entry is for each Entry ...
# ❗TODO❗ AND FINALLY...maybe some general formatting rules/order if I feel like it...

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"
# Open in VS Code (TRYING TO FIX THE SLOWNESS w this same-window flag, idk)
# code --reuse-window "$FILE"


# 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 
# ASK GPT THIS QUESTION FOR THIS SCRIPT, just like I did for LOOKUP-REF script:
# I want to enhance this script by adding some formatting to the matches it's showing in the output.
# 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 

