#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title ignore me - dumping ground for excess code
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils 

# Documentation:
# @raycast.description once you finally get a script-command working and need to clean up all the excess commented out code so the official script is nice and clean: paste all that code here before you delete it just in case you actually want/need it or deleted something you shouldnt
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921



# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨
# THIS IS NOT A REAL SCRIPT, it's just a place a paste all the excess code I delete after finishing a script/file etc
# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨



# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨
# Very similar to the scratchpaper script I made a while ago, where it's simply a designated dumping ground for any random code I feel I may need but likely wont
# 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨 🚨

print("Hello World!")





#### @raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "optional": true, "data": [
# {"title": "aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, 
# {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, 
# {"title": "flexprompt", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, 
# {"title": "fzf", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, 
# {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, 
# {"title": "ssot-refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, 
# {"title": "madden", "value": "8"}
# ] }



# import sys
# print("Hello World! Argument1 value: " + sys.argv[1])













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








# - ⭐😮 PATH SEARCH SYSTEM: Expanding on my idea of mirroring the same pre-pend word/char in alias stuff that I have for my terminal (such as cd, edit, list, get ...), I just realized we can actually capture THIS and all the OTHER alias/char-triggers/etc everything else at the same time:
#    - EXPL:
#          - 1️⃣ p == signle char alias for 'search-my-main-paths' command in raycast (maybe needs to be a script-command)
#          - 2️⃣ HOTKEY == for the above 'search-my-main-paths' command in raycast (so both p and the HOTKEY would be on the same command) 
#          - 3️⃣ pzzshortcuts == raycast-alias for the individual snippet/quicklink with zzshortcuts PATH (so every path would have 1 of these created just for it within raycast)
#             - 🤩 we CAN have all these setup and active AT THE SAME TIME (so 3 diff routes to get to same thing)
#          - *TODO:* set this up IMMEDIATELY 


















# TODO: replace the "value" fields in each of the dropdown options with the the following list of paths (in the commented-out @raycast.argument1 below) that I want to have in my quick-search system (so when I select the option with the name of the path, it automatically copies the path to clipboard for me to paste wherever I want...and maybe even auto-paste it for me too?):
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/key-bindings.zsh
# /Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt
# /Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh
# /Users/alexking.zprofile
# /Users/alexking.oh-my-zsh/
# /usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh

# /Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0
# /Users/alexking/amk/notes/quick_ref
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo

# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal
# /Users/alexking/amk/
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py


# =========================================================
# official setup for each of the top paths...spread out into the ONE LINE format we need...
# ========================================================= 
##@raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "zshrc aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "keyb shortcuts vis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "zzmadden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"}, {"title": "zzshortcuts", "value": "/Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm"}, {"title": "p10k", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "zprofile", "value": "/Users/alexking/.zprofile"}, {"title": "oh-my-zsh", "value": "/Users/alexking/.oh-my-zsh/"}, {"title": "fzf key-bindings", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "screenshot dir", "value": "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"}, {"title": "quick ref", "value": "/Users/alexking/amk/notes/quick_ref"}, {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, {"title": "niche-mac dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"}, {"title": "niche-universal dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"}, {"title": "amk dir", "value": "/Users/alexking/amk/"}, {"title": "leet script", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py"}] }


# =========================================================
# official setup for each of the top paths...
# ========================================================= 
##@raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [
# {"title": "refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, 
# {"title": "zshrc aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, 
# {"title": "keyb shortcuts vis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, 
# {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, 
# {"title": "zzmadden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"}, 
# {"title": "zzshortcuts", "value": "/Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm"}, 
# {"title": "p10k", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, 
# {"title": "zprofile", "value": "/Users/alexking/.zprofile"}, 
# {"title": "oh-my-zsh", "value": "/Users/alexking/.oh-my-zsh/"}, 
# {"title": "fzf key-bindings", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, 
# {"title": "screenshot dir", "value": "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"}, 
# {"title": "quick ref", "value": "/Users/alexking/amk/notes/quick_ref"}, 
# {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, 
# {"title": "niche-mac dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"}, 
# {"title": "niche-universal dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"}, 
# {"title": "amk dir", "value": "/Users/alexking/amk/"}, 
# {"title": "leet script", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py"}
# ] }

