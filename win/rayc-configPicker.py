#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Config Picker
# @raycast.mode silent
# @raycast.icon 🤖
# @raycast.packageName Developer Utils
# @raycast.description trying fzf/dropdown for all configs

# @raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"} ] }
#####BACKUP@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "madden", "value": "M"} ] }





# C:\Users\aking\Downloads\cmder\config\user_aliases.cmd
# C:\Users\aking\.glzr\glazewm\config.yaml
# C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\king_app_switcher1.ahk
# C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua
# C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua
# code D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html
# D:\git\niche_side_quests_repo\_universal\ssot-refs.md

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921
import os
import sys
# print("Hello World! Argument1 value: " + sys.argv[1])
selection = sys.argv[1]

# os.system(r"Code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd")
# A H G P F K R M
if selection == "A":
    os.system(r"Code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd")
elif selection == "H":
    os.system(r"Code C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\king_app_switcher1.ahk")
elif selection == "G":
    os.system(r"Code C:\Users\aking\.glzr\glazewm\config.yaml")
elif selection == "P":
    os.system(r"Code C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua")
elif selection == "F":
    os.system(r"Code C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua")
elif selection == "K":
    os.system(r"Code D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html")
elif selection == "R":
    os.system(r"Code D:\git\niche_side_quests_repo\_universal\ssot-refs.md")
else:
    print("ERROR!!!")

    

#########################################
# USE BELOW AS TEMPLATE to create dropdowns, then backspace each line to get the gigantic 1 line mess 
##########################################
####raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "optional": true, "data": [
# {"title": "aliases", "value": 1}, 
# {"title": "ahk", "value": 2}, 
# {"title": "glaze", "value": 3},
# {"title": "flexprompt", "value": 4}, 
# {"title": "fzf", "value": 5}, 
# {"title": "keybVis", "value": 6},
# {"title": "ssotrefs", "value": "7"}, 
# {"title": "madden", "value": "8"} ] }

# {"title": "aliases", "value": 1},         A
# {"title": "ahk", "value": 2},             H
# {"title": "glaze", "value": 3},           G
# {"title": "flexprompt", "value": 4},      P
# {"title": "fzf", "value": 5},             F   
# {"title": "keybVisualizer", "value": 6},         K
# {"title": "ssot_refs", "value": "7"},      R
# {"title": "madden", "value": "8"} ] }     M