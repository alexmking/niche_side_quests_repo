# @raycast.schemaVersion 1
# @raycast.title Edit SSOT Refs TEST - USING POWERSHELL
# @raycast.mode silent
# @raycast.description Open ssot-refs.txt in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

$FILE = "D:\git\niche_side_quests_repo\_universal\ssot-refs.md"

# Check if file exists
if (!(Test-Path $FILE)) {
    Write-Output "File not found: $FILE"
    exit 1
}

# Open in VS Code
& code $FILE
