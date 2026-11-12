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

# Copy the equivalent terminal command to the clipboard (no trailing newline)
printf '%s' "code \"$FILE\"" | clip.exe

# Open in VS Code
code "$FILE"

# Silent mode shows the last output line as a Raycast toast
echo "📋 Copied: code \"$FILE\""
