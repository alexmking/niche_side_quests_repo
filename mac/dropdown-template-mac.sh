#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Dropdown Template 
# @raycast.mode fullOutput
# @raycast.description template for how to use dropdown selection(s) in script-commands
# @raycast.packageName Developer Utils
# @raycast.icon 📖


### inline mode requires a bit more thought/ setup but def has some MASSIVE potential for being crazy useful/ applicable 
###### @raycast.mode inline
###### @raycast.refreshTime 1

#####################################################
# ALERT!! Use smart-configs.py as the template for this...
#####################################################

###### DOCUMENTATION for Script-Commands here: ###########
###     https://github.com/raycast/script-commands
###### DOCUMENTATION for Script-Commands here: ###########


SSOT_PATH="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
KEYBVIS_PATH="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
AEROSPACE_PATH="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"
MADDEN_PATH="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"


# @raycast.argument1 { "type": "dropdown", "placeholder": "sel file", "optional": true, "data": [{"title": "refsmd", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "madden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"}] }
#### @raycast.argument1 { "type": "dropdown", "placeholder": "sel file", "optional": true, "data": [{"title": "refsmd", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "madden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"}] }


# ---------------------------------------------------------------------------------
# At the moment it seems you must use string literals in the value defintion for each dropdown (as opposed to $PATH1, $PATH2, etc. like I tried above 20 diff ways but none of it worked)
# ---------------------------------------------------------------------------------
# MY DROPDOWN EXPL:
# this dropdown should contain full-paths to all the most common files i'd be editing...(the path is the VALUE) while the TITLE is the filename itself (so from our pov, we'll only see the simple, clean filenames and not the corresp full path)
# OTHER DROPDOWN templates im trying out:
# { "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "64", "value": "64"}, {"title": "42", "value": "42"}] }
# { "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "refsmd", "value": "$SSOT_PATH"}, {"title": "keybVis", "value": "$KEYBVIS_PATH"}, {"title": "aerospace", "value": "$AEROSPACE_PATH"}, {"title": "madden", "value": "$MADDEN_PATH"}] }
###{ "type": "dropdown", "placeholder": "cols", "optional": true, "data": [{"title": "refsmd", "value": "$SSOT_PATH"}, {"title": "keybVis", "value": "KEYBVIS_PATH"}, {"title": "aerospace", "value": "$AEROSPACE_PATH"}, {"title": "madden", "value": "$MADDEN_PATH"}] }

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



# ---------------------------------------------------------------------------------
# HOW TO USE COLORS in output for inline and fullOutput modes in BASH...
# ---------------------------------------------------------------------------------
echo -e '\033[31;42mred text on green background\033[0m'

echo -e '\033[36;107mred text on green background\033[0m'

echo -e '\033[97;41mred text on green background\033[0m'

echo -e '\033[97;40mred text on green background\033[0m'

echo -e '\033[97;42mred text on green background\033[0m'
echo -e '\033[97;43mred text on green background\033[0m'
echo -e '\033[97;44mred text on green background\033[0m'
echo -e '\033[97;45mred text on green background\033[0m'
echo -e '\033[97;46mred text on green background\033[0m'

echo -e '\033[40;42mred text on green background\033[0m'
echo -e '\033[30;42mred text on green background\033[0m'
echo -e '\033[30;107mred text on green background\033[0m'

# echo -e '\033[<TEXT-COLOR-CODE-HERE>;<BACKGROUND-COLOR-CODE-HERE>mred text on green background\033[0m'
# echo -e '\033[<TEXT-COLOR-CODE-HERE>;<BACKGROUND-COLOR-CODE-HERE>mred text on green background\033[0m'
# echo -e '\033[<TEXT-COLOR-CODE-HERE>;<BACKGROUND-COLOR-CODE-HERE>mred text on green background\033[0m'

#echo -e '\0<TEXT-COLOR-CODE-HERE>[31;42mred text on green background\033[0m'

# red == 31 when textColor
# green == 42 when background color


# textColor codes: 
# 30 == black
# 31 == red
# 32 == green
# 33 == yellow
# 34 == blue
# 35 == magenta
# 36 == cyan
# 97 == white

# background color codes:
# 40 == black
# 41 == red
# 42 == green
# 43 == yellow
# 44 == blue
# 45 == magenta
# 46 == cyan
# 107 == white



# silent mode:
# the last line (if exists) will be shown in overlaying HUD toast after Raycast window is closed. 
# compact mode: 
# the last line of the standard output is shown in the toast
# inline mode: (supports colors) [!!! NOTE this mode requires refreshTime parameter ]
# the first line of output will be directly shown in the command item and automatically refresh according to the specified refreshTime. Tip: Set your dashboard items as favorites via the action menu in Raycast. NOTE: refreshTime parameter is required for inline mode. When not specified, compact mode will be used instead. 
# fullOutput: (supports colors)
# the entire output is presented on a separate view, similar to a terminal window. This is handy when your script generates output to consume. 