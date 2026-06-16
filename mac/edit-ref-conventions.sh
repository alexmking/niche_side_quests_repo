#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit Ref-Conventions
# @raycast.mode compact
# @raycast.description Open ref-official-conventions-&-guidelines.txt in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-ref.txt"
FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ref-official-conventions-&-guidelines.txt"



# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"
# Open in VS Code (TRYING TO FIX THE SLOWNESS w this same-window flag, idk)
# code --reuse-window "$FILE"

