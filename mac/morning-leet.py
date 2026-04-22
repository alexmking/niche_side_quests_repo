#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Morning Leet
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖

# @raycast.packageName Developer Utils

# Documentation:
# @raycast.description run morningprep leet script via raycast
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

# -------------------------------------------------------------------------
# COMMENT IN ANY OF THE 4 DIFFERENT raycast.args sections BELOW to use diff style of dropdown...
# -------------------------------------------------------------------------
########### IF WANT ALL 3 ARGS: (2nd arg DOES-HAVE-ALL-15 CATEGORIES) ##########################################################################################################
# @raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "easy", "value": "e"}, {"title": "easymed", "value": "b"}, {"title": "medium", "value": "m"}, {"title": "hard", "value": "h"}, {"title": "any", "value": "a"}] }
# @raycast.argument2 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "group1", "value": "g1"}, {"title": "group2", "value": "g2"}, {"title": "group3", "value": "g3"}, {"title": "arrays", "value": "1"}, {"title": "stacks", "value": "2"}, {"title": "two pointers", "value": "3"}, {"title": "sliding window", "value": "4"}, {"title": "binary search", "value": "5"}, {"title": "linked list", "value": "6"}, {"title": "trees", "value": "7"}, {"title": "tries", "value": "8"}, {"title": "heaps", "value": "9"}, {"title": "intervals", "value": "10"}, {"title": "greedy", "value": "11"}, {"title": "backtracking", "value": "12"}, {"title": "1D dyn prog", "value": "13"}, {"title": "graph", "value": "14"}, {"title": "2D dyn prog", "value": "15"}, {"title": "any", "value": "a"}] }
# @raycast.argument3 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "onlytopproblems", "value": "t"}, {"title": "any", "value": "a"}] }

########### IF WANT ALL 3 ARGS (2nd arg does NOT incl the 15 individ categories): ##########################################################################################################
####@raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "easy", "value": "e"}, {"title": "easymed", "value": "b"}, {"title": "medium", "value": "m"}, {"title": "hard", "value": "h"}, {"title": "any", "value": "a"}] }
####@raycast.argument2 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "group1", "value": "g1"}, {"title": "group2", "value": "g2"}, {"title": "group3", "value": "g3"}, {"title": "any", "value": "a"}, {"title": "TBD(1-15)", "value": "TBD"}] }
####@raycast.argument3 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "onlytopproblems", "value": "t"}, {"title": "any", "value": "a"}] }

########### IF WANT ONLY THE 2 ARGS: (2nd arg does NOT incl the 15 individ categories) ##########################################################################################################
#####@raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "easy", "value": "e"}, {"title": "easymed", "value": "b"}, {"title": "medium", "value": "m"}, {"title": "hard", "value": "h"}, {"title": "any", "value": "a"}] }
####@raycast.argument2 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "group1", "value": "g1"}, {"title": "group2", "value": "g2"}, {"title": "group3", "value": "g3"}, {"title": "any", "value": "a"}, {"title": "TBD(1-15)", "value": "TBD"}] }

########### IF WANT ONLY THE 2 ARGS: (2nd arg DOES-HAVE-ALL 15 INDIVIDUAL CATEGORIES) ##########################################################################################################
#####@raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "easy", "value": "e"}, {"title": "easymed", "value": "b"}, {"title": "medium", "value": "m"}, {"title": "hard", "value": "h"}, {"title": "any", "value": "a"}] }
######@raycast.argument2 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "group1", "value": "g1"}, {"title": "group2", "value": "g2"}, {"title": "group3", "value": "g3"}, {"title": "arrays", "value": "1"}, {"title": "stacks", "value": "2"}, {"title": "two pointers", "value": "3"}, {"title": "sliding window", "value": "4"}, {"title": "binary search", "value": "5"}, {"title": "linked list", "value": "6"}, {"title": "trees", "value": "7"}, {"title": "tries", "value": "8"}, {"title": "heaps", "value": "9"}, {"title": "intervals", "value": "10"}, {"title": "greedy", "value": "11"}, {"title": "backtracking", "value": "12"}, {"title": "1D dyn prog", "value": "13"}, {"title": "graph", "value": "14"}, {"title": "2D dyn prog", "value": "15"}, {"title": "any", "value": "a"}] }

import os
import sys
print("Hello World! Argument1 value: " + sys.argv[1])
print("Hello World! Argument2 value: " + sys.argv[2])
print("Hello World! Argument3 value: " + sys.argv[3])

arg1Difficulty = sys.argv[1]
arg2Category = sys.argv[2]
arg3TopProblem = sys.argv[3]

if arg1Difficulty == "e":
    arg1Difficulty = "easy"
elif arg1Difficulty == "b":
    arg1Difficulty = "easymed"
elif arg1Difficulty == "m":
    arg1Difficulty = "medium"
elif arg1Difficulty == "h":
    arg1Difficulty = "hard"
elif arg1Difficulty == "a":
    arg1Difficulty = "any"

if arg2Category == "g1":
    arg2Category = "group1"
elif arg2Category == "g2":
    arg2Category = "group2"
elif arg2Category == "g3":
    arg2Category = "group3"
elif arg2Category == "a":
    arg2Category = "any"
elif arg2Category == "TBD":
    arg2Category = "TBD"

if arg3TopProblem == "t":
    arg3TopProblem = "onlytopproblems"
elif arg3TopProblem == "a":
    arg3TopProblem = "any"

# os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/scr-leet_morning_random.py " + sys.argv[1] + " " + sys.argv[2])
# os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py " + sys.argv[1] + " " + sys.argv[2] + " " + sys.argv[3])
os.system("/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py " + arg1Difficulty + " " + arg2Category + " " + arg3TopProblem)


















########### SETTING UP ARG2 'category' DROPDOWN: (leaving the 1-15 args out of it for now...)
#### @raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [
# {"title": "group1", "value": "g1"}, 
# {"title": "group2", "value": "g2"}, 
# {"title": "group3", "value": "g3"}, 
# {"title": "any", "value": "a"}, 
# {"title": "TBD(1-15)", "value": "TBD"}
# ] }



########### SETTING UP ARG3'top list' optional arg DROPDOWN: 
#### @raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [
# {"title": "onlytopproblems", "value": "t"}, 
# {"title": "any", "value": "a"}, 
# ] }



########### SETTING UP ARG3'top list' optional arg DROPDOWN: 
# dsfdfg @raycafst.argument3 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "onlytopproblems", "value": "t"}, {"title": "any", "value": "a"}] }


#### @raycast.argument1 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [
# {"title": "easy", "value": "e"}, 
# {"title": "easymed", "value": "b"}, 
# {"title": "medium", "value": "m"}, 
# {"title": "hard", "value": "h"}, 
# {"title": "any", "value": "a"}
# ] }








# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#####################################################
# EXTEND THIS TO USE THE DROPDOWN instead of the manual inputs, this way we can easily see what weer selecting and STILL CAN manual input as well so 
# SO WE GET THE BEST OF BOTH WORLDS....
#####################################################
#####################################################
# ALERT!! Use smart-configs.py as the template for how we want the DROPDOWN stuff to work and how to process the args of each dropdown after selection...
#####################################################
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# !!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


# dfgh fgd@raycast.argument1 { "type": "text", "placeholder": "Placeholder" }
# dfgh dfgh@raycast.argument2 { "type": "text", "placeholder": "Placeholder" }



### CATEGORIES ### 
# 1 = arrays			1
# 2 = stacks					3?
# 3 = two pointers		1
# 4 = sliding window	1
# 5 = binary search		1
# 6 = linked list		1
# 7 = trees					2
# 8 = tries					2
# 9 = heaps				1	2*
# 10 = intervals		1
# 11 = greedy					3
# 12 = backtracking			2
# 13 = 1D dyn prog			2	3*
# 14 = graph				2
# 15 = 2D dyn prog				3
# *indicates* 'or' 



########### SETTING UP THE FULL-ARG2 'category' DROPDOWN: INCLUDING ALL 15 INDIVIDUAL CATEGORIES 
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



########### SETTING UP THE FULL-ARG2 'category' DROPDOWN: INCLUDING ALL 15 INDIVIDUAL CATEGORIES 
###### @raycast.argument2 { "type": "dropdown", "placeholder": "difficulty", "required": true, "data": [{"title": "group1", "value": "g1"}, {"title": "group2", "value": "g2"}, {"title": "group3", "value": "g3"}, {"title": "arrays", "value": "1"}, {"title": "stacks", "value": "2"}, {"title": "two pointers", "value": "3"}, {"title": "sliding window", "value": "4"}, {"title": "binary search", "value": "5"}, {"title": "linked list", "value": "6"}, {"title": "trees", "value": "7"}, {"title": "tries", "value": "8"}, {"title": "heaps", "value": "9"}, {"title": "intervals", "value": "10"}, {"title": "greedy", "value": "11"}, {"title": "backtracking", "value": "12"}, {"title": "1D dyn prog", "value": "13"}, {"title": "graph", "value": "14"}, {"title": "2D dyn prog", "value": "15"}, {"title": "any", "value": "a"}] }