#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Path Picker (INLINE MODE, ENV-BASED PATHS ATTEMPT)
####@raycast.mode silent
# @raycast.mode fullOutput
# @raycast.icon 🤖
# @raycast.packageName Developer Utils
# @raycast.description trying fzf/dropdown for all configs

#@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "NEW_ENTRY", "value": "??"} ] }
####@raycast.argument1 { "type": "dropdown", "placeholder": "sel config", "required": true, "data": [{"title": "aliases", "value": "A"}, {"title": "ahk", "value": "H"}, {"title": "glaze", "value": "G"}, {"title": "flexprompt", "value": "P"}, {"title": "fzf", "value": "F"}, {"title": "keybVis", "value": "K"}, {"title": "ssot-refs", "value": "R"}, {"title": "madden", "value": "M"} ] }

# 🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅
# -----------------------------------------------------------------------------------------------------------
# 🥅🥅🥅🥅🥅🥅 GOAL OF THIS SCRIPT: 🥅🥅🥅🥅🥅🥅🥅
#  - Get the 2nd-user-input dropdown functionality working like described below 
         ## Where if the user selects one of the ENV-BASED paths from the FIRST dropdown..
         # .THEN they get prompted with a SECOND dropdown that prompts them to select which specific env they want (like 12.1_emer2 vs 12.1_emer3 etc) and then based on that selection, we can take the value of the %OSI% variable and combine it with the specific env they selected to create the full path to the dir they want and copy that to clipboard for them to use
# -----------------------------------------------------------------------------------------------------------
# 🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅🥅










#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# MY NOTES ON TRYING TO GET ENV-BASED PATHS WORKING IN THIS PATH-PICKER SCRIPT:...😥
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%% 🧠 TRY an ENV-BASED PATH and see if can get it working (aka see if it will copy the %OSI% variable VALUE properly in it's PATH DEFINITON( aka the HARD-PART))
#%%% UPDATE! ==> its likely NOT POSSIBLE to get the %OSI$ variable when running from RAYCAST, bc the shell is needed to know which env-variables are curr (bc the env variable is only set for that SEPCIFIC shell...so raycast script cant just grab it bc there's ambigutiy there)
#%%%%%%% UPDATE2: to prove the above point, we ARE ABLE to get the OSI variable WHEN RUNNING THIS SCRIPT FROM THE TERMINAL itself...
#%%%%%%%%%%%%% UPDATE3/WORKAROUND...
#               -> we can still KINDA get same effect by prompting the user to select which of the /osi dirs they want and then from there we'd have enough info to create the full path...
#                   EXAMPLE USE CASE:
#                   - user selects "monarch/db" from dropdown
#                   - then the user gets prompted again with a dropdown of all the osi/dirs (like 12.1_emer2, 12.1_emer3, 12.2_emer1 etc) and selects the correct one (like 12.1_emer3) etc etc
#                   - then we can take that info and create the full path like D:\osi\12.1_emer3\monarch\db and copy that to clipboard for user to use 
#               -> ⚠️💥 HOWEVER, this is not really any faster than simply switching to terminal and running the equiv alias I have for that dir so may not be worth it at all tbh...
# -> ⭐⭐⭐⭐ FUN-WAY-TO-LEARN-the-INLINE-MODE ⭐⭐⭐⭐
#           -> despite the ENV-based paths WORKAROUND i explained above NOT being faster/easier than just switching to terminal -> aliases...
#               -> I STILL WANT TO TRY TO CREATE THE FUNCTIONALITY using the INLIINE MODE of these raycast commands as a way to learn how it works ...

#           ❗TODO❗ SO...DUPLICATE THIS PATH-PICKER SCRIPT and name it something like "pathPicker-envBased.py" and then in that script, try to implement the above ENV-BASED PATH functionality using the INLINE MODE of raycast commands (which allows you to run another raycast command from within a raycast command and get the output of that command so that you can use it in your current script)...


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



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



    

