#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Path Picker
####@raycast.mode silent
# @raycast.mode fullOutput
# @raycast.icon 🤖
# @raycast.packageName Developer Utils
# @raycast.description trying fzf/dropdown for all configs

#@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "NEW_ENTRY", "value": "??"} ] }
####@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "madden", "value": "M"} ] }


# for ENV-BASED PATHS stuff, see the below INLINE MODE attempt script ...
# D:\git\niche_side_quests_repo\win\pathPicker_INLINEMODE_envVAR.py



# ----------------------------------
# CREATE THE BRACKET FOR EACH NEW PATH ENTRY HERE, then copy/paste them one at a time to the official @raycast.argument1 line above (and also add the corresponding elif statement in the if-else block below to handle the new entry when selected from dropdown):
# ----------------------------------
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},



################################################################################################
############ OR USE THE BELOW TEMPLATE TO CREATE THE BRACKET FOR EACH NEW PATH ENTRY ############
################################################################################################
#####@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [
# {"title": "aliases", "value": "A"}, 
# {"title": "ahk", "value": "H"}, 
# {"title": "glaze", "value": "G"}, 
# {"title": "flexprompt", "value": "P"}, 
# {"title": "fzf", "value": "F"}, 
# {"title": "keybVis", "value": "K"}, 
# {"title": "ssot-refs", "value": "R"}, 
# {"title": "NEW_ENTRY", "value": "??"}, 
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# {"title": "NEW_ENTRY", "value": "??"},
# ] }






####BACKUP@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "madden", "value": "M"} ] }





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


# print the value of the env-variable OSI. ( %OSI% )
# print("attempting to print the value of the env-variable OSI (aka %OSI%):")
# print(os.environ.get('OSI'))





# print("All environment variables:")
# for key, value in os.environ.items():
#     if 'OSI' in key.upper():
#         print(f"{key}: {value}")

# # Also check case variations
# print("\nChecking case variations:")
# print("OSI:", os.environ.get('OSI'))
# print("osi:", os.environ.get('osi'))
# print("Osi:", os.environ.get('Osi'))
# print("Osi s3 root:", os.environ.get('S3_OSI_ROOT'))
# print("ref sheet:", os.environ.get('REF_SHEET2025_PATH'))
# print("niche:", os.environ.get('NICHE_REPO_DIR'))





# import subprocess
# def get_env_var(var_name):
#     try:
#         result = subprocess.run(['cmd', '/c', f'echo %{var_name}%'], 
#                               capture_output=True, text=True, shell=True)
#         value = result.stdout.strip()
#         # Check if the variable expanded properly (not just echoing the literal string)
#         if value != f'%{var_name}%':
#             return value
#         return None
#     except:
#         return None

# osi_value = get_env_var('OSI')
# print(f"OSI from subprocess: {osi_value}")
# print(f"OSI from os.environ: {os.environ.get('OSI')}")










# print("Hello World! Argument1 value: " + sys.argv[1])
selection = sys.argv[1]

# os.system(r"Code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd")
# A H G P F K R M
if selection == "A":
    # copy the following path to clipboard: "C:\Users\aking\Downloads\cmder\config\user_aliases.cmd"
    os.system(r'echo C:\Users\aking\Downloads\cmder\config\user_aliases.cmd| clip')
elif selection == "H":
    # copy the following path to clipboard: "C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\king_app_switcher1.ahk"
    os.system(r'echo C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\king_app_switcher1.ahk| clip')
elif selection == "G":
    # copy the following path to clipboard: "C:\Users\aking\.glzr\glazewm\config.yaml"
    os.system(r'echo C:\Users\aking\.glzr\glazewm\config.yaml| clip')
elif selection == "P":
    # copy the following path to clipboard: "C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua"
    os.system(r'echo C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua| clip')
elif selection == "F":
    # copy the following path to clipboard: "C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua"
    os.system(r'echo C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua| clip')
elif selection == "K":
    # copy the following path to clipboard: "D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html"
    os.system(r'echo D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html| clip')
elif selection == "R":
    # copy the following path to clipboard: "D:\git\niche_side_quests_repo\_universal\ssot-refs.md"
    os.system(r'echo D:\git\niche_side_quests_repo\_universal\ssot-refs.md| clip')
else:
    print("ERROR!!!")

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# LIST OF OTHER PATHS I SHOULD ADD TO THIS PATH-PICKER SCRIPT:
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# ❗TODO❗❗TODO❗ ❗TODO❗❗TODO❗
# ADD MORE PATHS TO THIS SCRIPT!!! the above config paths was only a starting point...
# ❗TODO❗❗TODO❗ ❗TODO❗❗TODO❗
#   (AFTER i get win-sides ALL_PATHS file done, then just use that to find all the paths that are useful-enough to be added to this path-picker script, and add them here with the same format as above- just copy the path to clipboard when selected from dropdown)
# C:\Users\aking\amk\notes\quick_ref\ref_sheet2025.xlsx
# C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm
# C:\Users\aking\amk\notes\quick_ref
# D:\git\niche_side_quests_repo\_universal\scr-leet_morning_random.py
# D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html
# D:\git\niche_side_quests_repo\_universal\ssot-refs.md
# # TODO (i only added the first few from ALL_PATHS, so STILL NEED TO look through whole ALL_PATHS file to find more useful paths to add here):
#
#
#
#
#
#
#



    

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