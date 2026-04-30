#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Dir Picker
# @raycast.mode fullOutput
# @raycast.icon 🤖
# @raycast.packageName Developer Utils
# @raycast.description fzf/dropdown of all useful/common dirs, and opens new exploer-window at the selected dir

###@raycast.argument1 { "type": "dropdown", "placeholder": "sel dir", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "madden", "value": "M"} ] }
###@raycast.argument1 { "type": "dropdown", "placeholder": "sel dir", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "NEW_ENTRY", "value": "??"} ] }
# @raycast.argument1 { "type": "dropdown", "placeholder": "sel dir", "required": true, "data": [{"title": "niche dir", "value": "N"}, {"title": "tools dir", "value": "T"}, {"title": "amk dir", "value": "K"}, {"title": "niche-win dir", "value": "W"}, {"title": "niche-univ dir", "value": "U"}, {"title": "alexscripts dir", "value": "A"}, {"title": "quick_ref dir", "value": "Q"}, {"title": "screenshots dir", "value": "S"}] }

# ❓❓❓❓❓❓❓
# MYSTERIOUS ISSUE WITH SOME DIRS PATHS NOT OPENING EXPL window...no cliude why???
# ❓❓❓❓❓❓❓





# ❓❓❓❓❓❓❓
#################################################################################################################################################
# ❓DEBUG PROBLEM: some directories WILL NOT open in explorer for some reason, and it's not a Cdrive vs Ddrive thign bc niche/ dir DOES WORK, while niche-win does NOT WORK...
#################################################################################################################################################
# ❓❓❓❓❓❓❓
















#### basic list of some directories to test this script with (will add more later):
# C:\Users\aking\amk\tools\alex_scripts
# D:\git\niche_side_quests_repo\win
# C:\Users\aking\amk
# C:\Users\aking\amk\projects
# C:\Users\aking\amk\tools
# C:\Users\aking\amk\notes
# C:\Users\aking\amk\dropzone
# C:\Users\aking\amk\archive
# D:\git\niche_side_quests_repo
# D:\git\niche_side_quests_repo\_universal
# C:\Users\aking\OneDrive - Emerson\Pictures\Screenshots
# C:\Users\aking\amk\notes\quick_ref

# D:\git\niche_side_quests_repo\win




# N, T, K, W, U, A, Q, S
# D:\git\niche_side_quests_repo
# C:\Users\aking\amk\tools
# C:\Users\aking\amk
# D:\git\niche_side_quests_repo\win
# D:\git\niche_side_quests_repo\_universal
# C:\Users\aking\amk\tools\alex_scripts
# C:\Users\aking\amk\notes\quick_ref
# C:\Users\aking\OneDrive - Emerson\Pictures\Screenshots

#####@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [
# {"title": "niche dir", "value": "N"}, 
# {"title": "tools dir", "value": "T"}, 
# {"title": "amk dir", "value": "K"}, 
# {"title": "niche-win dir", "value": "W"}, 
# {"title": "niche-univ dir", "value": "U"}, 
# {"title": "alexscripts dir", "value": "A"}, 
# {"title": "quick_ref dir", "value": "Q"}, 
# {"title": "screenshots dir", "value": "S"}
# ] }





#####@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [
# {"title": "niche dir", "value": "N"}, 
# {"title": "tools dir", "value": "T"}, 
# {"title": "amk dir", "value": "K"}, 
# {"title": "niche-win dir", "value": "W"}, 
# {"title": "niche-univ dir", "value": "U"}, 
# {"title": "alexscripts dir", "value": "A"}, 
# {"title": "quick_ref dir", "value": "Q"}, 
# {"title": "screenshots dir", "value": "S"}, 
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# ] }

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921
import os
import sys
# print("Hello World! Argument1 value: " + sys.argv[1])
selection = sys.argv[1]

print("Selected value: " + selection)


# ❓❓❓❓❓❓❓
#################################################################################################################################################
# ❓DEBUG PROBLEM: some directories WILL NOT open in explorer for some reason, and it's not a Cdrive vs Ddrive thign bc niche/ dir DOES WORK, while niche-win does NOT WORK...
#################################################################################################################################################
# ❓❓❓❓❓❓❓


######## CONFUSING... ###############################
# why in the world would niche/WIN work, but ninche/univ NOT WORK?? they're in the exact same dir??
#   ❓  niche_side_quests_repo\win
#   ❓  niche_side_quests_repo\_universal
######## CONFUSING... ###############################


# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 
# LAST RESORT ===> ASK copilot side menu what the issue could be... (maybe it's some ovscure shit is os.startFile() or something...)
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 
# 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 💥 



if selection == "N":
    # open new explorer window at C:\Users\aking\amk\tools\alex_scripts
    os.startfile(r"D:\git\niche_side_quests_repo")              # ✅ this one DOES work...
elif selection == "T":
    print("TESTING...")       
    print(r"C:\Users\aking\amk\tools")                                  
    os.startfile(r"C:\Users\aking\amk\tools")                   # ❌ this one does NOT work...no idea why
elif selection == "K":
    os.startfile(r"C:\Users\aking\amk")                         # ✅ this one DOES work...
elif selection == "W":
    os.startfile(r"D:\git\niche_side_quests_repo\win")          # ❌ this one does NOT work...no idea why
elif selection == "U":
    os.startfile(r"D:\git\niche_side_quests_repo\_universal")   # ✅ this one DOES work...
elif selection == "A":
    os.startfile(r"C:\Users\aking\amk\tools\alex_scripts")      # ❌ this one does NOT work...no idea why
elif selection == "Q":
    os.startfile(r"C:\Users\aking\amk\notes\quick_ref")         # ✅ this one DOES work...
elif selection == "S":
    os.startfile(r"C:\Users\aking\OneDrive - Emerson\Pictures\Screenshots") # ✅ this one DOES work...
else:
    print("ERROR!!!")

print("DONE...")


# N, T, K, W, U, A, Q, S
# D:\git\niche_side_quests_repo
# C:\Users\aking\amk\tools
# C:\Users\aking\amk
# D:\git\niche_side_quests_repo\win
# D:\git\niche_side_quests_repo\_universal
# C:\Users\aking\amk\tools\alex_scripts
# C:\Users\aking\amk\notes\quick_ref
# C:\Users\aking\OneDrive - Emerson\Pictures\Screenshots


















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