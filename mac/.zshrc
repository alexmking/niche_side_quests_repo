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




##################################################
# REMINDER: MACs root vs home dir 
#     /     means start at ROOT dir 
#     ~/    means start at HOME dir (NOT root)
##################################################
# misc aliases
alias repos="cd /Users/alexking/local_docs/GIT_STUFF"
alias cdrepos="cd /Users/alexking/local_docs/GIT_STUFF"
alias go="cd /Users/alexking"
alias golocal="cd /Users/alexking/local_docs"
alias explorer="open ."
alias e.="open ."
alias add_alias="code ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
alias addalias="code ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
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


# clean up/standardize these ls aliases later...
alias lsall="ls -a"
alias show_hidden="ls -a"
alias lsonlyhidden="ls -ad .*"
alias lswithhidden="ls -a"
alias lsh="ls -a"
alias lsnorm="ls"
alias lsregular="ls"
alias lsdefault="ls"
alias lsnohidden="ls"


# some git aliases: (NOTE 'gf' is already working but not sure what the actual command is that it's tied to bc it's not defined here...)
alias gst="git status"
alias gs="git status"
alias gfetch="git fetch"
alias gpush="git push"
alias gpull="git pull"
alias gcm="git commit -m"
alias gswitch="git switch"
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
alias sz="source ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc; echo '~/zshrc sourced :)'"
alias sourcezshrc="source ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc; echo '~/zshrc sourced :)'"


# alias path='echo; tr ";" "\n" <<< "$PATH"; echo;'

# the 'cd' aliases
alias cdconfigdot="cd /Users/alexking/.config"
alias cdhome="cd /Users/alexking/"
alias home="cd /Users/alexking"
alias cdak="cd /Users/alexking"
alias cdalex="cd /Users/alexking"
alias cdalexking="cd /Users/alexking"

alias cdalexscripts="cd /usr/local/bin/alexScripts"
alias cdallconfigs="/Users/alexking/ALL_CONFIGS"
alias cdapps="/Applications"
alias cdapp="/Applications"
alias cdapplications="/Applications"
alias cddownloads="/Users/alexking/Downloads"
alias cdquickref="/Users/alexking/quick_ref"

alias cddesktop="cd /Users/alexking/Desktop"
alias cdleet="cd /Users/alexking/Desktop/LEET"
alias cdlocaldocs="cd /Users/alexking/local_docs"
alias cdlocal="cd /Users/alexking/local_docs"

alias cddotfiles="cd /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo"
alias cdnichesidequest="cd /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo"
alias cdnicherepo="cd /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo"
alias cdsidequestrepo="cd /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo"
alias cdsidequest="cd /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo"
alias cdniche="cd /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo"




##############################################################################################
# the SEARCH aliases #########################################################################
##############################################################################################
# BEST-USECASE: when you forget a shortcut/alias on command-line and instead of having to
# to leave terminal to open the file -> search then go back to terminal, you can simply 
# run ones of these fzf aliases for the file and instantly find that command without ever 
# having to leave terminal
alias fzfaliases="cat /Users/alexking/.zshrc | fzf"
alias fzfalias="cat /Users/alexking/.zshrc | fzf"
alias fzfcurrentkeyboardbindings="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt | fzf"
alias fzfkeyboardbindings="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt | fzf"
alias fzfbindings="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt | fzf"
alias fzfkeyboard="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt | fzf"
alias fzfkeyb="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt | fzf"
alias fzfkb="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt | fzf"
alias fzfshortcuts="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt | fzf"

alias fzfaero="cat /Users/alexking/.config/aerospace/aerospace.toml | fzf"
alias fzfohmyzsh="cat ~/.oh-my-zsh | fzf"
alias fzfzshconfig="cat ~/.zshrc | fzf"
alias fzfeditzsh="cat ~/.zshrc | fzf"
alias fzfp10kconfig="cat ~/.p10k.zsh | fzf"
alias fzfeditp10k="cat ~/.p10k.zsh | fzf"
alias fzfeditprompt="cat ~/.p10k.zsh | fzf"


alias fzfprefixnamingconventions="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt | fzf"
alias fzfprefixes="cat /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt | fzf"

##############################################################################################
# DONT FORGET TO USE THE ABOVE search/fzf commands!! #########################################
##############################################################################################










###########################
# the 'edit' aliases
###########################

# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml
# ~/.config/aerospace/aerospace.toml
alias editaero="code ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"

# ????
alias editohmyzsh="code ~/.oh-my-zsh"
alias ohmyzsh="code ~/.oh-my-zsh"

# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc
# ~/.zshrc
alias zshconfig="code ~/.zshrc"
alias editzsh="code ~/.zshrc"

# ln -s 
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh
# ~/.p10k.zsh
alias p10kconfig="code ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"
alias editp10k="code ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"
alias editprompt="code ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"

# ln -s
# ~/local_docs/GIT_STUFF/niche_side_quests_repo/mac/key-bindings.zsh 
# /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh
alias editfzf="code /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh"
alias editfzfsettings="code /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh"
alias editfzfbindings="code /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh"

# alias editkeyb="code /usr/local/bin/alexScripts/current_keyboard_bindings.txt"
# alias editkeybtxt="code /usr/local/bin/alexScripts/current_keyboard_bindings.txt"
# alias editcurrentkeyb="code /usr/local/bin/alexScripts/current_keyboard_bindings.txt"
# alias editcurrentkeyboardbindings="code /usr/local/bin/alexScripts/current_keyboard_bindings.txt"
# alias editcurrentkeyboardbindingstxt="code /usr/local/bin/alexScripts/current_keyboard_bindings.txt"
alias editkeyb="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt"
alias editkeybtxt="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt"
alias editcurrentkeyb="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt"
alias editcurrentkeyboardbindings="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt"
alias editcurrentkeyboardbindingstxt="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/current_keyboard_bindings.txt"



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



# alias path='echo'

alias cwd='pwd | pbcopy'
# alias pwd='pwd | pbcopy'  # NOT SURE ABOUT THIS ONE ...

alias editprefixnamingconventions="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias editprefixes="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias editnamingconventions="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias edittaxonomy="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"
alias editfilenamingconventions="code /Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/prefix_naming_conventions.txt"



##################################################
# REMINDER: How to alias with a path that has WHITE-SPACES in it:
##################################################
# alias editvscodekeybindings='code "/Users/alexking/Library/Application Support/Code/User"'
alias editvscodejson='code "/Users/alexking/Library/Application Support/Code/User/keybindings.json"'
alias editvscodekeyb='code "/Users/alexking/Library/Application Support/Code/User/keybindings.json"'
alias editvscodekeybindingsjson='code "/Users/alexking/Library/Application Support/Code/User/keybindings.json"'




# alias cdallconfigs="/Users/alexking/ALL_CONFIGS"

# ~/Library/Application Support/Code/User/keybindings.json





##################################################
# LIST aliases (aka print out to terminal) ### TODO ### TODO ### TODO ### TODO MANY TO ADD HERE TO MIRROR WINDOWS SIDE 
# LIST aliases (aka print out to terminal) ### TODO ### TODO ### TODO ### TODO
# LIST aliases (aka print out to terminal) ### TODO ### TODO ### TODO ### TODO
# LIST aliases (aka print out to terminal) ### TODO ### TODO ### TODO ### TODO
# LIST aliases (aka print out to terminal) ### TODO ### TODO ### TODO ### TODO
##################################################
alias listprefixnamingconventions="/usr/local/bin/alexScripts/scr_list_prefix_naming_conventions.py"
alias listprefixes="/usr/local/bin/alexScripts/scr_list_prefix_naming_conventions.py"
alias listnamingconventions="/usr/local/bin/alexScripts/scr_list_prefix_naming_conventions.py"
alias listfilenameconventions="/usr/local/bin/alexScripts/scr_list_prefix_naming_conventions.py"
alias listnamingprefixes="/usr/local/bin/alexScripts/scr_list_prefix_naming_conventions.py"
alias listprefixtaxonomy="/usr/local/bin/alexScripts/scr_list_prefix_naming_conventions.py"
alias listtaxonomy="/usr/local/bin/alexScripts/scr_list_prefix_naming_conventions.py"

### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 
### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 
### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 
### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases need 




### TODO but FIRST I NEED TO CREATE THE ACTUAL SCRIPTS THEMSELVES WHICH THESE 'list' aliases ne















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

if [ -x "$(command -v fzf)"  ]
then
    source /usr/local/Cellar/fzf/0.61.0/shell/key-bindings.zsh
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