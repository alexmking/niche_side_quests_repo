#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title update-and-open-dev-landscape
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description runs the update script then opens dev-landscape
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

# print("Hello World!")
##### @raycast.mode silent


import os
# import sys

# ACTUAL FULL PATH: /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems
# os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# os.system("open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html")

#### RUN THE UPDATE SCRIPT FIRST, THEN OPEN THE DEV LANDSCAPE
os.system("D:\git\niche_side_quests_repo\_universal\dev_landscape\scr-update_dev_landscape1.py")  ### WINDOWS-VERSION
os.system("open file:///D:\git\niche_side_quests_repo\_universal\dev_landscape\index.html")


#### TRYING TO USE MY ENV-VAR for the PATH DEFINTION, but kept hitting brick walls so abandoned it...
# os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# os.system("$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# os.system(f"{os.environ['NICHE_REPO_DIR']}/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# print(os.environ['NICHE_REPO_DIR'] + "/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")
# print(os.environ['HOME'] + "/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems")

