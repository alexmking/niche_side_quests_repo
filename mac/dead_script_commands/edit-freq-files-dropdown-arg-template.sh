#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit Freq Files DROPDOWN TEMPLATE1
# @raycast.mode compact
# @raycast.description Open ssot-refs.txt in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝




SSOT_PATH="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
KEYBVIS_PATH="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
AEROSPACE_PATH="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"
MADDEN_PATH="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"


# @raycast.argument1 { "type": "dropdown", "placeholder": "cols", "required": true, "data": [{"title": "refsmd", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "keybVis", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "madden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"}] }
#### @raycast.argument1 { "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "refsmd", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "keybVis", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "madden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"}] }


# MY DROPDOWN EXPL:
# this dropdown should contain full-paths to all the most common files i'd be editing...(the path is the VALUE) while the TITLE is the filename itself (so from our pov, we'll only see the simple, clean filenames and not the corresp full path)
# OTHER DROPDOWN templates im trying out:
# { "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "64", "value": "64"}, {"title": "42", "value": "42"}] }
# { "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "refsmd", "value": "$SSOT_PATH"}, {"title": "keybVis", "value": "$KEYBVIS_PATH"}, {"title": "aerospace", "value": "$AEROSPACE_PATH"}, {"title": "madden", "value": "$MADDEN_PATH"}] }
###{ "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "refsmd", "value": "$SSOT_PATH"}, {"title": "keybVis", "value": "KEYBVIS_PATH"}, {"title": "aerospace", "value": "$AEROSPACE_PATH"}, {"title": "madden", "value": "$MADDEN_PATH"}] }

# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"

# # Check if file exists
# if [ ! -f "$FILE" ]; then
#   echo "File not found: $FILE"
#   exit 1
# fi

CHOSEN_DROPDOWN="$1"
echo "reading selection as: $CHOSEN_DROPDOWN (hopefully it's the path)"
# Open in VS Code
code "$CHOSEN_DROPDOWN"
# code "$FILE"
# Open in VS Code (TRYING TO FIX THE SLOWNESS w this same-window flag, idk)
# code --reuse-window "$FILE"

## @ raycast.argument1 { "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "64", "value": "64"}, {"title": "42", "value": "42"}] }
## @ raycast.argument1 { "type": "dropdown", "placeholder": "UserName", "required": true, "data": [ { "title": "User 1", "value": "user1" }, { "title": "User 2", "value": "user2" }] }
