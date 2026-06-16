# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit scratchpaper
# @raycast.mode silent
# @raycast.description Open scratchpaper file in vscode
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html"
# FILE="C:\Users\aking\amk\tools\alex_scripts\scr-scratch_paper_area.py"
FILE="C:\Users\aking\amk\tools\alex_scripts\scr-scratch_paper_area.txt"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"