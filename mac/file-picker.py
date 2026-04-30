#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title File Picker
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

### other icon options: 🧠 ⚡ 

# @raycast.argument1 { "type": "dropdown", "placeholder": "Select a path", "required": true, "data": [{"title": "refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "zshrc aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "keyb shortcuts vis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "zzmadden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"}, {"title": "zzshortcuts", "value": "/Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm"}, {"title": "p10k", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "zprofile", "value": "/Users/alexking/.zprofile"}, {"title": "oh-my-zsh", "value": "/Users/alexking/.oh-my-zsh/"}, {"title": "fzf key-bindings", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "screenshot dir", "value": "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"}, {"title": "quick-ref dir", "value": "/Users/alexking/amk/notes/quick_ref"}, {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, {"title": "niche-mac dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"}, {"title": "niche-universal dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"}, {"title": "amk dir", "value": "/Users/alexking/amk/"}, {"title": "leet script", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py"}] }
###@raycast.argument1 { "type": "dropdown", "placeholder": "sel path", "optional": true, "data": [{"title": "aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "flexprompt", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "fzf", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "ssot-refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}] }

# Documentation:
# @raycast.description this script opens the selected file in its default program (so if it's a .txt file itll open in textedit, if it's a .html file itll open in the default browser, if it's a .toml file itll open in vs code since i have that set as the default for toml files etc etc)
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921


import os
import sys


# take the users selection from the dropdown and copy the path to clipboard
import subprocess
selection = sys.argv[1]

#### 1️⃣HANDLE EXCEL FILES differently...since they dont open properly when we just do "open " + path, so need to do "open -a Microsoft\ Excel " + path instead (and may need to do this for other file types in the future too, such as .md files or something etc etc, so may need to build out some kind of system for handling different file types differently based on their extension or something etc etc)
#### 2️⃣HANDLE CONFIG FILES by opening them in vs code for editing instead of just opening them normally since most of the time if we're sel config files we want to edit them, so may as well just open them in vs code directly instead of just opening them in their default program which for some of them is just textedit and not ideal for editing config files etc etc

# ❗TODO❗ this is just bare bones of the if()s, I still need to define each condition and then set the ACTION to either:
#               "Code myFile" or 
#               "open myFile" 
# depending on the file type and what makes the most sense for that file type (so for example if it's a config file then the action will probably be "Code myFile" since we'll want to open it in vs code for editing, but if it's a .md file then the action will probably just be "open myFile" since itll open in the default browser and we can read it there just fine etc etc)

if selection == "A":
        print("You selected option A!")
        # do something for option A
elif selection == "B":
        print("You selected option B!")
        # do something for option B
elif selection == "C":
        print("You selected option C!")
        # do something for option C
elif selection == "C":
        print("You selected option C!")
elif selection == "C":
        print("You selected option C!")
elif selection == "C":
        print("You selected option C!")
elif selection == "C":
        print("You selected option C!")
elif selection == "C":
        print("You selected option C!")
elif selection == "C":
        print("You selected option C!")








