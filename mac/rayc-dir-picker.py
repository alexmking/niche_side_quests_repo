#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Dir Picker
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

### other icon options: 🧠 ⚡ 

# @raycast.argument1 { "type": "dropdown", "placeholder": "Select a Dir", "required": true, "data": [{"title": "quick-ref dir", "value": "/Users/alexking/amk/notes/quick_ref"}, {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, {"title": "keyb shortcuts vis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "zzmadden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"}, {"title": "zzshortcuts", "value": "/Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm"}, {"title": "p10k", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "zprofile", "value": "/Users/alexking/.zprofile"}, {"title": "oh-my-zsh", "value": "/Users/alexking/.oh-my-zsh/"}, {"title": "fzf key-bindings", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "screenshot dir", "value": "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"}, {"title": "quick-ref dir", "value": "/Users/alexking/amk/notes/quick_ref"}, {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, {"title": "niche-mac dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"}, {"title": "niche-universal dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"}, {"title": "amk dir", "value": "/Users/alexking/amk/"}, {"title": "leet script", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py"}] }
###@raycast.argument1 { "type": "dropdown", "placeholder": "sel path", "optional": true, "data": [{"title": "aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "flexprompt", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "fzf", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "ssot-refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}] }

# Documentation:
# @raycast.description opens new finder window at the path you select from the dropdown (so if you sel 'niche dir' option from the dropdown, itll open a new finder window at the niche dir location)
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921


















### some directories to start with to test functionality of the script before we put in the full dropdown list of paths we want:
# /Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0
# /Users/alexking/amk/notes/quick_ref
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal
# /Users/alexking/amk/

import os
import sys

# take the users selection from the dropdown and open a new finder window at that location (so if they select the 'niche dir' option, itll open a new finder window at the niche dir location)
os.system("open " + sys.argv[1])

# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗
# ❗TODO❗ ⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐      
# ❗TODO❗ ALREADY CONFIRMED this works with first two directories, so now just have to add all the other dirs in the @ raycast.argument1 dropdown and test them one by one to make sure they all work when selected from the dropdown (since some of them are a little different like the fzf key-bindings which is a file not a dir, so want to make sure it still works when we sel that option from the dropdown etc etc)
# ❗TODO❗ ⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐⭐   ⭐   ⭐   ⭐      
# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗# ❗TODO❗




###### USE ALL_PATHS to get all the DIRS that should be in the dropdown, then add them to the @raycast.argument1 dropdown and test each one to make sure it works when selected from the dropdown (since some of them are a little different like the fzf key-bindings which is a file not a dir, so want to make sure it still works when we sel that option from the dropdown etc etc)
















































#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
#### USE THIS BELOW TEMPLATE FROM OTHER SCRIPT TO HELP define the giant dropdown mess carefully...
#### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### #### 
#### @raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [
# {"title": "group1", "value": "g1"}, 
# {"title": "group2", "value": "g2"}, 
# {"title": "group3", "value": "g3"}, 
# {"title": "arrays", "value": "1"}, 
# {"title": "stacks", "value": "2"}, 
# {"title": "two pointers", "value": "3"}, 
# {"title": "sliding window", "value": "4"}, 
# {"title": "binary search", "value": "5"}, 
# {"title": "linked list", "value": "6"}, 
# {"title": "trees", "value": "7"}, 
# {"title": "tries", "value": "8"}, 
# {"title": "heaps", "value": "9"}, 
# {"title": "intervals", "value": "10"}, 
# {"title": "greedy", "value": "11"}, 
# {"title": "backtracking", "value": "12"}, 
# {"title": "1D dyn prog", "value": "13"}, 
# {"title": "graph", "value": "14"}, 
# {"title": "2D dyn prog", "value": "15"}, 
# {"title": "any", "value": "a"}
# ] }










