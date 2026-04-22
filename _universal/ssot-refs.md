# ssot-refs 
   - **LEGEND: topics/sections in this ref doc**
      - acronyms / terminology / clients / etc
      - keywords / prefixes / naming-conventions
      - code syntax (leet-python, and maybe C++, JS)
      - my scripts (still unsure what/how)
      - some ssot-like info from trello cards across my 3 main boards 
         - TODO: prob will take some time, but can do it gradually 
      - some ssot-like info from EXCEL DOCS (both mac and win)
         - TODO: prob will take some time, but can do it gradually
      - useful Links/paths (esp to quick-copy on the fly)
      - catch-all / misc 
      - *other topics likely not going to be in this doc:*
         - madden
         - glaze,aero,aliases



# ALL PATHS 
- may move this to separate script or file just for simplicity until I get all the paths added 
- ## MAC:
- ? 
- ?








==================================================================
# RULES OF THUMB for 'prefaces' of aliases...
==================================================================
- cd       ==      obvi
- edit     ==      edit the file in VS Code
- fz       ==      doing fzf over some output

- list     ==      printing a list sep by new lines (like PATH) or etc
- get      ==      either returns only 1 simple thing (like a single env var) AND/OR copies it to clipboard at same time
- cpy      ==      ?? this one is good alternative to 'get'
- ===================================
- other ones to consider...
- ===================================
- my       ==      ??
- sel      ==      short for 'select'. This one is another alt/variation of 'get' and/or 'cpy'??
- show     ==      ?? maybe inbetween 'list' and 'get'? such as show-drive-info ??
- see      ==      ?? interchangeable with 'show' i think ??

- print    ==      ?? prob not using this one bc 'see' and 'show' and 'list' are all better/shorter


- REMINDER: MACs root vs home dir 
-      /     means start at ROOT dir 
-    ~/    means start at HOME dir (NOT root)


# DEV BUFFS to SETUP:
| MAC       | WIN       | Buff Description |
| -----     | ---       | -------- |
| ✅        |❗TODO     | open selected file in vscode (from finder window selection obvi) |
| ❗TODO    |❗TODO     | open file from path in clipboard (few wrinkles to this) |
| ✅        |❗TODO     | some dir-related stuff that's WITHIN the actual envs (DDrive/osi/monarch etc)
| ❗TODO    |❗TODO     | ❗DEF MORE TO ADD HERE!! |






















# TMP EXPL ON HOW OUTPUT DIRS SHOULD BE IMPL:
- ⭐ list out all the somewhat-imp dir's, and then create a RAYCAST quicklink for ALL OF THEM 
   - KIM only a few of them will have HOTKEYS, but all em should have a quicklink so we can always jump to them via basic raycast-search
- ⭐ Pick a few out of the list to be the EXTRA-IMP dirs and give them each a HOTKEY 
- ⭐ ?????
- ⭐ Lastly, create the SMART-FINDER-OPENER script-command w fzf/dropdown, and use this list to be all the dirs in our search area 
   - so each dir will be 1 arg in the super-long argument1 specifier for raycast scripts (which we cant use $VARIABLES for so this will be ugly gigantic 1-liner for sure) 













# SCRIPT / BUFF IDEAS:
- collect all common paths and setup either quicklink(s) or individual-snippets or script-command-dropdown that allows you to instantly find the path and copy/paste it (regular 'enter' could be 'copy to clip' while ctrl-enter could be direct paste)
   - then we setup a hotkey for this (it merits it, beleive me) that brings you right to the 'search' part (obvi) (iow so we dont have to type the single-char alias like with 'f' for find files etc)
   - ontop of the HOTKEY, we ALSO want some alias tied to it as well (like s)
   - WRINKLE: we could also apply the same terminal-alias system that pre-pends some char or word to indicate the intent (w no space) and then have sep quicklink/snippet for each path 
         - FOR EXAMPLE: cdosi uses the 'cd'. so I could have something like the following:
            - pathzzshorts
            - pathniche
            - pathkeybvis
            - pathahk
            - etc, etc
- ⭐😮 PATH SEARCH SYSTEM: Expanding on my idea of mirroring the same pre-pend word/char in alias stuff that I have for my terminal (such as cd, edit, list, get ...), I just realized we can actually capture THIS and all the OTHER alias/char-triggers/etc everything else at the same time:
   - EXPL:
         - 1️⃣ p == signle char alias for 'search-my-main-paths' command in raycast (maybe needs to be a script-command)
         - 2️⃣ HOTKEY == for the above 'search-my-main-paths' command in raycast (so both p and the HOTKEY would be on the same command) 
         - 3️⃣ pzzshortcuts == raycast-alias for the individual snippet/quicklink with zzshortcuts PATH (so every path would have 1 of these created just for it within raycast)
            - 🤩 we CAN have all these setup and active AT THE SAME TIME (so 3 diff routes to get to same thing)
         - *TODO:* set this up IMMEDIATELY 
- FZF/DROPDOWN for EACH of the following (mainly work-stuff):
   - DBs in monarch/db (the main ones )
   - SKMs in monarch/data
   - etc
   - etc TODO: DEF MORE TO ADD HERE!
- DIR-related scripts/commands for WITHIN /monarch environemnts (the ones that require 'sel evironment' for the paths to work)
   - 1. mirror all the ones I have terminal aliases for (this is the least we can do)
   - 2. 📌IMP-SUB-TODO: for each of our products, determine the primary directories for that product (sort of like the EQUIV of OUTPOST dirs but only within context of that products dirs)
      - this is very-related to my QUICK_COMPARE.PY script, where we want to add the most-imp sub-dirs for each prod so quick-compare can be used easily no matter where are you within a products dir (since you can just cd .. until you hit an IMP-DIR where the script can work from)
      - ASK QUESTION: maybe good idea to ping richard/nathan and ask 'what are the most imp/primary dirs within Openscada...then same question for SCADA-SDK...the same for Scadainterface etc..
- Script/command/hotkey that opens the active file in FILE-EXPLORER (as in, the actual file I have open and am using/editing right then) (see below for expl)
   - EX: when I'm in Ref_Sheet2025.xlsx, I'd like to be able to open file expl where this file is at
   - EX2: Same goes for editing a file in VS code, say I'm editing keyb-vis.html file, I'd like to hit a hotkey and instnatly open a file-expl window where this file is
      - IMPLEMENTATION APPROACH:
         - I can have 1 big sciprt like in AHK, that can handle the diff logic needed for each type of file/app (AHK is prob only way to handle the EXCEL FILE logic)
         - VSCODE part is actually SUPER EASY bc it already has a built-in command '(ALT-SHIFT-R) == Reveal-in-fileExplorer' that I can leverage any way I want
         - NOT SURE if any other contexts where this script would be needed, sinc eeverything else Id have open is in CHROME? I think??










-zz-
# PRODUCT SUB-DIRECTORIES:
These are the imp/primary sub directories for each product (very similar to my quick-compare.py script wants to index the MOST COMMON DIRs for each product...I want to list those out here and then ref this when creating more scripts/commands that target the ENVIRONMENT-DIRS (the dirs that need select-env to work))
- (ALREADY ADDED ALL I COULD FIND IN **quick-compare.py**...so now it's just ...

- ### 📌 MINI TODO for this
   - 1. run 'findfiles *MakeFile' and 'findfiles *makecs' to get list of all dirs w make files (the sep script expl below is not needed, although I may create it anyway bc it's a good starting point for the other dir-ranking script idea I had)
         - get GPT to write a script that accepts a dir as input, and then returns all the directories that contain a MAKE FILE (including CSHARP make file) and this could be good starting point for which dirs are more imp than others
   - 2. Ask the product-owner of each of the 6 products what they consider are the most imp/connected directories within that product(mention it's for my quick-compare script)
   - 3. Manually go through each product dir yourself and add any you think make sense
manually going through each prod)
   - ### TAGSUBSYSTEM:
         - \src\tagging_subsystem\adaptor
         - src\tagging_subsystem\validate
         - ?
         -  ❗TODO: run the following two commands to get good list of dirs to pull from:
            - findfiles *MakeFile
            - findfiles *makecs' to get good list to pull from
         - ? 
         - ?
   - ### SCADA-SDK:
         - ?\src\scada_sdk\scadaapi"
         - ?"\src\scada_sdk\scada_tag_provider"
         -  ❗TODO: run the following two commands to get good list of dirs to pull from:
            - findfiles *MakeFile
            - findfiles *makecs' to get good list to pull from
         - ?
   - ### OPENSCADA:
         - ?r"\src\openscada\limits"
         - ? r"\src\alarms\alarm"
         - ?"\src\openscada\validate"
         -  ❗TODO: run the following two commands to get good list of dirs to pull from:
            - findfiles *MakeFile
            - findfiles *makecs' to get good list to pull from
         - ?
         - ?
   - ### SCADA-INTERFACE:
         - ?"\src\scada_interface\osii_control_adaptor"
         - ?\src\scada_interface\osii_control_sim" 
         -  ❗TODO: run the following two commands to get good list of dirs to pull from:
            - findfiles *MakeFile
            - findfiles *makecs' to get good list to pull from
         - ?
         - ?
   - ### VIEWPOINT:
         - ?
         - ?
         -  ❗TODO: run the following two commands to get good list of dirs to pull from:
            - findfiles *MakeFile
            - findfiles *makecs' to get good list to pull from
         - ?
         - ?
   - ### OTSFW:
         - "\src\otsfw\otsfw_adaptor
         - ?"\src\otsfw\otsfw_api" 
         -  ❗TODO: run the following two commands to get good list of dirs to pull from:
            - findfiles *MakeFile
            - findfiles *makecs' to get good list to pull from
         - ?
         - ?
   - ### SECURESYNC:
         - \src\secure_sync\client"
         - ?"\src\secure_sync\adaptor"
         -  ❗TODO: run the following two commands to get good list of dirs to pull from:
            - findfiles *MakeFile
            - findfiles *makecs' to get good list to pull from
         - ?
         - ?
   - ### TOP-LEVEL DIRS THAT EVERY PROD HAS:
         - /monarch/db
         - /monarch/data
         - /monarch/sys
         - /monarch/rel
         - /monarch/src
         - /monarch/srcNET
         - /monarch/srcWWW
         - /monarch/ci, doc, docs, profiles, web, www (the maybe-ones)



# ONE-OFF SCRIPT IDEA (get GPT/Claude to churn this one out)(lower-importance!!!)
   - create a script that takes a DIR path as input, and outputs a list of all the most-important/connected dirs within it
   - EX: so I'd pass it a product dir like *D:\osi\13.1_emer2\monarch* and then it would output me a list of all its top dirs like *openscada/validate* and ish like that.
   - I think I'd leave it to claude or whatever to det some criteria for 'importance' (doesnt need to be perfect)
   - This would be nice to have in general, as it gives a quick eagle-eye view of a big directory (like if it was a MAP, then it would return all the TOWNS/CITIES o the map. That's pretty much what I want, where the 'imp-dirs' are the 'towns/cities')
   - THEN I could use this script for each of our PRODUCTS dir and get a solid list of the imp dirs I need for all my other scripts/commands/ideas/dropdowns/quick-compare etc
      - KEEP IN MIND: we're only using GPT to write the script itself...and we are NOT actually giving any of our source code to GPT (it's NOT as if I'm like 'scan this code from /monarch dir and give me what you think are the most imp directories. Obviously that would be a giant no-no.)
















-zz-
# RAYCAST's single-char triggers:
⚠️ TODO BELOW
- f or ff for file-search
- p for path-search (wip) 
- ?
- ? 📌 TODO!! think-of/add-more here (LOOK AT RAYC-notes in ref-board/reddit for other suggestions I'm forgetting atm)
- s or ss for search snippets? 
- ? 📌 TODO!! think-of/add-more here (LOOK AT RAYC-notes in ref-board/reddit for other suggestions I'm forgetting atm)
- ? 📌 TODO!! think-of/add-more here (LOOK AT RAYC-notes in ref-board/reddit for other suggestions I'm forgetting atm)
- ?






















# IMP DIRS 
tmp list of imp dirs in MAC and WIND sides, which I'll use to decide on theofficial OUTPOST dirs

- ## MAC:
   - root and home obvi [✅ quickL DONE]
   - amk [✅ quickL DONE]
   - screenshots (already has hotkey anyway in HYPER-`) [✅ quickL DONE]
   - alexScripts [quickL DONE]
   - projects (1 of the 5 main amk dirs) [✅ quickL DONE]
   - notes (1 of the 5 main amk dirs) [✅ quickL DONE]
   - tools (1 of the 5 main amk dirs) [✅ quickL DONE]
   - career (1 of the 5 main amk dirs) [✅ quickL DONE]
   - archive (1 of the 5 main amk dirs) [✅ quickL DONE]
   - dropzone (1 of the 5 main amk dirs) [✅ quickL DONE]
   - niche-repo [✅ quickL DONE]
   - KIM we dont need one for whatever our default-dir is for new windows (either alexking or amk) [✅ quickL DONE]
   - downloads [✅ quickL DONE]
   - Desktop  [✅ quickL DONE]


- ## WINDOWS:
   - root and home obvi
   - amk  [✅ quickL DONE]
   - screenshots (already has hotkey anyway in HYPER-`)  [✅ quickL DONE]
   - alexScripts  [✅ quickL DONE]
   - projects (1 of the 5 main amk dirs)  [✅ quickL DONE]
   - notes (1 of the 5 main amk dirs) [✅ quickL DONE]
   - tools (1 of the 5 main amk dirs) [✅ quickL DONE]
   - dropzone (1 of the 5 main amk dirs) [✅ quickL DONE]
   - archive (1 of the 5 main amk dirs) [✅ quickL DONE]
   - niche-repo  [✅ quickL DONE]
   - KIM we dont need one for whatever our default-dir is for new windows (either alexking or amk)
   - CDrive
   - DDrive
   - osi dir   [✅ quickL DONE]
   - downloads
   - TODO!!! theres more that are unique to WINDOWS Side pretty sure, so fill them here
   - TODO!!!
   - Desktop  [✅ quickL DONE]


# OFFICIAL-ISH list of OUTPOST dirs(macside)
   - root and home obvi (maybe on these? not sure atm...)
   - amk
   - alexScripts
   - projects (1 of the 5 main amk dirs)
   - notes (1 of the 5 main amk dirs)
   - tools (1 of the 5 main amk dirs)
   - career (1 of the 5 main amk dirs)
   - archive (1 of the 5 main amk dirs)
   - dropzone (1 of the 5 main amk dirs)
   - niche-repo
   - KIM we dont need one for whatever our default-dir is for new windows (either alexking or amk)
   - downloads
   - mac dir within NICHE repo ? (and obvi WINDOWS dir within NICHE for win side)[✅ quickL DONE]
















# MISC TODOS: (DELETE THESE FREQUENTLY)
- ripgrep reads this .md file as plain-text instead of the markdown-version (so atm the results are including all the ugly markdown stuff)
    - NOT 100% sure if I want our lookup auto to read plain-text 
    - ALSO...this could be **resolved** after we check out **GPTs** 'formatted' output and other enhancements to the .sh script 
- Change all .sh filenames to use 'lookup' instead of 'search' 
    - also append the prefix 'scr-' to all of the .sh file names as well
        - search-keybvis.sh ==> scr-lookup-keybvis.sh
- **Remaining EDIT commands to consider creating:**
    - **mac:** zprofile, p10k, prompt, madden??, morning-leet, scratchpaper,launchmainapps, vscode-keybindings, (and a bunch of other misc ones I'm prob forgetting)
    - **win:** flexprompt, morningleet, launchmyapps,  scratchpaper, fzf?, (and all my mini scripts like listenvvariables etc)

















# ACRONYMS / TERMINOLOGY / CLIENTS / ETC
+ RAR	    ==	FROM MARKD md :) ppl who review the doc / design
+ LA		==	life cycle thinig 1
+ GA		== 	general avail of prod cycle

- EXE		== 	element extra dabble
- EXED	==	element xenon extra dabble
 
* asdf 

-BroadRidge21*2121*@!@!   
-Cargill21*2121*@!@!   
-GeneralMills21*2121  
-Entegris21*2121  
-Vontier21*2121  
-Ameriprise21*2121  
-UnitedOptum21*2121  
-Target21*2121  
-Epicor21*2121 —(vRad eden Pr) (alexmking921)  
-ProtoLabs21*2121  
-Banner21*2121s  
-Delaget21*2121  

# KEYWORDS / PREFIXES / NAMING-CONVENTIONS
blah blah blah.  
blah blah blah.  
blah blah blah.  
blah blah blah.  









# CODE SYNTAX (leet-python, C/C++, JS)
blah blah blah.  
blah blah blah.  
blah blah blah.  
blah blah blah.  










# MY SCRIPTS (unsure how this section will be used atm)
blah blah blah.  
blah blah blah.  
blah blah blah.  
blah blah blah.  













# TRELLO CARDS 
- this section will likely be combined into the other ones based on the actual info of the card(s). But the first step is to simply get the info here in this doc and then worry about where/which-section later.
blah blah blah.  
blah blah blah.  
blah blah blah.  














# EXCEL DOCS 
- this section will likely be combined into the other ones based on the actual info of the EXCEL doc(s). But the first step is to simply get the info here in this doc and then worry about where/which-section later.
blah blah blah.  
blah blah blah.  
blah blah blah. 












# USEFUL LINKS/PATHS 
- (this is where the enhancement of auto-copying results would be nice as it would allow us to quickly grab paths/links on the fly which is lowkey super-useful, as it would be another upgrade similar to my amazing ALT-SHIFT-C 'copy-path' script that I use 100 times a day)
   - FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"  
   - FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"  
   - FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"  
   - FILE="/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/  TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/ssot-madden.txt"  
   - FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"  
   - FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"  











# CATCH-ALL / MISC / USEFUL-LINKS/PATHS 
- GIT PROMPT SYMBOLS and how to read/interpret them:  
   - https://chatgpt.com/c/69e167f7-a508-83ea-be41-4ec2d78654a7  
      - main !13 ?6 ---> means you have 13 files with changes that have NOT been staged yet () and 6 files are UNTRACKED (aka need to git add)
      - !13 == means 13 of your 'tracked' files have changes that are not staged yet ... OR IOW...
      - !N == “Out of all tracked files, N of them have changes that are not staged.”  ... OR IOW...
      - !N == “N tracked files have been modified in the **working directory** but are not in the index (not staged).”
      - EXAMPLE main !13 ?6:
         - now when I run 'git add .' then we'll get 'main +24'...(UPDATE! it turns out this +24 val is some issue w my prompts git feature on macs-side(not confirmed if also exists on windows prompt side) so dont read too into it at the moment.
      - 
      - 
























-zz- git
# GIT PROMPT CHEAT SHEET
```
======================
GIT PROMPT CHEAT SHEET
======================

BRANCH / POSITION
-----------------
main                → current branch
feature/login       → current branch
HEAD                → detached HEAD state

FILE STATE INDICATORS
---------------------
!N   → Modified (unstaged changes)
+N   → Staged changes (ready to commit)
?N   → Untracked files (not added to git)

Example:
main !13 +2 ?6
→ 13 modified, 2 staged, 6 untracked


REMOTE SYNC STATUS
------------------
⇡N   → Ahead of remote by N commits (need git push)
⇣N   → Behind remote by N commits (need git pull)
⇡N ⇣M → Diverged (both ahead and behind)

Example:
main ⇡3       → 3 commits ahead
main ⇣2       → 2 commits behind
main ⇡2 ⇣1    → diverged


MERGE / REBASE STATES
---------------------
MERGING        → merge in progress
REBASING       → rebase in progress
CHERRY-PICKING → cherry-pick in progress

(avoid switching branches until resolved)


STASH
-----
$N   → N stashes exist

Example:
$3 → 3 stashed changes


CONFLICTS
---------
✖N   → N files have merge conflicts


REPO STATUS
-----------
✔    → clean working directory
✗    → dirty (has changes)


QUICK VERIFY COMMANDS
---------------------
git status       → full detailed view
git status -sb   → compact view (similar to prompt)


MENTAL MODEL
------------
Where am I?        → branch name
What changed?      → ! (modified), + (staged), ? (untracked)
Am I synced?       → ⇡ / ⇣
Anything unusual?  → merge, rebase, conflicts, stash


EXAMPLE BREAKDOWN
-----------------
main !13 ?6

main → branch
!13  → 13 modified (unstaged)
?6   → 6 untracked
(no +) → nothing staged
(no arrows) → in sync with remote
```




blah blah blah.  
blah blah blah.  
blah blah blah.  
blah blah blah.  















-zz- markdown
# TMP MARKDOWN CHEAT SHEET
```
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# TMP MARKDOWN CHEAT SHEET
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AFTER A FEW MONTHS I SHOULD HAVE ALL THESE DOWN PAT AND CAN REMOVE THIS SECTION from this doc entirely sinec it's just in the way of the actual refs I'll be searching for


# ----------------------
# HEADINGS
# ----------------------
# H1
## H2
### H3
#### H4
##### H5
###### H6

# ----------------------
# TEXT FORMATTING
# ----------------------
*italic* or _italic_
**bold** or __bold__
***bold italic***
~~strikethrough~~

# ----------------------
# BLOCKQUOTES
# ----------------------
> This is a blockquote
>> Nested blockquote

# ----------------------
# LISTS
# ----------------------

# Unordered
- Item 1
- Item 2
  - Subitem
* Item 1
+ Item 1

# Ordered
1. First
2. Second
   1. Subitem

# ----------------------
# LINKS
# ----------------------
[Link text](https://example.com)

# With title
[Link text](https://example.com "Title")

# ----------------------
# IMAGES
# ----------------------
![Alt text](image-url)

# ----------------------
# CODE
# ----------------------

# Inline code
`code`

# Code block
(use 3 backticks (or 4 for special cases))
(not using concrete example here bc we're already in a code block)

# %%%%%%%%%%%%%%%%%%%%%%%
# TABLES (2 col, 3 col)
# %%%%%%%%%%%%%%%%%%%%%%%
| Column 1 | Column 2 |
| -------- | -------- |
| Value 1  | Value 2  |
| Value 3  | Value 4  |

| Column 1 | Column 2 | Column 3 |
| -------- | -------- | -------- |
| Value 1  | Value 2  | Value 5 |
| Value 3  | Value 4  | Value 6 |




# ----------------------
# HORIZONTAL RULE
# ----------------------
---
***
___


# ----------------------
# TASK LISTS
# ----------------------
- [ ] Task not done
- [x] Task done

# ----------------------
# ESCAPING CHARACTERS
# ----------------------
\*literal asterisk\*
\# literal hash

# ----------------------
# LINE BREAKS
# ----------------------
Line one  
Line two

(Use two spaces at end of line OR blank line)

# ----------------------
# HTML (SUPPORTED IN MARKDOWN)
# ----------------------
<b>Bold</b>
<i>Italic</i>
<br>

# ----------------------
# COMMENTS (NOT RENDERED)
# ----------------------
<!-- This is a comment -->

# ----------------------
# QUICK COMBO EXAMPLE
# ----------------------
## Title

- **Bold item**
- *Italic item*
- [Link](https://example.com)

> Quote here


```










## FILE SYSTEM RULES (Quick Reference)
#### ❗ RE-READ these frequently to help catch yourself falling into the same bad mental-model/habits 

1. ⭐ Optimize for retrieval > storage
   - You should find anything in ~5 seconds

2. Top-level structure (keep it simple)
   /Workspace
     /Work
     /Projects
     /Learning
     /Personal
     /Inbox
     /Archive

3. Organize by purpose, NOT file type
   - Group everything related to a project together
   - Avoid: /Documents, /Images, /Code

4. ⭐ Naming > folders
   - Use clear, searchable names
   - Formats:
     YYYY-MM-DD - description
     project - detail
   - Bad: notes.txt
   - Good: kafka-backpressure-notes.md

5. Keep folder depth shallow (≤3 levels)
   - Avoid deep nesting
   - Use filenames instead

6. Active vs Archive
   - Keep current work clean
   - Move finished work to /Archive

7. Standard project structure
   project-name/
     README.md
     notes.md
     /src
     /scripts
     /docs
     /assets

8. Use a dropzone/Inbox
   /dropzone 
   - Dump files quickly
   - Clean weekly

9. Weekly cleanup (10 min)
   - Rename files
   - Move from Inbox
   - Archive old work

10. ⭐ Design for search
   - Use keywords in filenames
   - Think: “what would I type to find this?”

11. Avoid
   - Too many folders
   - Over-organizing
   - Perfectionism



- [ ] Task not done
- [x] Task done  
[] asdf asdf  
[] asdf sdf











