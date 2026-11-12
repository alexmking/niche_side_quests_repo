# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit trello hotkeys (app-specific)
# @raycast.mode silent
# @raycast.description Open trello hotkeys in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
FILE="D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\hotkeys_trello.txt"


# vscode, trello, cmder, fileexpl, excel, chrome/github.com, teams, github desktop/onenote

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