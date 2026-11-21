#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title work audio toggle (for hyper-b)
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🎵
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description the hyper-b variant of the work audio toggle: pauses if it's playing, resumes if paused, otherwise starts it.
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

# print("Hello World!")

############################## ⚠️
## DELETE THIS ENTIRE FILE IF WE END UP NOT USING HYPER-B AS HOTKEY FOR WHITE-NOISE 
## (currently hyper-b AND alt-opt-w are both set as hotkeys for white-noise)
#### we just duplicated the alt-opt-w raycast script to be able to assign another hotkey to the same command...
############################## ⚠️


import os
# import sys

# ACTUAL FULL PATH: /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems
os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/src-work-audio.sh")


#### TRYING TO USE MY ENV-VAR for the PATH DEFINTION, but kept hitting brick walls so abandoned it...
# os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# os.system("$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# os.system(f"{os.environ['NICHE_REPO_DIR']}/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# print(os.environ['NICHE_REPO_DIR'] + "/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# print(os.environ['HOME'] + "/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")

