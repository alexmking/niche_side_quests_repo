# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit SSOT Refs
# @raycast.mode silent
# @raycast.description Open ssot-refs.txt in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
FILE="D:\git\niche_side_quests_repo\_universal\ssot-refs.md"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"