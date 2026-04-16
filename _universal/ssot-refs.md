# ssot-refs 

#### MISC TODOS: (DELETE THESE FREQUENTLY)
- ripgrep reads this .md file as plain-text instead of the markdown-version (so atm the results are including all the ugly markdown stuff)
    - NOT 100% sure if I want our lookup auto to read plain-text 
    - ALSO...this could be **resolved** after we check out **GPTs** 'formatted' output and other enhancements to the .sh script 
- QUESTION: is there ANY .sh file that could be used for both win and mac? ANSWER: No, bc FILEpath needs to be diff, 
    - SO THEN TODO: remove all .sh files in _UNIVERSAL dir and move them to their respective /win or /mac dir 
    - this is NOT talking about the actual files 'BEING' searched (like .txt or keybvis.html). These CAN be shared for both win and mac so theese SHOULD be in the _UNVIERSAL dir (unlike the .sh files)
- Change all .sh filenames to use 'lookup' instead of 'search' 
    - also append the prefix 'scr-' to all of the .sh file names as well
        - search-keybvis.sh ==> scr-lookup-keybvis.sh


#### topics/sections in this ref doc
- acronyms / terminology / clients / etc
- keywords / prefixes / naming-conventions
- code syntax (leet-python, and maybe C++, JS)
- my scripts (still unsure what/how)
- some ssot-like info from trello cards across my 3 main boards 
    - TODO: prob will take some time, but can do it gradually 
- some ssot-like info from EXCEL DOCS (both mac and win)
    - TODO: prob will take some time, but can do it gradually
- catch-all / misc 

###### other topics likely not going to be in this doc:
- madden
- glaze,aero,aliases

***
***
***

### ACRONYMS / TERMINOLOGY / CLIENTS / ETC
*** 
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

### KEYWORDS / PREFIXES / NAMING-CONVENTIONS
*** 
blah blah blah.  
blah blah blah.  
blah blah blah.  
blah blah blah.  

### CODE SYNTAX (leet-python, C/C++, JS)
*** 
blah blah blah.  
blah blah blah.  
blah blah blah.  
blah blah blah.  


### MY SCRIPTS (unsure how this section will be used atm)
*** 
blah blah blah.  
blah blah blah.  
blah blah blah.  
blah blah blah.  


### TRELLO CARDS 
*** 
##### this section will likely be combined into the other ones based on the actual info of the card(s). But the first step is to simply get the info here in this doc and then worry about where/which-section later.
blah blah blah.  
blah blah blah.  
blah blah blah.  


### EXCEL DOCS 
*** 
##### this section will likely be combined into the other ones based on the actual info of the EXCEL doc(s). But the first step is to simply get the info here in this doc and then worry about where/which-section later.
blah blah blah.  
blah blah blah.  
blah blah blah.  

### CATCH-ALL / MISC
*** 

GIT PROMPT SYMBOLS and how to read/interpret them:  
https://chatgpt.com/c/69e167f7-a508-83ea-be41-4ec2d78654a7  
- main !13 ?6 ---> means you have 13 files with changes that have NOT been staged yet () and 6 files are UNTRACKED (aka need to git add)
- !13 == means 13 of your 'tracked' files have changes that are not staged yet ... OR IOW...
- !N == “Out of all tracked files, N of them have changes that are not staged.”  ... OR IOW...
- !N == “N tracked files have been modified in the **working directory** but are not in the index (not staged).”
- 
- 
- 

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
