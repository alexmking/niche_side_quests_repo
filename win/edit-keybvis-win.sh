# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit KeybVis 
# @raycast.mode silent
# @raycast.description Open KeybVis Visualizer html script in VS Code
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
FILE="D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"