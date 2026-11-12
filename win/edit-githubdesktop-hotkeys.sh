# !/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit github-desktop hotkeys (app-specific)
# @raycast.mode silent
# @raycast.description Open github desktop hotkeys in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝


# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\hotkeys_vscode.txt
# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\hotkeys_trello.txt
# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\hotkeys_iterm_and_cmder.txt
# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\hotkeys_finder_and_fileExpl_and_general.txt
# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\hotkeys_excel.txt
# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\hotkeys_chrome_jira_github.txt
# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\win_only\hotkeys_teams.txt
# D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\win_only\hotkeys_github_desktop.txt 

# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
FILE="D:\git\niche_side_quests_repo\_universal\app_specific_hotkeys\win_only\hotkeys_github_desktop.txt"

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