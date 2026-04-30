#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Config Picker
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

# @raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "optional": true, "data": [{"title": "aliases", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"}, {"title": "aerospace", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"}, {"title": "flexprompt", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"}, {"title": "fzf", "value": "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"}, {"title": "keybVis", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"}, {"title": "ssot-refs", "value": "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"}] }


# Documentation:
# @raycast.description Similar to Advanced-Finder where it gives fzf/dropdown of all our config files (or at least the ones we'd need to edit/look-at), but also it's useful to just be able to arrow up/down through all of them from 1 central spot
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921



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

