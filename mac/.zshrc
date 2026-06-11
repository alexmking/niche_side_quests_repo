# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# TODO sourcing this zshrc can take a long time as this file grows so it's
# TODO BEST PRACTICE to off load some of the less-freq/updated stuff from here 
# TODO and put it into the zprofile 
# TODO: WHY? ----> this is bc zprofile is only loaded once when your session starts,
# TODO while the ENTIRE zshrc file has to be RE-processed/parsed every time you source, EVEN IF 99% of the doc is the SAME UNCHANGED doc (Which it is)
# TODO so putting the 'basically never going to change' stuff into zprofile is good idea some time down the road (many tuts on this to expl)

####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
###################################################################
# 2025 COMMENTED OUT BELOW TEMPORARILY
#####################################################################
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# $HOME var is this path: /Users/alexking/



####################################################################
# FIX THIS LATER (this is the fuzzy-finder config stuff that I need to fix)
######################################################################
# fcd() {
#   local dir
#   dir=$(find ${1:-.} -type d -not -path '*/\.*' 2> /dev/null | fzf +m) && cd "$dir"
# }




# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/bin:$PATH"  # ADDED Dec 4, 2025 after pbcopy command not found...
# !!! WHEN WE MOVE alexScripts to amk/tools we will have to UNCOMMENT the below line so it can find the new script dir (and this puts it at the top of the path-searches so it should be just as fast)
export PATH="$HOME/amk/tools/alexScripts:$PATH"
# !!! WHEN WE MOVE alexScripts to amk/tools we will have to UNCOMMENT the below line so it can find the new script dir (and this puts it at the top of the path-searches so it should be just as fast)

# KIM this line below is APPENDING to our list of PATHS. It's NOT REDEFINING the PATH to just be the path we're giving it on the line (in this case the path to the niche_side_quests_repo/mac dir). So this is good bc it means we can still access all the other PATHS that were already in our PATH variable before, but now we also have the new path to the niche_side_quests_repo/mac dir added to the list of places it will look for executables when we run commands in terminal.
export PATH="$HOME/amk/tools/GIT_STUFF/niche_side_quests_repo/mac:$PATH"

# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/scr-update_dev_landscape1.py
# "$HOME/amk/tools/GIT_STUFF/niche_side_quests_repo/mac:$PATH"

# /usr/local/bin:$PATH


# ####### NOT SURE IF THESE ARE NEEDED ANYMORE NOW ###########
# bindkey -e               # enable emacs-style keybindings (if not already)
# bindkey '^E' end-of-line # force Ctrl+E → end-of-line







####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
# ###################################################################
# TMP one to try and disable oh-my-zsh' for a sec to see if that is what is causing slowness
# #####################################################################
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh" #AMK21
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------

# $HOME var is this path: /Users/alexking/
 






# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
# COMMENT IN/OUT VARIOUS THEMES AND PICK ONE TO ACTUAL USE (the rest commented out so easy to switch to/from themes)
######################################################################
ZSH_THEME="powerlevel10k/powerlevel10k" # AMK21
# ZSH_THEME="agnoster"
# ZSH_THEME="apple" 
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# TODO this one below may be worth uncommenting
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# TODO this one below may be worth uncommenting
# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# OPTION 1...
# plugins=(git zsh-autosuggestions jsontools web-search) # ORIGINAL plugin=() line

# OPTION 2...(fzf-tab)
# plugins=(
#   git 
#   zsh-autosuggestions 
#   jsontools 
#   web-search
#   fzf-tab # to turn it on and off: toggle-fzf-tab
#   zsh-autosuggestions
#   fzf
# )

# # OPTION 3... [TMP COMMENTED THIS ONE OUT to see where fzf was getting Ctrl + T shortcut behavior]
# plugins=(
#   git 
#   zsh-autosuggestions 
#   fzf
#   jsontools 
#   web-search
# )

######################
# fzf-tab EXPLAINED:
# it's NOT a subset of fzf itself like I thought, rather it just adds the fzf functionality to the output of TAB
# EXAMPLE with 'ls' command:
    # WITHOUT fzf-tab: normally if you type 'ls' and then hit TAB before actually running the ls command, it will display the possible options which you can then tab though 1 by 1
    # WITH fzf-tab: now when you type 'ls' and then hit TAB before actually running the ls command, it will allow you fuzzy-find the output of the TAB action (which prev youd only be have to scroll through 1 by 1)
# so K.I.M fzf-tab is NOT tied to the 'fzf' command (so you don't like have to run fzf and then it tab or some shit like I thought originally, it's just a buff to the default TAB behavior in terminal and THATS IT)
  # Some situations fzf-tab is not ideal for, so you can temp revert back to the normal TAB beavior via this CLI command on the fly:
    #   'toggle-fzf-tab'
  #### HOWEVER it seems 99% of sitautions are better with fzf-tab BECAUSE fzf-tab ALREADY shows you the same default TAB output which you can scroll through just like if fzf-tab was DISABLED. (but NAYBe it has to do with FiLE tpyes and the default TAB allows you to select non-dirs (IDK TBH bc it seems fzf-tab is ALWAYS better option)
###################
# TODO ==> I THINK the ORDER of plugins listed below MATTERS and for some reason we want fzf-tab BEFORE fzf (idk)
# OPTION 3... with fzf-tab    toggle-fzf-tab
plugins=(
  git 
  zsh-autosuggestions 
  fzf-tab
  fzf
  jsontools 
  web-search
)

# # OPTION 3...(no fzf)
# plugins=(
#   git 
#   zsh-autosuggestions 
#   jsontools 
#   web-search
# )













####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
# TMP one to try and disable oh-my-zsh' for a sec to see if that is what is causing slowness
######################################################################
source $ZSH/oh-my-zsh.sh # AMK21

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------

# /Users/alexking/local_docs/MY_VERSION_nasa_proj_4github/nasa-imaging-react-app/node_modules/array.prototype.flat
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"





















# ==================================================================
# RULES OF THUMB for 'prefaces' of aliases...
# ==================================================================
# cd       ==      obvi
# edit     ==      edit the file in VS Code
# fz       ==      doing fzf over some output
#
# list     ==      printing a list sep by new lines (like PATH) or etc
# get      ==      either returns only 1 simple thing (like a single env var) AND/OR copies it to clipboard at same time
# cpy      ==      ?? this one is good alternative to 'get'
#
# ===================================
# other ones to consider...
# ===================================
# my       ==      ??
# sel      ==      short for 'select'. This one is another alt/variation of 'get' and/or 'cpy'??
# show     ==      ?? maybe inbetween 'list' and 'get'? such as show-drive-info ??
# see      ==      ?? interchangeable with 'show' i think ??
#
# print    ==      ?? prob not using this one bc 'see' and 'show' and 'list' are all better/shorter


##################################
# REMINDER: MACs root vs home dir 
#     /     means start at ROOT dir 
#     ~/    means start at HOME dir (NOT root)
##################################














# ===================================
# my environment variables (these WILL persist fyi)
# ===================================
# export AMK_DIR="$HOME/amk"
# export ALEXSCRIPTS_DIR="$HOME/amk/tools/alexScripts"
# export REPO_DIR="/Users/alexking/local_docs/GIT_STUFF"
# export NICHE_REPO_DIR="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo"

export AMK_DIR="$HOME/amk"
export ALEXSCRIPTS_DIR="$HOME/amk/tools/alexScripts"
export REPO_DIR="/Users/alexking/amk/tools/GIT_STUFF"
export NICHE_REPO_DIR="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"

# export AMK_DIR="/Users/alexking/amk"
# export ALEXSCRIPTS_DIR="/Users/alexking/amk/tools/alexScripts"
# export REPO_DIR="/Users/alexking/amk/tools/GIT_STUFF"
# export NICHE_REPO_DIR="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"

# /Users/alexking/amk/dropzone/local_docs/GIT_STUFF/niche_side_quests_repo

#TODO ADD MORE ENV VARS LATER AS NEEDED...
#TODO ADD MORE ENV VARS LATER AS NEEDED...
#TODO ADD MORE ENV VARS LATER AS NEEDED...
#TODO ADD MORE ENV VARS LATER AS NEEDED...

# Development paths
# export PROJECTS_DIR="$HOME/local_docs/GIT_STUFF"
export PROJECTS_DIR="$HOME/amk/projects"

# export SCRIPTS_DIR="$ALEXSCRIPTS_DIR"  # You already have this defined

# Editor preferences
# export EDITOR="code"
# export VISUAL="code"

# Language/Tool specific
# export PYTHON_PATH="/usr/local/bin/python3"
# export NODE_PATH="$HOME/.nvm/versions/node/$(nvm current)/lib/node_modules"

# History configuration
# export HISTSIZE=10000
# export SAVEHIST=10000
# export HISTFILE="$HOME/.zsh_history"

# Frequently accessed config directories
# export CONFIG_DIR="$HOME/.config"
# export VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"

# # Common project shortcuts
# export DESKTOP="$HOME/Desktop"
# export DOWNLOADS="$HOME/Downloads"
# export DOCUMENTS="$HOME/Documents"
export QUICK_REF_DIR="$AMK_DIR/notes/quick_ref"
export ALL_CONFIGS_DIR="$HOME/ALL_CONFIGS"
export LEET_DIR="$HOME/Desktop/LEET"
# export LOCAL_DOCS_DIR="$HOME/local_docs"
export LOCAL_DOCS_DIR="/Users/alexking/amk/dropzone/local_docs" #### WILL NEED TO CHANGE SOON OBVI once its no longer in DROPZONE...
# /Users/alexking/amk/dropzone/local_docs
export SCREENSHOTS_DIR="$HOME/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"

# # Terminal colors
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced

# # FZF configuration
# export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
# export FZF_DEFAULT_COMMAND='find . -type f'

# # Homebrew (if applicable)
# export HOMEBREW_PREFIX="/usr/local"
# export HOMEBREW_NO_ANALYTICS=1

# # Git configuration
# export GIT_EDITOR="code --wait"


































################################################################
################################################################
# GLOSSARY SECTIONS LEGEND (ctrl-f "zz-" to quickly navigate):
################################################################
################################################################
# 1. misc aliases zz-
# 2. the alises that take arguments  zz-
# 3. the 'edit' aliases zz-
# 4. the 'cd' aliases zz-
# 5. the SEARCH/find aliases zz-
# 6. LIST aliases (aka print out to terminal) zz-
# 7. the 'git' aliases zz-  
# 7. the 'GREP' aliases zz-  
# 7. the 'get' aliases zz-  #TODO)
# 8. the 'copy' aliases zz- #TODO)
# 9. the 'select' aliases zz- #TODO)
# 10. the 'show' aliases zz- #TODO)
# 11. the 'see' aliases zz- #TODO)
# 12. the 'HELP' & 'VERSION' aliases #TODO THIS IS NEW ONE I JUST ADDED TO HELP ME STANDARDIZE ALL THE DIFF 'help/manpages' stuff from CLI
# RULE OF THUMB: each 'section' header should have TWO lines of ########### so clearly differentiated from other sections/sub-sections/misc-comments I have WITHIN sections

# etc etc #TODO fix/re-arrange the above sections to fit the actual sections below...
# etc etc #TODO fix/re-arrange the above sections to fit the actual sections below...
# etc etc #TODO fix/re-arrange the above sections to fit the actual sections below...
# etc etc #TODO fix/re-arrange the above sections to fit the actual sections below...



################################################################
################################################################
# misc aliases    zz-    [section _ of _]
################################################################
################################################################
alias repos="cd $REPO_DIR"
alias cdrepos="cd $REPO_DIR"
alias go="cd /Users/alexking"
alias golocal="cd $LOCAL_DOCS_DIR"
alias explorer="open ."
alias e.="open ."
alias add_alias="code $NICHE_REPO_DIR/mac/.zshrc"
alias addalias="code $NICHE_REPO_DIR/mac/.zshrc"
alias editalias="code $NICHE_REPO_DIR/mac/.zshrc"
alias editaliases="code $NICHE_REPO_DIR/mac/.zshrc"
alias fixsketchy="sketchybar --reload"
alias sketchybarreload="sketchybar --reload"
alias reloadsketchybar="sketchybar --reload"
alias reloadmenubar="sketchybar --reload"
alias menubarreload="sketchybar --reload"
alias reloadtopbar="sketchybar --reload"
alias topbarreload="sketchybar --reload"
alias fixtopbar="sketchybar --reload"
alias fixmenubar="sketchybar --reload"
alias fixsketchybar="sketchybar --reload"

alias rootdir="cd /"
alias homedir="cd /Users/alexking"
alias cdrootdir="cd /"
alias cdhomedir="cd ~"
alias cdroot="cd /"
alias cdhome="cd ~"
alias cdamk="cd ~/Users/alexking/amk"
alias amk="cd ~/Users/alexking/amk"

# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/scr-update_dev_landscape1.py
# /scr-update_dev_landscape1.py


alias updatedevlandscape="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"
alias updatelandscape="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"
alias updatedevlandscapetaxonomy="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"
alias updatedevtaxonomy="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"
alias updatelandscapetaxonomy="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"

alias updatedl="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"
alias updatedevl="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"
alias updatedland="$NICHE_REPO_DIR/mac/scr-update_dev_landscape1.py"




alias helpdevlandscape="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"
alias helpdevl="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"
alias helpdl="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"
alias helpdland="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"
alias devlandscapehelp="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"
alias devlhelp="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"
alias dlhelp="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"
alias dlandhelp="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js --help"




####### NEW 'HOME' after FILE-SYSTEM re-organizming 2026 #####
# we're leaving Users/alexking alone and instead creating new dir in Users/alexking which will serve as my ACTUAL home dir
# this way we can leave all the messy hidden config files in alexking dir where they are now and wont have to worry about breaking a bunch of finicky config paths after moving stuff all around
##### name ideas ####
# aking, amk, mrking, workspace or ws, dev, hub, lab, hq, (hq for headquarters), cc (command-center),work, ak, 
# /Users/alexking/<INSERT DIR HERE>
# /Users/alexking/aking
# /Users/alexking/amk
# /Users/alexking/mrking
# /Users/alexking/workspace(1)

# FINALISTS are: amk, ak, lab, dojo, zen
# CHOOSING ==> amk officially...

#%%%%%%%%%%% KEEP IN MIND your curr WORK LAPTOP FileSYSTEM and try to MIRROR it as much as possible
# /Users/aking/<INSTERT NEW DIR HERE>
# vs my mac side:
# /Users/alexking/<INSTERT NEW DIR HERE>
# so maybe something like this so they both have the same NEW DIR name...
# /Users/aking/aking (WINDOWS)
# /Users/alexking/aking (MAC)
# OR 
# /Users/aking/amk (WINDOWS)
# /Users/alexking/amk (MAC)




alias cdrealhome="cd /Users/alexking/amk"
alias cdaking="cd /Users/alexking/amk"
alias cdking="cd /Users/alexking/amk"
alias cdrealhome="cd /Users/alexking/amk"


# prob not needed tbh but always forget the -a flag w native open command(so dont have to be in /Applications dir to open apps)
alias openapp="open -a" 
alias openapplication="open -a"
alias openraycast="open -a Raycast"
#TODO add more openapp/openapplication aliases for other apps I use frequently...
#TODO aside from the RAYCAST one this may be pointless aliasing or overkill but going to try it anyway 
#TODO RAYCAST one is useful bc when i close/restart raycast, I no logner have my shortcuts/spotlight-search etc and manually 
#TODO so all i need is this one manual alias for RAYCAST bc once I have RAYCAST open, then I already have alias-like quick access to everything else via RAYCAST 
#TODO (for ex like I wouldnt need say an 'alias=open -a chrome' bc once I have RAYCAST open, I can just do 'chrome' in RAYCAST to open chrome)

# pid's and kill command
alias findpid="pgrep"
alias findpids="pgrep"
alias getpid="pgrep"
alias listpids="ps aux"
alias fzfpids="ps aux | fzf"
alias fzflistpids="ps aux | fzf"


alias killpid="kill"


####### MY STARTUP 'LAUNCH MY MAIN APPS' SCRIPT ALIASES ###########
alias setupalexenv="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias setupmyapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias setupmyenv="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias launchmainapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias launchmyapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias launchmymainapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias launchalexapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias scrsetupalexenv="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias scrsetupmyapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias scrsetupmyenv="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias scrlaunchmainapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias scrlaunchmyapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias scrlaunchmymainapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias scrlaunchalexapps="$ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"


# open KEYBOARD SHORTCUT VISUALIZER HTML FILE ALIASES (this is the one I use the most so def want an alias for it, and then also add a bunch of variations of the alias name so that no matter what combination of 'keyboard', 'shortcut', 'visualizer', 'viz', 'vis' etc I type, it will work and open the file)
# alias keybhtml="open -a "chrome" "file:///Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html""
alias viskeyb="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias viskeyboard="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias vizkeyb="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias vizkeyboard="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias viskeyboardshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias vizkeyboardshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias visshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias vizshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias viskeybshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias vizkeybshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias viskeyboardshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias vizkeyboardshortcuts="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keybvis="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keybviz="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keybshortcutvis="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keybshortcutviz="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keybshortcutsvis="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keybshortcutsviz="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keyboardshortcutsvisualizer="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keyboardshortcutsvis="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias keyboardshortcutsviz="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias shortcutsvisualizer="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias shortcutsvis="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias shortcutsviz="open file:///$NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"

# the VSCODE-visualizer (NEW html)
# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/vscode-shortcuts.html
alias vskeybvis="open file:///$NICHE_REPO_DIR/_universal/vscode-shortcuts.html"
alias visvscodekeyb="open file:///$NICHE_REPO_DIR/_universal/vscode-shortcuts.html"
alias visvscodekeyboard="open file:///$NICHE_REPO_DIR/_universal/vscode-shortcuts.html"
alias vizvscodekeyb="open file:///$NICHE_REPO_DIR/_universal/vscode-shortcuts.html"


# the DEV LANDSCAPE-visualizer (NEW html)
alias devlandscape="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias devlandscapevis="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias devlandscapevisualizer="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias opendevlandscapevisualizer="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias opendevlandscape="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias rundevlandscapevisualizer="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias rundevlandscape="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"

alias devl="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias dl="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias opendevl="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias opendl="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias rundevl="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias rundl="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"

alias dland="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias opendland="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias rundland="open file:///$NICHE_REPO_DIR/_universal/dev_landscape/index.html"



# /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/dev_landscape/index.html




################################################################
################################################################
# the alises that take arguments    zz-    [section _ of _]
################################################################
################################################################
# add a copy alias here which is just shorthand for 'cp' command and must take the two args (source and dest)
alias copy="cp"
alias copydir="cp -r"
alias move="mv"
alias movedir="mv" # 'recursively' is default, so no need for -r flag here
# these 'rm' aliases may need some tweaking [since we determined rm -rf is the swiss-army-knife of deletion commands on BOTH mac and windows (initially thought rm -rf != windows side and we'd have to use 'del' and 'rmdir' instead]
alias rmrf="rm -rf" # THIS IS THE ONLY ONE WE'LL REALLY NEED (so the below 10ish aliases may be redundant/unneeded, esp after deciding we WONT be using 'del' and 'rmdir' aliases AT ALL, even on Win side, so there's no need to accomodate those window-specific commands anymore, bc remember, the goal is 'uniformity' across mac/lin/win, and 'rm -rf' ALREADY gives us that uniformity)
alias rmdir="rm -r"
alias rd="rm -r"
alias remove="rm"
alias removedir="rm -r"
alias removefile="rm"
alias removeforce="rm -rf"
alias delete="rm"
alias deletefile="rm"
alias deletedir="rm -r"
alias delfile="rm"
alias deldir="rm -r"

# leet morning script aliases...(these can accept args just like the WINDOWS side does fyi)
alias morningleet="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias morningwarmup="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias nextproblem="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias nextleet="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias doaproblem="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"

######### HARDCODED-ARG VERSIONS OF MORNING-LEET script (shorthand if I just want some standard practice probs and its been a while so i dont really know what the args are (yes I could just do TerminalHISTORY search but this is nice to have as is))
alias morningleetgroup1="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems"
alias leetgroup1="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems"
alias standardleet1="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group1 onlytopproblems"

alias morningleetgroup2="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group2 onlytopproblems"
alias leetgroup2="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group2 onlytopproblems"
alias standardleet2="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group2 onlytopproblems"

alias morningleetgroup3="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group3 onlytopproblems"
alias leetgroup3="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group3 onlytopproblems"
alias standardleet3="$NICHE_REPO_DIR/_universal/scr-leet_morning_random.py easymed group3 onlytopproblems"

###### REVERT BACK TO THESE IF _universal DIR ISNT WORKIN OUT WELL FOR MORNINGLEET SCRIPT...
# # leet morning script aliases...(these can accept args just like the WINDOWS side does fyi)
# alias morningleet="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias morningwarmup="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias nextproblem="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias nextleet="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias doaproblem="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py"

# ######### HARDCODED-ARG VERSIONS OF MORNING-LEET script (shorthand if I just want some standard practice probs and its been a while so i dont really know what the args are (yes I could just do TerminalHISTORY search but this is nice to have as is))
# alias morningleetgroup1="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group1 onlytopproblems"
# alias leetgroup1="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group1 onlytopproblems"
# alias standardleet1="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group1 onlytopproblems"

# alias morningleetgroup2="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group2 onlytopproblems"
# alias leetgroup2="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group2 onlytopproblems"
# alias standardleet2="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group2 onlytopproblems"

# alias morningleetgroup3="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group3 onlytopproblems"
# alias leetgroup3="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group3 onlytopproblems"
# alias standardleet3="$NICHE_REPO_DIR/mac/scr-leet_morning_random.py easymed group3 onlytopproblems"



## these 'call' aliases have YOU provide the specific function as one of the args (unlike the other section right below this one that has the function included in the alias itself)
# in other words, these 'call' aliases are more flexible but require you to remember the specific function names and provide them as args, whereas the ones below are less flexible but more user-friendly bc they have the function name built into the alias itself so you dont have to remember the function names or provide them as args
alias calldevlandscape="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js" 
alias calldevl="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js" 
alias calldland="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js" 
alias calldl="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js" 
alias calldevland="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js" 


#### trying to make an alias for all of the dev-landscape cli functions(using dland as the main/only prefix, for now...)
  # add-term       Add a term to the taxonomy
  # remove-term    Remove a term from the taxonomy by ID
  # update-term    Update any field of a term (except location fields)
  # move-term      Move a term to a different category or subcategory
  # add-alias      Append one or more aliases to a term
  # add-tag        Append one or more tags to a term
  # add-used-with
  # add-built-on
  # add-built-upon-by
  # add-runs-on
  # add-alternative
  # add-part-of
  # add-include
  # add-example
  # add-use-case
  # add-related-concept
  # print-ids      Print a list of all term ID, along with their name
  # print-schema   Print the JSON schema for the taxonomy (for reference or debugging)
  # print-landscape-overview Print a structural overview of the taxonomy with counts
  # print-terms    Print a sorted list of all terms with their location
  # which-are-dups Check a list of names/ids and report duplicates vs new terms
  # validate-field-duplicates Report (or fix) duplicate values in array fields across all terms
  # validate-term-duplicates Report (or fix) terms with duplicate id or name; warn on name/alias conflicts

#-----------------------------------------------------------------
#--- 'dland' alias for each above function...
#-----------------------------------------------------------------
alias dlandaddterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-term"
alias dlandremoveterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js remove-term"
alias dlandupdateterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js update-term"
alias dlandmoveterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js move-term"
# -
alias dlandprintoverview="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dlandprintlandscape="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dlandprintterms="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms"
alias dlandprintids="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-ids"
alias dlandprintschema="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-schema"
alias dlandprinttermsbycategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category"
alias dlandprinttermsbysubcategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category --subcategory"
# -
alias dlandlistoverview="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dlandlistlandscape="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dlandlistterms="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms"
alias dlandlistids="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-ids"
alias dlandlistschema="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-schema"
alias dlandlisttermsbycategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category"
alias dlandlisttermsbysubcategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category --subcategory"

alias dlandwhicharedups="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js which-are-dups"
alias dlandvalidatedupfieldvals="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js validate-field-duplicates"
alias dlandvalidatetermdups="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js validate-term-duplicates"
# - the rest of the add- functions...
alias dlandaddalias="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dlandaddaliases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dlandaddtag="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dlandaddtags="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dlandaddusedwith="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-used-with"
alias dlandaddbuilton="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-on"
alias dlandaddbuiltuponby="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-upon-by"
alias dlandaddrunson="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-runs-on"
alias dlandaddalternative="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dlandaddalternatives="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dlandaddpartof="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-part-of"
alias dlandaddinclude="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-include"
alias dlandaddexample="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dlandaddexamples="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dlandaddusecase="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dlandaddusecases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dlandaddrelatedconcept="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-related-concept"

#-----------------------------------------------------------------
#--- 'dl' alias for each above function...
#-----------------------------------------------------------------
alias dladdterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-term"
alias dlremoveterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js remove-term"
alias dlupdateterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js update-term"
alias dlmoveterm="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js move-term"
# -
alias dlprintoverview="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dlprintlandscape="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dlprintterms="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms"
alias dlprintids="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-ids"
alias dlprintschema="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-schema"
alias dlprinttermsbycategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category"
alias dlprinttermsbysubcategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category --subcategory"  
# - 
alias dllistoverview="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dllistlandscape="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-landscape-overview"
alias dllistterms="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms"
alias dllistids="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-ids"
alias dllistschema="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-schema"
alias dllisttermsbycategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category"
alias dllisttermsbysubcategory="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js print-terms-by-category --subcategory"
# - 
alias dlwhicharedups="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js which-are-dups"
alias dlvalidatedupfieldvals="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js validate-field-duplicates"
alias dlvalidatetermdups="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js validate-term-duplicates"
# - the rest of the add- functions...
alias dladdalias="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dladdaliases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dladdtag="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dladdtags="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dladdusedwith="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-used-with"
alias dladdbuilton="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-on"
alias dladdbuiltuponby="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-upon-by"
alias dladdrunson="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-runs-on"
alias dladdalternative="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dladdalternatives="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dladdpartof="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-part-of"
alias dladdinclude="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-include"
alias dladdexample="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dladdexamples="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dladdusecase="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dladdusecases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dladdrelatedconcept="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-related-concept"

#-----------------------------------------------------------------
#--- swapping 'add' with 'append' for all the above aliases, just for ease of remembering the function names since sometimes i forget if it's 'add' or 'append' but they both do the same thing under the hood, which is append to the existing array of values for that field in the term (as opposed to replacing the existing value(s) with a new value, which is what the 'update' function does)
#-----------------------------------------------------------------
#### adding 'append' variations to all the specific add-functions (both the dl and dland groups) (just so i dont have to remember if it's 'add' or 'append', since both calls will be the exact same under the hood)
alias dlandappendalias="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dlandappendaliases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dlandappendtag="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dlandappendtags="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dlandappendusedwith="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-used-with"
alias dlandappendbuilton="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-on"
alias dlandappendbuiltuponby="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-upon-by"
alias dlandappendrunson="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-runs-on"
alias dlandappendalternative="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dlandappendalternatives="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dlandappendpartof="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-part-of"
alias dlandappendinclude="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-include"
alias dlandappendexample="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dlandappendexamples="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dlandappendusecase="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dlandappendusecases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dlandappendrelatedconcept="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-related-concept"

alias dlappendalias="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dlappendaliases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alias"
alias dlappendtag="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dlappendtags="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-tag"
alias dlappendusedwith="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-used-with"
alias dlappendbuilton="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-on"
alias dlappendbuiltuponby="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-built-upon-by"
alias dlappendrunson="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-runs-on"
alias dlappendalternative="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dlappendalternatives="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-alternative"
alias dlappendpartof="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-part-of"
alias dlappendinclude="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-include"
alias dlappendexample="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dlappendexamples="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-example"
alias dlappendusecase="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dlappendusecases="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-use-case"
alias dlappendrelatedconcept="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js add-related-concept"

###### the UNIVERSAL 'append' function that is capable of doing all the above mini fucntions, by accepting the add-function as its first arg
# (need 1 dland and 1 dl alias for this one)'dl' alias for each above function...#######
alias dlandappend="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js append" # ❗USEFUL
alias dlappend="node $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.js append" # ❗USEFUL





# node taxonomy.js append --use-case --id python --use-case use-case1 --use-case use-case2 --use-case use-case3 
# node taxonomy.js append --use-case --id python use-case1 use-case2 use-case3 
# ## the aliases will absorb the first function arg (in this case '--use-case') so the above two calls should work with the alias as well, and then the rest of the args can be provided as normal (so the --id arg and value, and then the list of use-cases to add)
# ### SO the acutal calls using the alias would look like this (the first arg '--use-case' is absorbed by the alias and so not needed to be provided in the call when using the alias):
# dlappendtags --id python --tags tag1 --tags tag2 --tags tag3
# dlappendusecase --id python use-case1 use-case2 use-case3

# node taxonomy.js append tags --id python --tags tag1 --tags tag2 --tags tag3
# node taxonomy.js append tags --id python tag1 tag2 tag3 

# node taxonomy.js add-tag python tag1 tag2 tag3 
# node taxonomy.js add-tag python tag1 tag2 tag3 


# ### EXAMPLE CALLS OF THE ABOVE 'universal' alias (adding two items of 1 fields, then 1 item of another field)
# # dlappend add-tag --id python tag1 tag2 tag3
# # dlappend add-use-case --id python foo1 foo2 foo3


# ### EXAMPLE CALLS OF THE ABOVE ALIASES: (adding 3 items of the respective field) (OBVI these mini functions can only add items for 1 field. Lie obvi I cant do 'add-use-case -id python -foobar1 --tags myTag1, myTag2')
# # dlandaddtag --id python tag1 tag2 tag3 
# # dlandaddusecase --id python tag1 tag2 tag3 





# node taxonomy.js append --use-case --id python --use-case use-case1 --use-case use-case2 --use-case use-case3
# node taxonomy.js append --use-case --id python use-case1 use-case2 use-case3
# node taxonomy.js append  --id python use-case1 use-case2 use-case3

# node taxonomy.js append --tags --id python --tags tag1 --tags tag2 --tags tag3
# node taxonomy.js append tags python tag1 tag2 tag3

# node taxonomy.js append --use-case --id python use-case1 use-case2 use-case3
# node taxonomy.js append  --id python use-case1 use-case2 use-case3





# ❗TODO❗ ❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗
# ######################################################################################
# ######## THESE ARE THE TYPES OF COMMANDS ID LIKE TO HAVE/RUN ON COMMAND LINE:
# ######################################################################################
# ❗TODO❗ ❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗❗TODO❗
# dlappend --tags --id python tag1 tag2 tag3  # using the generic append, and then providing the field as first arg ...

# dlappendtags --id python tag1 tag2 tag3  # using a more specific alias that has the field built into the alias name itself (so its more user-friendly and I dont have to remember the specific field/function names or provide them as args, but less flexible since I would need a different alias for each field/function)
# dlappendexamples --id python example1 example2 exmaple3  # using a more specific alias that has the field built into the alias name itself (so its more user-friendly and I dont have to remember the specific field/function names or provide them as args, but less flexible since I would need a different alias for each field/function)
# # (note these aliases can use either the mini functions or the universal 'append' function, since both the mini functions and the universal 'append' function have the field/function as the first arg, so the alias can just absorb that first arg and then pass the rest of the args along as normal to either the mini function or the universal 'append' function, since they both have the same first arg and then the rest of the args are provided in the same way regardless of which underlying function is being called by the alias)

# ######### WISH LIST VARIATIONS TO CONSIDER TRYING TO ADD LATER: ######
# dlappend tags python tag1 tag2 tag3  # (no --flags at all))  1st arg is always the field, 2nd arg is always the id, and the rest of the args are always the items to add to that field for that id. This is more user-friendly and easier to remember since the syntax is always the same regardless of which field/function we're adding to, but less flexible since it requir

# dlappendtags python tag1 tag2 tag3  # (no --flags at all), 1st arg is always the id, and the rest of the args are always the items to add to that field for that id. This is more user-friendly and easier to remember since the syntax is always the same regardless of which field/function we're adding to, but less flexible since it requires a specific alias for each field/function, and also requires the field name to be included in the alias name itself which could get unwieldy if we have a lot of fields/functions we want to make aliases for. But it would be nice to have at least a few of these more user-friendly aliases for the fields/functions I use most often, even if I still have the more flexible universal 'append' alias for when I want to add items to less common fields or just want the flexibility of providing the field as an arg in the call instead of having it built into the alias name.
# dlappendexamples python example1 example2 exmaple3  # (no --flags at all), 1st arg is always the id, and the rest of the args are always the items to add to that field for that id. This is more user-friendly and easier to remember since the syntax is always the same regardless of which field/function we're adding to, but less flexible since it requires a specific alias for each field/function, and also requires the field name to be included in the alias name itself which could get unwieldy if we have a lot of fields/functions we want to make aliases for. But it would be nice to have at least a few of these more user-friendly aliases for the fields/functions I use most often, even if I still have the more flexible universal 'append' alias for when I want to add items to less common fields or just want the flexibility of providing the field as an arg in the call instead of having it built into the alias name.
# # (note these aliases can use either the mini functions or the universal 'append' function, since both the mini functions and the universal 'append' function have the field/function as the first arg, so the alias can just absorb that first arg and then pass the rest of the args along as normal to either the mini function or the universal 'append' function, since they both have the same first arg and then the rest of the args are provided in the same way regardless of which underlying function is being called by the alias)












# #TODO Find all the other commands that take args and make aliases for them too...[mac-side my not have any special syntax for these commands like windows side does, since the copy alias copy="cp" seems to work fine as is]
# #TODO Find all the other commands that take args and make aliases for them too...[mac-side my not have any special syntax for these commands like windows side does, since the copy alias copy="cp" seems to work fine as is]
# #TODO Find all the other commands that take args and make aliases for them too...[mac-side my not have any special syntax for these commands like windows side does, since the copy alias copy="cp" seems to work fine as is]
# #TODO Find all the other commands that take args and make aliases for them too...[mac-side my not have any special syntax for these commands like windows side does, since the copy alias copy="cp" seems to work fine as is]
# #TODO Find all the other commands that take args and make aliases for them too...[mac-side my not have any special syntax for these commands like windows side does, since the copy alias copy="cp" seems to work fine as is]











# clean up/standardize these ls aliases later...
alias lsz="ls -a | fzf"  # UNDERRATED / UNDERUTILIZED ALIAS
alias lsf="ls -a | fzf"  # UNDERRATED / UNDERUTILIZED ALIAS
alias lsfz="ls -a | fzf"  # UNDERRATED / UNDERUTILIZED ALIAS
alias lsfzf="ls -a | fzf" # UNDERRATED / UNDERUTILIZED ALIAS
alias fzfls="ls -a | fzf" # UNDERRATED / UNDERUTILIZED ALIAS
alias lsall="ls -a"
alias lshidden="ls -a"
alias showhidden="ls -a"
alias lsshowhidden="ls -a"
alias lsonlyhidden="ls -ad .*"
alias lswithhidden="ls -a"
alias lsh="ls -a"
alias lsnorm="ls"
alias lsregular="ls"
alias lsdefault="ls"
alias lsnohidden="ls"



################################################################
################################################################
# some git aliases:   zz-     [section _ of _]
################################################################
################################################################
# (NOTE 'gf' is already working but not sure what the actual command is that it's tied to bc it's not defined here...) 
alias gst="git status"
alias gs="git status"
alias gfetch="git fetch"
alias gpush="git push"
alias gpull="git pull"
alias gcm="git commit -m"
alias gswitch="git switch"

#### when no need for git add step #### 
# (aka I'm not adding any NEW files. aka only pushing files/changes that are already being tracked by git)
alias gitquickcommit="git commit -a -m"
alias gitroutinecommit="git commit -a -m"
alias gitfastcommit="git commit -a -m"
alias gitsimplecommit="git commit -a -m"
alias gquickcommit="git commit -a -m"
alias groutinecommit="git commit -a -m"
alias gfastcommit="git commit -a -m"
alias gsimplecommit="git commit -a -m"
alias quickcommit="git commit -a -m"
alias quickcommitgit="git commit -a -m"

# git commit -a -m "Your descriptive commit message here"





# ADD MORE HERE... TODO
# ADD MORE HERE... TODO

#### TODO #####
#### TODO #####
#### TODO #####
#### TODO #####
# create an env variable for the NICHE REPO PATH so I can use that in these aliases below instead of hardcoding the full path every time
# so /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt
# becomes...
# $NICHEREPO/_universal/prefix_naming_conventions.txt
#### TODO #####
#### TODO #####
#### TODO #####
#### TODO #####


# alias sz="source ~/.zshrc; echo '~/zshrc sourced :)'"
# alias sourcezshrc="source ~/.zshrc; echo '~/zshrc sourced :)'"
alias sz="source $NICHE_REPO_DIR/mac/.zshrc; echo '~/zshrc sourced :)'"
alias sourcezshrc="source $NICHE_REPO_DIR/mac/.zshrc; echo '~/zshrc sourced :)'"


# alias path='echo; tr ";" "\n" <<< "$PATH"; echo;'






################################################################
################################################################
# grep aliases:   zz-     [section _ of _]
################################################################
################################################################
#alias grep="grep . -rnI" [TRYING TO AVOID SETTING ALIASES FOR THE ACTUAL COMMAND ITSELF BC THAT CAN CAUSE ISSUES LATER]]
alias grp="grep -rnI" .
alias gp="grep -rnI" .
alias greprni="grep -rnI" .
alias grepstandard="grep -rnI" .
alias findinfiles="grep -rnI" .
alias searchinfiles="grep -rnI" .
alias findinfilecontents="grep -rnI" .
alias findfilecontents="grep -rnI" .
alias searchinfilecontents="grep -rnI" .
alias searchfilecontents="grep -rnI" .
# other grep aliases...
alias grepignorecase="grep -i"
alias grepi="grep -i"
alias greprecursive="grep -r"
alias grepr="grep -r"
alias greprecursiveignorecase="grep -ri"
alias grepri="grep -ri"


#----------------------------------------------------------------
# diff levels of 'find/search' (we should prob have 1 alias set up for each level here...)
#----------------------------------------------------------------
# 1. search for filename only (no dirs, no file contents)
# 2. search for dir's only (no files, no file contents)
# 3. search for file contents only (no files, no dirs)    [x] DONE with GREP...
# 4. search for both filenames and dir's (no file contents)
# 5. search for everything (filenames, dir's, and file contents)[MOST EXPENSIVE, SLOWEST, obvi]
# ISSUE ON WINDOWS SIDE for #2, #4, and #5, all bc finder.py cannot search 'DIRECTORIES'...
# SO NEED TO FIG OUT A WORKAROUND ON WINDOWS SIDE (fd-find) suggested via GPT so check that out

################################################################
################################################################
# the 'find' aliases:   zz-     [section _ of _]    'ff' 
################################################################
################################################################
alias findfilenameonly="find . -type f -name"   # level 1 of 5 (not so imp, useful)
alias finddironly="find . -type d -name"        # level 2 of 5 (not so imp, useful)
alias findfilecontentsonly="grepdef -rnI" .     # level 3 of 5 (most useful, already done with grep)
alias findfileanddirnames="find . -name"        # level 4 of 5 (useful)
alias findeverything="find . -name"             # level 5 of 5 (most expensive, least useful)

# ff == 'find files' , and ffd == 'find files and dirs' (akin to Raycast's approach as well)
alias ff="find . -name"        # level 4 of 5 (useful)
alias ffiles="find . -name"        # level 4 of 5 (useful)

alias fdirs="find . -type d -name"    # level 2 of 5 (not so imp, useful)
alias fd="find . -type d -name"    # level 2 of 5 (not so imp, useful)

alias ffd="find . -name"        # level 4 of 5 (useful)
alias ffilesanddirs="find . -name"        # level 4 of 5 (useful)

alias widenetsearch="find . -name"             # level 5 of 5 (most expensive, least useful)
alias searchall="find . -name"             # level 5 of 5 (most expensive, least useful)
alias searcheverything="find . -name"             # level 5 of 5 (most expensive, least useful)


# suggested combos for 'find' command:
alias findallgitrepos="find ~ -name .git -type d -prune" # find all git repos
alias findlargefiles="find . -type f -size +100M"  # find large files 
alias findrecentmodified="find . -type f \( -name '*.ts' -o -name '*.js' \) -mtime -2" # recently modified ts and js files
alias findanddelalldsstore="find . -name '.DS_Storeasdfasdfasdfasdf' -delete" # del all .DS_Store files

# Flags and their explanations for the 'find' command:
# -type f   : find files only
# -type d   : find directories only
# -name     : find by name (both files and directories)
# -rnI     : grep flags for recursive, line number, ignore binary files
# -iname   : case-insensitive name search







################################################################
################################################################
# the 'cd' aliases:   zz-     [section _ of _]
################################################################
################################################################
alias cdconfigdot="cd /Users/alexking/.config"
alias cdhome="cd /Users/alexking/"
alias home="cd /Users/alexking"
alias cdak="cd /Users/alexking"
alias cdalex="cd /Users/alexking"
alias cdalexking="cd /Users/alexking"
alias cdroot="cd /"
alias cdhome="cd /Users/alexking"

alias cdalexscripts="cd $ALEX_SCRIPTS_DIR"
alias cdconfig="cd $HOME/.config"
alias cdallconfigs="cd /Users/alexking/ALL_CONFIGS"
alias cdapps="cd /Applications"
alias cdapp="cd /Applications"
alias cdapplications="cd /Applications"
alias cddownloads="cd $HOME/Downloads"
alias cdquickref="cd $AMK_DIR/notes/quick_ref"

alias cddesktop="cd $HOME/Desktop"
alias cdleet="cd $HOME/Desktop/LEET"
alias cdlocaldocs="cd $LOCAL_DOCS_DIR"
alias cdlocal="cd $LOCAL_DOCS_DIR"

alias cddotfiles="cd $REPO_DIR/niche_side_quests_repo"
alias cddotfilesTestEnvVariable="cd $REPO_DIR/niche_side_quests_repo"
alias cdnichesidequest="cd $REPO_DIR/niche_side_quests_repo"
alias cdnicherepo="cd $REPO_DIR/niche_side_quests_repo"
alias cdsidequestrepo="cd $REPO_DIR/niche_side_quests_repo"
alias cdsidequest="cd $REPO_DIR/niche_side_quests_repo"
alias cdniche="cd $REPO_DIR/niche_side_quests_repo"
alias cdnicheuniversal="cd $REPO_DIR/niche_side_quests_repo/_universal"
alias cdnichemac="cd $REPO_DIR/niche_side_quests_repo/mac"
alias cdnichelinux="cd $REPO_DIR/niche_side_quests_repo/linux"
alias cdnichewindows="cd $REPO_DIR/niche_side_quests_repo/windows"


alias cdnichemac="cd $REPO_DIR/niche_side_quests_repo/mac"
alias cdnicheuniversal="cd $REPO_DIR/niche_side_quests_repo/_universal"


# WHITE SPACE PATH syntax: 
alias cdscreenshots='cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"'

# SCREENSHOTS FOLDER PATH:
# "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0/"

alias cddevlandscape="cd $NICHE_REPO_DIR/_universal/dev_landscape"
alias cddevl="cd $NICHE_REPO_DIR/_universal/dev_landscape"
alias cddevland="cd $NICHE_REPO_DIR/_universal/dev_landscape"
alias cddl="cd $NICHE_REPO_DIR/_universal/dev_landscape"
alias cddland="cd $NICHE_REPO_DIR/_universal/dev_landscape"
alias cddevl="cd $NICHE_REPO_DIR/_universal/dev_landscape"




################################################################
################################################################
# the 'fzf' aliases:   zz-     [section _ of _]
################################################################
################################################################
# BEST-USECASE: when you forget a shortcut/alias on command-line and instead of having to
# to leave terminal to open the file -> search then go back to terminal, you can simply 
# run ones of these fzf aliases for the file and instantly find that command without ever 
# having to leave terminal
alias fzfaliases="cat $HOME/.zshrc | fzf"
alias fzfalias="cat $HOME/.zshrc | fzf"
alias fzfuseraliases="cat $HOME/.zshrc | fzf"


alias fzfkeyb="cat $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html | fzf"
alias fzfkeybvis="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"
alias fzfkeybviz="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"
alias fzfcurrentkeyboardbindings="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"
alias fzfkeyboardbindings="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"
alias fzfbindings="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"
alias fzfkeyboard="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"
alias fzfkb="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"
alias fzfshortcuts="cat $NICHE_REPO_DIR/_universal/keyboard-visualizer.html | fzf"

alias fzfaero="cat $HOME/.config/aerospace/aerospace.toml | fzf"
alias fzfohmyzsh="cat ~/.oh-my-zsh | fzf"
alias fzfzshconfig="cat ~/.zshrc | fzf"
alias fzfeditzsh="cat ~/.zshrc | fzf"
alias fzfp10kconfig="cat ~/.p10k.zsh | fzf"
alias fzfeditp10k="cat ~/.p10k.zsh | fzf"
alias fzfeditprompt="cat ~/.p10k.zsh | fzf"


alias editref="code /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
alias editssotref="code /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"



# !!! ALERT SOME OF THESE are now broken bc I moved the misc prefix/ naming-conv .txt files to sep new folder...since that info is likely going to be consolidated into the main ref doc
alias fzfprefixnamingconventions="cat $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt | fzf"
alias fzfprefixes="cat $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt | fzf"

#---------------------------#
# || TIP REMINDER: || USE-CASE: if I'm in CLI and can't remember an alias exactly, I can do fzfalias, and then start with the 'DELIMITER' the alias uses (such as 'edit' or 'cd' or 'get' etc) and then fuzzy-find the rest of the alias from there
#---------------------------#











################################################################
################################################################
# the 'edit' aliases:   zz-     [section _ of _]
################################################################
################################################################





# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# OLD COMMANDS for the hardlinks were trying to repalce
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml
# ~/.config/aerospace/aerospace.toml

# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc
# ~/.zshrc

# ln -s 
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh
# ~/.p10k.zsh





# DONE! get copies of curr hardlinks jst in case 
# change the name of the orig so we can keep it there when we create the new one instead of del it entirely
# then move GIT_STUFF to /tools
# then do the following for EACH of the 3:
#   run the ln command to create new one
#  once all 3 are done, then restart iterm and pray

# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# NEW COMMANDS for the amk/tools/GIT_STUFF/etc...
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# ln -s
# ~/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml
# ~/.config/aerospace/aerospace.toml

# ln -s
# ~/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc
# ~/.zshrc

# ln -s 
# ~/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh
# ~/.p10k.zsh


# *****************************************************
# *****************************************************
# *****************************************************
# *****************************************************
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# AFTER I REMOVE niche from GIT_STUFF repo, I'll have to do all these commands again (as awell as the other annoying substeps...)
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# FIRST: do full TIME MACHINE backup of the whole system (just in case) (do RIGHT BEFORE i do this so can easily revert back if encounter any issues)
# *****************************************************
# ln -s
# ~/amk/tools/niche_side_quests_repo/mac/aerospace.toml
# ~/.config/aerospace/aerospace.toml

# ln -s
# ~/amk/tools/niche_side_quests_repo/mac/.zshrc
# ~/.zshrc

# ln -s 
# ~/amk/tools/niche_side_quests_repo/mac/.p10k.zsh
# ~/.p10k.zsh
# *****************************************************
# *****************************************************
# *****************************************************
# *****************************************************

















# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# I think these symbolic links I setup to get my active .dot files to be on my REPO
# are what is CAUSING THE PROBLEM when I try to move things to my new FILE SYSTEM dirs... 
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml
# ~/.config/aerospace/aerospace.toml
alias editaero="code $NICHE_REPO_DIR/mac/aerospace.toml"
alias editaero2="code $HOME/.config/aerospace/aerospace.toml"


#### TAKING A GUESS WHAT THIS ln -s command was bc looks like i accidentally del it
## actually it looks like this one does not have a hard link like the other so jsut leaving
alias editohmyzsh="code ~/.oh-my-zsh"
alias ohmyzsh="code ~/.oh-my-zsh"

# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc
# ~/.zshrc
alias zshconfig="code ~/.zshrc"
alias editzsh="code ~/.zshrc"
alias editzprofile="code ~/.zprofile"


# ln -s 
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh
# ~/.p10k.zsh
alias p10kconfig="code $NICHE_REPO_DIR/mac/.p10k.zsh"
alias editp10k="code $NICHE_REPO_DIR/mac/.p10k.zsh"
alias editprompt="code $NICHE_REPO_DIR/mac/.p10k.zsh"


# !!! NOTE this symbolic link no longer exists bbc of version change from .61 to .67
# !!! so i think i abandoned it since the key-bindings.zsh file is never updated anyway
# !!! theres not a big need/usefulnesss in having in in repo like there is w the other 3 above files
# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/key-bindings.zsh 
# /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh
alias editfzf="code /usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"
alias editfzfsettings="code /usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"
alias editfzfbindings="code /usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"



























# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
alias editkeyb="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editkeybtxt="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editcurrentkeyb="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editcurrentkeyboardbindings="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editcurrentkeyboardbindingstxt="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# !!! anoter broken link bc consolidation. (prob del this)
alias editoutlineofcurrenttools="code $NICHE_REPO_DIR/_universal/outline_of_current_tools.txt"


# for the CLOUD madden
alias editzzmadden06="open -e /Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.rtf"
alias editmadden06="open -e /Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.rtf"

# # for the LOCAL madden [NO LONGER NEEDED bc i got the ICLOUD one to work now]
# alias editzzmadden06_local="open -e /Users/alexking/local_docs/zzmadden06playbook_21_local.rtf"
# alias editmadden06_local="open -e /Users/alexking/local_docs/zzmadden06playbook_21_local.rtf"


# niche / more-complex aliases
# alias path='echo; tr ";" "\n" <<< "$PATH"; echo;'

alias path='echo; tr ":" "\n" <<< "$PATH"; echo;'
alias listpath='echo; tr ":" "\n" <<< "$PATH"; echo;'
alias echopath='echo; tr ":" "\n" <<< "$PATH"; echo;'
alias seepath='echo; tr ":" "\n" <<< "$PATH"; echo;'
alias printpath='echo; tr ":" "\n" <<< "$PATH"; echo;'



# alias path='echo'

alias cwd='pwd | pbcopy'
# alias pwd='pwd | pbcopy'  # NOT SURE ABOUT THIS ONE ...

alias editprefixnamingconventions="code $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias editprefixes="code $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias editnamingconventions="code $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias edittaxonomy="code $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias editfilenamingconventions="code $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"


#------------------------------------------------
# REMINDER: How to alias with a path that has WHITE-SPACES in it:
#------------------------------------------------
# alias editvscodekeybindings='code "/Users/alexking/Library/Application Support/Code/User"'
alias editvscodejson='code "/Users/alexking/Library/Application Support/Code/User/keybindings.json"'
alias editvscodekeyb='code "/Users/alexking/Library/Application Support/Code/User/keybindings.json"'
alias editvscodekeybindingsjson='code "/Users/alexking/Library/Application Support/Code/User/keybindings.json"'


alias editscrlaunchmainapps="code $ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias editscrlaunchmyapps="code $ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias editlaunchmainapps="code $ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias editlaunchmyapps="code $ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias editlaunchapps="code $ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"
alias editsrclaunchapps="code $ALEXSCRIPTS_DIR/scr-launch_my_main_apps.py"


alias editmorningleet="code $NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias editmorningwarmup="code $NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias editnextproblem="code $NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias editnextleet="code $NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"
alias editdoaproblem="code $NICHE_REPO_DIR/_universal/scr-leet_morning_random.py"

# #### REVERT BACK TO THESE IF _universal DIR ISNT WORKIN OUT WELL FOR MORNINGLEET SCRIPT...
# alias editmorningleet="code $NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias editmorningwarmup="code $NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias editnextproblem="code $NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias editnextleet="code $NICHE_REPO_DIR/mac/scr-leet_morning_random.py"
# alias editdoaproblem="code $NICHE_REPO_DIR/mac/scr-leet_morning_random.py"


alias editscratchpaper="code $ALEXSCRIPTS_DIR/scr-scratch_paper_area.py"
alias scratchpaper="code $ALEXSCRIPTS_DIR/scr-scratch_paper_area.py"




alias editpythonsyntax="code $NICHE_REPO_DIR/_universal/leet_python_syntaxes.py"
alias editleetpythonsyntax="code $NICHE_REPO_DIR/_universal/leet_python_syntaxes.py"


alias editkeybhtml="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editkeybvisualizer="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editkeybviz="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editshortcutsvis="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editshortcutvisualizer="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editshortcutsviz="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"
alias editkeybvis="code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html"

# code $NICHE_REPO_DIR/_universal/keyboard-shortcuts.html

# alias cdallconfigs="/Users/alexking/ALL_CONFIGS"

# ~/Library/Application Support/Code/User/keybindings.json


### Editing aliases for dev-landscape (two files: the taxonomy.json is the default (since it's the more common one we want to edit) and the html is the other one)
alias editdevlandscape="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"
alias editdevlandscapevis="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"
alias editdevlandscapeviz="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"
alias editdevtaxonomy="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"
alias editdevlandscapetaxonomy="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"
alias editdevl="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"

alias editdevltaxonomy="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"


alias editdl="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"

alias editdltaxonomy="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"


alias editdland="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"
alias editdlandtaxonomy="code $NICHE_REPO_DIR/_universal/dev_landscape/taxonomy.json"


# the 'html' editing for dev-landscape (less common but still wanted aliases for it bc i anticipate eventually we'll be editing the HTML more often as we extend the functionality etc))
alias editdevlandscapehtml="code $NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias editlandscapehtml="code $NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias editlandscapevishtml="code $NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias editlandscapevizhtml="code $NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias editdevlhtml="code $NICHE_REPO_DIR/_universal/dev_landscape/index.html"
alias editdlhtml="code $NICHE_REPO_DIR/_universal/dev_landscape/index.html"

alias editdlandlhtml="code $NICHE_REPO_DIR/_universal/dev_landscape/index.html"







################################################################
################################################################
# the 'list' aliases:   zz-     [section _ of _]  #TODO MANY MORE OF THESE 'list' ALIASES TO ADD HERE FYI
################################################################
################################################################
# TODO (if I want a nicer/colorful output for these 'list' aliases later, can use 'bat' command instead of 'head' or 'cat' command)
alias listprefixnamingconventions="head -n 30 $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias listprefixes="head -n 30 $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias listnamingconventions="head -n 30 $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias listfilenameconventions="head -n 30 $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias listnamingprefixes="head -n 30 $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias listprefixtaxonomy="head -n 30 $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias listtaxonomy="head -n 30 $REPO_DIR/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 
### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 
### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 
### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 

### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases ne







################################################################
################################################################
# the 'HELP' & 'VERSION' aliases    zz-    [section _ of _]
################################################################
################################################################
#### HELP ALIASES ####
alias helpgrep="man grep"
alias helpfind="man find"
#TODO ADD A TON MORE OF THESE
#TODO ADD A TON MORE OF THESE
#TODO ADD A TON MORE OF THESE

#### VERSION ALIASES ####
alias versionbrew="brew --version"
alias versionfzf="fzf --version"
alias versiongit="git --version"
alias versionnode="node --version"
alias versionpython="python3 --version"
alias versionzsh="zsh --version"
alias versioncode="code --version"
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...
#TODO ADD A TON MORE OF THESE AS YOU COME ACROSS THEM IN YOUR DAY-TO-DAY USAGE...











##################################################
# REMINDER: Use pyperclip python import to add the USEFUL-AF feat where the 
# the output/print/selection of a script gets copied to your clipboard for
# easy pasting with other command-line commands (bc 99% of the time you want to
# copy the output (like a path or a file name) to your clipboard so you can paste it into another command)
##################################################
# TODO 
# TODO 
# TODO 






####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
####################################################################
# 2025 COMMENTED OUT BELOW TEMPORARILY
######################################################################
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh # AMK21

# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------





# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------
# -----------------------------------------------------------------------











# /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh



################################################################################
############### FIX THIS fuzzy-finder config stuff AFTER I get the Terminal/SHortcut universal stuff done #################
################################################################################
# OPTION 1
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# OPTION 2
[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh

# TODO: these are the functions tied to each of the 3 main fzf commands (the functs are in key-bindings.zsh file)
# (ctrl + t) == edit the  __fsel()              function
# (ALT + c) == edit the   fzf-cd-widget()       function
# [this one CANNOT be edited](ctrl + r) == edit the  fzf-history-widget()  function


# if [ -x "$(command -v fzf)"  ]
# then
#     source /usr/share/fzf/key-bindings.zsh
# fi

# if [ -x "$(command -v fzf)"  ]
# then
#     source /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh
# fi

#### AFTER I DID brew upgrade, fzf was updated to 0.61.0 from 0.67.0, so I had to manually update this path here...
if [ -x "$(command -v fzf)"  ]
then
    source /usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh
fi

# TODO the below line my not be needed, just caught it from a forum 
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)



# /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh
# curr path to my fzf ==> "/Users/alexking/.fzf.zsh" which is same as "$HOME/.fzf.zsh"

####################################################################
# UNCOMMENT WHEN WANT TO USE starship prompt 
# note this starship line below applies to BOTH Alacritty AND Warp terminals, so I can go back and 
# forth between them and not have to make any changes here in the .zshrc file like I usually have to do
######################################################################
# eval "$(starship init zsh)"

####### regular oh my posh init line ... 
# eval "$(oh-my-posh init zsh)"
###### if you want to have your own config for oh my posh, then you need to use the below style of the EVAL command...
#eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jandedobbeleer.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/slimfat.omp.json)"


######### IMPORTANT ONE BELOW IS THE ONE THAT LINK MY CUSTOM CONFIG ##############
# eval "$(oh-my-posh init zsh --config /usr/local/Cellar/oh-my-posh/25.14.0/alex_posh_config/zen.toml)"


#### this is the brew path variable value fyi: "/usr/local/opt/oh-my-posh"

# ########## OR ALTERNATIVE INIT LINE/BLOCK FOR OH MY POSH..(I THINK THIS ONE IS MAINLY FOR iTerm2 ).
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh)"
# fi


# ######### OR ALTERNATIVE INIT LINE/BLOCK FOR OH MY POSH..(I THINK THIS ONE IS MAINLY FOR iTerm2 ).
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh --config /usr/local/Cellar/oh-my-posh/25.14.0/alex_posh_config/zen.toml)"
# fi
























##################################################################
# PATHS WITH STUPID WHITE SPACE CHAR IN PATH-DEF,
# FOUND SOLUTION FOR THIS!!! see 'REMINDER: How to alias with a path that has WHITE-SPACES in it:' BELOW...