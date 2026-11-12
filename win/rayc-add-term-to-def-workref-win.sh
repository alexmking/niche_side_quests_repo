# !/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Add Term to DEF Section of WorkRef
# @raycast.mode compact
# @raycast.argument1 { "type": "text", "placeholder": "term" }
# @raycast.argument2 { "type": "text", "placeholder": "definition" }
# @raycast.description Add a term to the DEF section of workref-ssot.md 
# @raycast.packageName Developer Utils
# @raycast.icon ➕


# MISC ICONS I MAY WANT TO USE WITH THIS DOWN THE ROAD: 📌🎯🔎📍⭐👀✨🧙‍♂️🪄"


# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921


############ MY BRIEF EXPL OF THIS SCRIPT ############
#### This script allows you to add definitions to the **DEF-section** of Ref/WorkRef.txt files.
#### you can quickly add new terms without manually editing the file. Just call this script command and give it the term and definition.
####### 🚧🚧🚧🚧🚧🚧🚧 CURRENTLY THIS SCRIPT IS JUST A DUP OF MY LOOKUP one, so still need to manually edit it so it actually does the adding of terms to the DEF section. (VIA CALLING THE PYTHON SCRIPT "add_term_to_defs.py")


####### 🚧🚧🚧🚧🚧🚧🚧 
####### 🚧🚧🚧🚧🚧🚧🚧 
####### 🚧🚧🚧🚧🚧🚧🚧 
### TODO:
### 1. catch the 2nd arg the same way as the first arg (assign as variables) and then from there we can handle the passing them to the python script sys call...
### 1. Integrate the call to the Python script "add_term_to_defs.py" to actually add the term to the DEF section.
### 2. Validate that the term and definition are provided before attempting to add.
### 3. Provide user feedback on successful addition or errors.
### 4. Handle edge cases such as duplicate terms or empty definitions.
####### 🚧🚧🚧🚧🚧🚧🚧 
####### 🚧🚧🚧🚧🚧🚧🚧 
####### 🚧🚧🚧🚧🚧🚧🚧 





# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
# FILE="D:\git\niche_side_quests_repo\_universal\ssot-refs.md"
# FILE="D:\git\niche_side_quests_repo\win\ALL_PATHS.txt"
# FILE="D:\git\niche_side_quests_repo\win\workRef-ssot.txt"
FILE="D:\git\niche_side_quests_repo\win\ssot-workref.txt"


TERM="$1"
DEFINITION="$2"
python_script="D:\git\niche_side_quests_repo\win\add_term_to_defs.py"

if [ -n "$TERM" ] && [ -n "$DEFINITION" ]; then
    python "$python_script" "$TERM" "$DEFINITION"
else
    echo "Error: Both term and definition must be provided."
    exit 1
fi





