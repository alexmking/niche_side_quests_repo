#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Everything Picker
# @raycast.mode silent
# @raycast.icon 🤖
# @raycast.packageName Developer Utils
# @raycast.description fzf/dropdown of all useful/common files, and opens the selected file (as far as if it opens for editing in vscode or just opens the file normally (like an excelFile), that depends on the selection itself (so some will open for edintg in vscode while others will open normally etc etc))

### OTHER NAMES I CONSIDERED BUT DIDN'T GO WITH:
### @raycast.title      Omni Picker
# ##@raycast.title      Universal Picker
### @raycast.title      All-In-One Picker
# ##@raycast.title      Config & File & Dir Picker


#++++++++++++++++++++++++++++++++++++++++++++++
# 📌EXPL OF THIS SCRIPT:
# this is like a 'mega' picker that includes a mix of both files and directories and configs and whatever else i want to include, so its like a one-stop-shop for picking any file
# after i started adding DIRECTORIES to the FILE PICKER script, i realized that the name 'filePicker' is no longer super accurate since its not just files in there but also directories, so maybe we should change the name to something more generic/broader-spectrum than 'filePicker' since it includes more than just files (since it also includes directories and configs and whatever else i want to include etc etc), but for now im still keeping the name as 'filePicker' since its just easier to keep the name as is for now instead of going through the process of changing the name and then changing all the references to that name in other scripts and stuff etc etc, but in the future if we end up adding a lot of directories and other non-file things to this picker then we might want to consider changing the name to something more generic/broader-spectrum than 'filePicker' since it includes more than just files (since it also includes directories and configs and whatever else i want to include etc etc)
# so... this picker should have the LARGEST DROPDWON of all the picker scripts (since it's combining most/all of them into one), and then the other picker scripts (like the configPicker and dirPicker) can be more focused with smaller dropdowns that are just for picking configs or just for picking directories etc etc, but this 'everythingPicker' script can be the one with the largest dropdown that includes everything all together in one place etc etc
# #### DONT FORGET: the action we take on the selected entry CHANGES depending on the specific entry that was selected (so for example if we selected a config file, then we would open it for editing in vscode since thats likely the action we want to take for a config file, but if we selected a directory, then we would open new explorer window at that directory instead of opening it in vscode since directories are meant to be opened in explorer and not in vscode etc etc, so the action we take on the selected entry CHANGES depending on the specific entry that was selected, which makes this 'everythingPicker' script a good all-around option that can handle alot of different types of entries and the appropriate actions for those entries since the action we take changes depending on the specific entry that was selected etc etc)
#++++++++++++++++++++++++++++++++++++++++++++++
### THE DIFF ACTION WE WANT TO TAKE FOR EACH DIFF SELECTION TYPE:
    # for config files      ===>    open for editing in vscode
    # for directories       ===>    open new explorer window at that directory
    # for excel files       ===>    open normally (since excel files are meant to be opened normally and
    # for pdf files         ===>    open normally (since pdf files are meant to be opened normally and not in vscode etc etc)
    # for other misc types  ===>    we can decide on a case by case





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
    # TODO add conditional logic so it will only SWITCH-TO this excel file if its already open, and if its not already open, then it will OPEN it (since if its already open, then opening it again will just open a new instance of the file, which is not what i want since i want it to just switch to the already open instance of the file)
    # open zzshortcuts.xlsm normally (not in vscode, since its an excel file)
    os.startfile(r"C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm")
elif selection == "E":
    # TODO add conditional logic so it will only SWITCH-TO this excel file if its already open, and if its not already open, then it will OPEN it (since if its already open, then opening it again will just open a new instance of the file, which is not what i want since i want it to just switch to the already open instance of the file)
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