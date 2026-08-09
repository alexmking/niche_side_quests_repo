# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit C Leet
# @raycast.mode silent
# @raycast.description Opens tmp file w all the leet probs that are good for C++ refresher
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="C:\Program Files\AutoHotkey\UX\king_app_switcher1.ahk"
# FILE="D:\git\niche_side_quests_repo\_universal\scr-leet_morning_random.py"
FILE="D:\git\niche_side_quests_repo\_universal\scr-leet_morning_random_EXPERIMENTAL1.0.py"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"