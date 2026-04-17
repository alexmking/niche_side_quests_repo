#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Useful Paths
# @raycast.mode fullOutput
# @raycast.description Works BOTH as a FUZZY-FINDER and/or Dropdown of all of my most used PATHS that I can copy to clipboard upon selection (and even extend options AFTER selection via clever INLINE-MODE functionality that I've yet to try out)
# @raycast.packageName Developer Utils
# @raycast.icon 📖


### inline mode requires a bit more thought/ setup but def has some MASSIVE potential for being crazy useful/ applicable 
###### @raycast.mode inline
###### @raycast.refreshTime 1




# ---------------------------------------------------------------------------------
###### ALL THE USEFUL PATHS TO INCLUDE IN OUR DROPDOWN ######
# ---------------------------------------------------------------------------------
SSOT_PATH="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
KEYBVIS_PATH="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
AEROSPACE_PATH="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"
MADDEN_PATH="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"


# @raycast.argument1 { "type": "dropdown", "placeholder": "sel or start-typing", "optional": true, "data": [{"title": "refsmd", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "keybVis", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "madden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"}] }
#### @raycast.argument1 { "type": "dropdown", "placeholder": "sel file", "optional": true, "data": [{"title": "refsmd", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "keybVis", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "madden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"}] }


# ---------------------------------------------------------------------------------
# THIS IS HOW YOU REFERENCE THE dropdown 'SELECTION' and use it in the scripts logic 
# ---------------------------------------------------------------------------------
CHOSEN_DROPDOWN="$1"
# and if there was another dropdown, then it would be ref by $2 instead of $1 etc etc
echo "reading selection as: $CHOSEN_DROPDOWN (hopefully it's the path)"


# Open in VS Code
# code "$CHOSEN_DROPDOWN"
# code "$FILE"
# Open in VS Code (TRYING TO FIX THE SLOWNESS w this same-window flag, idk)
# code --reuse-window "$FILE"














###### DOCUMENTATION for Script-Commands here: ###########
###     https://github.com/raycast/script-commands
###### DOCUMENTATION for Script-Commands here: ###########
