# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit ref conventions
# @raycast.mode silent
# @raycast.description Open ref-official-conventions-&-guidelines.txt in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="D:\git\niche_side_quests_repo\win\workRef-ssot.txt"
# FILE="D:\git\niche_side_quests_repo\win\ssot-workref.txt"
FILE="D:\git\niche_side_quests_repo\_universal\ref-official-conventions-&-guidelines.txt"



# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"