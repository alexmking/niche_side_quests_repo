# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit vsKeybVis 
# @raycast.mode silent
# @raycast.description Open vsKeybVis Visualizer html script in VS Code
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html"
# ;alert ⚠️ CAREFUL COPYING paths for _universal dir since the backslashes vs forward slash conventions are flipped per OS... (hence why you see a few of the FILE paths that are commented-out have diff slash directions)
FILE="D:\git\niche_side_quests_repo\_universal\vscode-shortcuts.html"   #  ⚠️ WINDOWS PATH (aka backslashes)
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/vscode-shortcuts.html"   #  ⚠️ MAC PATH (aka forward slashes)

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"