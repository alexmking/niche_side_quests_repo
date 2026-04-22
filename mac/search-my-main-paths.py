#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search Main Paths
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

# @raycast.argument1 { "type": "dropdown", "placeholder": "sel path", "optional": true, "data": [{"title": "aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "flexprompt", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "fzf", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "ssot-refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}] }

# Documentation:
# @raycast.description THIS SCRIPT IS 1 OF 3 PARTS TO MY PATH SEARCH SYSTEM: where we get a fzf/dropdown of all our main/most-common paths, to which it automatically copies(or pastes too?) upon selection
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921



















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



















#####################################################
# ALERT!! Use smart-configs.py as the template for this...
#####################################################

import os
import sys
# os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/scr-leet_morning_random.py " + sys.argv[1] + " " + sys.argv[2])
# os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/scr-leet_morning_random.py " + sys.argv[1] + " " + sys.argv[2])

os.system("Code " + sys.argv[1])




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