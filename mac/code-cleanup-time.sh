#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title code cleanup time
# @raycast.mode silent
# @raycast.description Open the code clean up file in VS Code (remember this is the file where I drop all the excess code I remove as im cleaning up a file after findally getting it working properly.)
# @raycast.packageName Developer Utils
# @raycast.icon 📝



######
# NOTE THIS IS NOT THE CODE CLEANUP FILE, rather it's just the script that QUICK-OPENS that file...
######

⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️
# NOTE: if you find yourself EDITING this file, you are doing it wrong. This is just a middle-man script to make it easier to quickly open the ACTUAL code cleanup file (the dumping-ground.py file) in VS Code. So if you are editing this file, you are doing it wrong. You should be editing the dumping-ground.py file instead, which is the actual code cleanup file.
⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️



# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"
FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/dumping-ground.py"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"




# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"
# Open in VS Code (TRYING TO FIX THE SLOWNESS w this same-window flag, idk)
# code --reuse-window "$FILE"




