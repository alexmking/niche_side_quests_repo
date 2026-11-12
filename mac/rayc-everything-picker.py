#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Everything Picker
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

### other icon options: 🧠 ⚡ 

# @raycast.argument1 { "type": "dropdown", "placeholder": "Select a path", "required": true, "data": [{"title": "refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}, {"title": "zshrc aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "keyb shortcuts vis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "zzmadden", "value": "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"}, {"title": "zzshortcuts", "value": "/Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm"}, {"title": "p10k", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "zprofile", "value": "/Users/alexking/.zprofile"}, {"title": "oh-my-zsh", "value": "/Users/alexking/.oh-my-zsh/"}, {"title": "fzf key-bindings", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "screenshot dir", "value": "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"}, {"title": "quick-ref dir", "value": "/Users/alexking/amk/notes/quick_ref"}, {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, {"title": "niche-mac dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"}, {"title": "niche-universal dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"}, {"title": "amk dir", "value": "/Users/alexking/amk/"}, {"title": "leet script", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py"}] }
###@raycast.argument1 { "type": "dropdown", "placeholder": "sel path", "optional": true, "data": [{"title": "aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "flexprompt", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "fzf", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "ssot-refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}] }

# Documentation:
# @raycast.description THIS SCRIPT IS 1 OF 3 PARTS TO MY PATH SEARCH SYSTEM: where we get a fzf/dropdown of all our main/most-common paths and copies the selected path to clipboard
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921



# ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐
# POTENTIAL NAME CHANGES THAT I MAY MAKE SOON:
# - All-in-One Picker
# - Omni Picker
# - Universal Picker
# - Master Picker
# - Every Picker
# ⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐⭐





import os
import sys
import subprocess
selection = sys.argv[1]


#### 1️⃣HANDLE EXCEL FILES differently...since they dont open properly when we just do "open " + path, so need to do "open -a Microsoft\ Excel " + path instead (and may need to do this for other file types in the future too, such as .md files or something etc etc, so may need to build out some kind of system for handling different file types differently based on their extension or something etc etc)
#### 2️⃣HANDLE CONFIG FILES by opening them in vs code for editing instead of just opening them normally since most of the time if we're sel config files we want to edit them, so may as well just open them in vs code directly instead of just opening them in their default program which for some of them is just textedit and not ideal for editing config files etc etc
#### 3️⃣HANDLE DIRS by opening them in finder instead of just opening them normally since if we sel a dir then we probably want to open it in finder to look around in it and navigate to subdirs and stuff etc etc, so may as well just open it in finder directly instead of just opening it in the default program which for dirs is just textedit and not ideal for looking around in dirs etc etc



# ❗TODO❗ this is just bare bones of the if()s, I still need to define each condition and then set the ACTION to either:
#               "Code myFile" or 
#               "open myFile" or
#               "open myDir in finder"
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
# {"title": "quick ref dir", "value": "/Users/alexking/amk/notes/quick_ref"}, 
# {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, 
# {"title": "niche-mac dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"}, 
# {"title": "niche-universal dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"}, 
# {"title": "amk dir", "value": "/Users/alexking/amk/"}, 
# {"title": "leet script", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py"}
# ] }





# {"title": "screenshot dir", "value": "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"}, 
# {"title": "quick ref", "value": "/Users/alexking/amk/notes/quick_ref"}, 
# {"title": "niche dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"}, 
# {"title": "niche-mac dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"}, 
# {"title": "niche-universal dir", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"}, 
# {"title": "amk dir", "value": "/Users/alexking/amk/"}, 















##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
# REMINDER THIS SCRIPT IS 1 OF 3 PARTS TO MY PATH SEARCH SYSTEM: (outlined in ssot-ref OR... I copy-pasted it at bottom of this file as well for easy access)
#          - 1️⃣ p == signle char alias for 'search-my-main-paths' command in raycast (maybe needs to be a script-command)
#          - 2️⃣ HOTKEY == for the above 'search-my-main-paths' command in raycast (so both p and the HOTKEY would be on the same command) 
#          - 3️⃣ pzzshortcuts == raycast-alias for the individual snippet/quicklink with zzshortcuts PATH (so every path would have 1 of these created just for it within raycast)
#               ! TODO: outside of this script we still have to create INDIVIDUAL QUICKLINKS/or SNIPPETS (whatever works best) for EACH path we want in our quick-search system, and THEN set the ALIAS of each of them to have the pre-pend 'p' char, like example below:
#                       pzzshortcuts    == raycast-alias for the individual snippet/quicklink
#                       pkeybvis        == raycast-alias for keybvis 
#                       pssot-ref       == 
#                       pmadden         == 
#                       ... etc ... etc ...
#                       👀 SNIPPET-KEYWORD EXAMPLES 👀 (should be shorter than the p-aliases)
#                       zzshortcuts     ==  pzz     ⭐
#                       pkeybvis        ==  pkey    ⭐
#                       pssot-ref       ==  pref    ⭐
#                       pmadden         ==  pmad    ⭐

##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
##########################################################################################################
#                       ! CAUTION: Remember these quicklinks/snippets with the leading 'p' only copy/grab the PATH of the file (hence the 'p' for path)....so DONT CONFUSE these with the other normal quicklinks that actually OPEN the said file...rather these 'p' based quicklinks ONLY COPY/GRAB the PATH for that file...


# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# ! GOAL ==> we want to assign this SCRIPT-COMMAND to have an ALIAS and HOTKEY of the following:
# !     p == signle char alias for 'search-my-main-paths' command in raycast (maybe needs to be a script-command)
# !     HOTKEY == for the above 'search-my-main-paths' command in ray (HOTKEY will prob be something like HYPER-P or smthn)
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        #  - 4️⃣ FOUND ANOTHER LAYER w SNIPPETS-KEYWORDS...snippet-keywords are diff from ALIASES in that they automatically paste hte entire sniipet once you type out the ykeyword, ANYWHERE
        #     - 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 
        #     - so if i set 'pzz' as keyword for zzshorts path, then i type pzz and instantly it will be replaced by /Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm
        #     - 🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨 

