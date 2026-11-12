#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title File Picker
# @raycast.mode silent
# @raycast.icon 🤖
# @raycast.packageName Developer Utils
# @raycast.description fzf/dropdown of all useful/common files, and opens the selected file (as far as if it opens for editing in vscode or just opens the file normally (like an excelFile), that depends on the selection itself (so some will open for edintg in vscode while others will open normally etc etc))


###############################################################################################################################################
###############################################################################################################################################
################ UNIQUE PERK OF THIS 'FILE' PICKER script compared to the other picket scripts (like the configPicker and dirPicker) is that this one will have a MIX of some files that will open for editing in vscode, while other files will just open normally (like excel files, pdfs, etc), and the logic for which files should open for editing in vscode vs which files should just open normally will be determined on a case by case basis depending on the specific file in question (so for example if its a config file then it will open for editing in vscode, but if its an excel file then it will just open normally instead of in vscode since excel files are meant to be opened normally and not in vscode etc etc)
# the ACTION we take on the selected file CHANGES dpeending on the file, which makes this a good all-around option that can handle alot of what you want to do
# FOR EXAMPLE, if we selected a CONFIG file, then we open-for-editing-in-vscode (since thats very likely the action that makes sense for that specific file)
# BUT... if we selected an EXCEL file, then we just open it normally (since excel files are meant to be opened normally and not in vscode, and also since if we opened an excel file in vscode then it would just open the raw underlying code of the excel file which is not what we want since excel files are meant to be opened normally and not in vscode etc etc)
# i could even include some DIRECTORIES as options to select (in which case it would OPEN NEW FILE EXPLORER WINDOW AT THE SELECTED DIRECTORY instead of opening the file in vscode or just opening the file normally etc etc), but for now im just doing files in this 'filePicker' script, and then i have a separate 'dirPicker' script that is specifically for picking directories and then opening new explorer window at the selected directory, so for now im just keeping directories out of this 'filePicker' script and only including files in this 'filePicker' script, but in the future i could always add some directories to this 'filePicker' script as well if i wanted to (but for now im just keeping directories out of this 'filePicker' script and only including files in this 'filePicker' script, and then if i want to open new explorer window at a specific directory then i can just use my separate 'dirPicker' script that is specifically for picking directories and then opening new explorer window at the selected directory etc etc)
#      ⭐ IMP NOTE ⭐ : maybe we should CHANGE THE NAME to someting MORE GENERIC/broader-spectrum than 'FILE' (since we may include directories too)
#      ⭐ IMP NOTE ⭐ : maybe we should CHANGE THE NAME to someting MORE GENERIC/broader-spectrum than 'FILE' (since we may include directories too)
#      ⭐ IMP NOTE ⭐ : maybe we should CHANGE THE NAME to someting MORE GENERIC/broader-spectrum than 'FILE' (since we may include directories too)
###############################################################################################################################################
###############################################################################################################################################
###############################################################################################################################################



###@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "madden", "value": "M"} ] }




# @raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "zzshortcuts", "value": "Z"}, {"title": "ref_sheet", "value": "E"} ] }







#####@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [
# {"title": "aliases", "value": "A"}, 
# {"title": "ahk", "value": "H"}, 
# {"title": "glaze", "value": "G"}, 
# {"title": "flexprompt", "value": "P"}, 
# {"title": "fzf", "value": "F"}, 
# {"title": "keybVis", "value": "K"}, 
# {"title": "ssot-refs", "value": "R"}, 
# {"title": "zzshortcuts", "value": "Z"}, 
# {"title": "ref_sheet", "value": "E"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# ] }







### FILES that id want to open in VScode for editing:
# any/all confi files...
# aliases file
# AHK switcher file
#
### FILES that id want to just open normally (like excel files, pdfs, etc):
# zzshortscuts
# ref_sheet 
# 
#


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
elif selection == "Z":
    # TODO (IF NEEDED. atm it's working fine without it) add conditional logic so it will only SWITCH-TO this excel file if its already open, and if its not already open, then it will OPEN it (since if its already open, then opening it again will just open a new instance of the file, which is not what i want since i want it to just switch to the already open instance of the file)
    # open zzshortcuts.xlsm normally (not in vscode, since its an excel file)
    os.startfile(r"C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm")
elif selection == "E":
    # TODO (IF NEEDED. atm it's working fine without it) add conditional logic so it will only SWITCH-TO this excel file if its already open, and if its not already open, then it will OPEN it (since if its already open, then opening it again will just open a new instance of the file, which is not what i want since i want it to just switch to the already open instance of the file)
    os.startfile(r"C:\Users\aking\amk\notes\quick_ref\ref_sheet2025.xlsx")
else:
    print("ERROR!!!")




# C:\Users\aking\amk\notes\quick_ref\ref_sheet2025.xlsx
# C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm
    

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