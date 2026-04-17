#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Edit KeybVis TEST USING APPLE-SCRIPT
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📝
# @raycast.description Open keyboard visualization file in VS Code for quick edits
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

set filePath to "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"

set fileExists to do shell script "[ -f " & quoted form of filePath & " ] && echo 'yes' || echo 'no'"

if fileExists is "no" then
	log "File not found: " & filePath
else
	do shell script "code " & quoted form of filePath
end if

