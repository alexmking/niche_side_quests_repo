;= filepath: c:\alex_scripts\user_aliases_EXCESS_COMMENTS.cmd
;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here

;= ==================================================================
;= BASIC NAVIGATION & UTILITIES
;= ==================================================================
e.=explorer .
clear=cls
ls=ls
..=cd ..
cd..=cd .. ;= rem redundant with '..'
...=cd ../../../
....=cd ../../../../
.....=cd ../../../../../
.3=cd ../../../ ;= rem redundant with '...'
.4=cd ../../../../ ;= rem redundant with '....'
.5=cd ../../../../../ ;= rem redundant with '.....'
cd-=cd -

;= ==================================================================
;= CLIPBOARD UTILITIES (current directory)
;= ==================================================================
pwd=cd | clip
cpydir=cd | clip ;= rem redundant with 'pwd'
cwd=cd | clip ;= rem redundant with 'pwd'
copydir=cd | clip ;= rem redundant with 'pwd'
c=cd | clip ;= rem redundant with 'pwd'
copieddir=cd | clip ;= rem redundant with 'pwd'

;= ==================================================================
;= GIT ALIASES
;= ==================================================================
gl=git log --oneline --all --graph --decorate $*
gs=git status
gf=git fetch
gpull=git pull
gpush=git push

;= ==================================================================
;= BUILD SYSTEM ALIASES
;= ==================================================================
mc=make clean
mclean=make clean ;= rem redundant with 'mc'
makeclean=make clean ;= rem redundant with 'mc'
makecl=make clean ;= rem redundant with 'mc'
m=make
mk=make ;= rem redundant with 'm'
build=make ;= rem redundant with 'm'

;= ==================================================================
;= NAVIGATION - COMMON DIRECTORIES
;= ==================================================================
repos=cd /d D:\git\
home=cd /d C:\Users\aking\
ak=cd /d C:\alex_scripts\
cmderr=cd /d "%CMDER_ROOT%"
cdallconfigs=cd /d C:\Users\aking\ALL_CONFIGS\
cddesktop=cd /d C:\Users\aking\Desktop\
cdalexscripts=cd /d C:\alex_scripts\
cdconfig=cd /d C:\Users\aking\.config\
cdclink=cd /d C:\Users\aking\Downloads\cmder\vendor\clink
cddownloads=cd /d C:\Users\aking\Downloads\
cdaking=cd /d C:\Users\aking\
cdquickref=cd /d C:\Users\aking\quick_ref\
cdrepos=cd /d D:\git\
cdgit=cd /d D:\git\ ;= rem redundant with 'cdrepos'
cdcmder=cd /d C:\Users\aking\Downloads\cmder

;= Drive shortcuts
cdcdrive=cd /d C:\Users\aking\
cdc=cd /d C:\Users\aking\ ;= rem redundant with 'cdcdrive'
cddrive=cd /d D:\osi\
cdd=cd /d D:\osi\ ;= rem redundant with 'cddrive'
cdosi=cd /d D:\osi\ ;= rem redundant with 'cddrive'

;= ==================================================================
;= NAVIGATION - OSI ENVIRONMENT (requires %OSI% environment variable)
;= ==================================================================
cdsrc=cd /d "%OSI%"\src\
cdsrcwww=cd /d "%OSI%"\srcWWW\
cdasi=cd /d "%OSI%"\src\asi\
cdopenscada=cd /d "%OSI%"\src\openscada\
cdsdk=cd /d "%OSI%"\src\scada_sdk\
cdscadasdk=cd /d "%OSI%"\src\scada_sdk\ ;= rem redundant with 'cdsdk'
cdotsfw=cd /d "%OSI%"\src\otsfw\
cdinterface=cd /d "%OSI%"\src\scada_interface\
cdscadainterface=cd /d "%OSI%"\src\scada_interface\ ;= rem redundant with 'cdinterface'
cdtagging=cd /d "%OSI%"\src\tagging_subsystem\
cdviewpoint=cd /d "%OSI%"\src\viewpoint\
cdrc=cd /d "%OSI%"\sys\rc\
cdrcfiles=cd /d "%OSI%"\sys\rc\ ;= rem redundant with 'cdrc'
cddata=cd /d "%OSI%"\data
cddatafiles=cd /d "%OSI%"\data ;= rem redundant with 'cddata'
cddb=cd /d "%OSI%"\db
cddbfiles=cd /d "%OSI%"\db ;= rem redundant with 'cddb'
cdrel=cd /d "%OSI%"\rel
cdrelfiles=cd /d "%OSI%"\rel ;= rem redundant with 'cdrel'
cdci=cd /d "%OSI%"\ci

;= ==================================================================
;= NAVIGATION - GIT REPOSITORIES
;= ==================================================================
cdgitopenscada=cd /d D:\git\OpenSCADA\src\openscada\
cdgitsdk=cd /d D:\git\SCADA-SDK\src\scada_sdk\
cdgitscadasdk=cd /d D:\git\SCADA-SDK\src\scada_sdk\ ;= rem redundant with 'cdgitsdk'
cdgitotsfw=cd /d D:\git\OTS-Framework\src\otsfw\
cdgitinterface=cd /d D:\git\ScadaInterface\src\scada_interface\
cdgitscadainterface=cd /d D:\git\ScadaInterface\src\scada_interface\ ;= rem redundant with 'cdgitinterface'
cdgitviewpoint=cd /d D:\git\ViewPoint\src\viewpoint\
cdgittagging=cd /d D:\git\TagSubsystem\src\tagging_subsystem\
cdgitasi=cd /d D:\git\ASI\src\asi\
cds3=cd /d D:\git\s3\

;= Dotfiles repository
cdniche=cd /d D:\git\niche_side_quests_repo\
cddotfiles=cd /d D:\git\niche_side_quests_repo\ ;= rem redundant with 'cdniche'
cdsidequests=cd /d D:\git\niche_side_quests_repo\ ;= rem redundant with 'cdniche'
cdnichewin=cd /d D:\git\niche_side_quests_repo\win\
cddotfileswin=cd /d D:\git\niche_side_quests_repo\win\ ;= rem redundant with 'cdnichewin'
cduniversal=cd /d D:\git\niche_side_quests_repo\_universal

;= ==================================================================
;= SYSTEM UTILITIES
;= ==================================================================
vi=vim $*
unalias=alias /d $1
pwsh=%SystemRoot%/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%CMDER_ROOT%/vendor/profile.ps1'''"
sz=call C:\Users\aking\Downloads\cmder\config\user_aliases.cmd && echo user_aliases.cmd sourced :)
fz=fzf

;= Directory listing with hidden files
lh=dir /a
lsh=dir /a:h
show_hidden_files=dir /a ;= rem redundant with 'lh'
show_only_hidden_files=dir /a:h ;= rem redundant with 'lsh'

;= Environment variable shortcuts
echoosi=echo %OSI%
getosi=echo %OSI% ;= rem redundant with 'echoosi'
prettyprintpath=echo %PATH:;=&echo.%

;= ==================================================================
;= SCRIPT MANAGEMENT - List and Create Scripts
;= ==================================================================
list_all_my_scripts=list_all_my_scripts.py
listallmyscripts=list_all_my_scripts.py ;= rem redundant
listmyscripts=list_all_my_scripts.py ;= rem redundant
list_my_scripts=list_all_my_scripts.py ;= rem redundant
list_all_alex_scripts=list_all_my_scripts.py ;= rem redundant
listallalexscripts=list_all_my_scripts.py ;= rem redundant
get_all_my_scripts=list_all_my_scripts.py ;= rem redundant
getallmyscripts=list_all_my_scripts.py ;= rem redundant
getalexscripts=list_all_my_scripts.py ;= rem redundant
getallalexscripts=list_all_my_scripts.py ;= rem redundant
showallalexscripts=list_all_my_scripts.py ;= rem redundant
show_all_my_scripts=list_all_my_scripts.py ;= rem redundant
myscripts=list_all_my_scripts.py ;= rem redundant
my_scripts=list_all_my_scripts.py ;= rem redundant

create_new_python_script=create_new_python_script_amk.py $*
createnewpythonscript=create_new_python_script_amk.py $* ;= rem redundant
new_script=create_new_python_script_amk.py $* ;= rem redundant

;= ==================================================================
;= SCREENSHOT MANAGEMENT
;= ==================================================================
myscreenshots=open_my_screenshots_amk.py
screenshots=open_my_screenshots_amk.py ;= rem redundant
seemyscreenshots=open_my_screenshots_amk.py ;= rem redundant
openmyscreenshots=open_my_screenshots_amk.py ;= rem redundant
openscreenshots=open_my_screenshots_amk.py ;= rem redundant

;= ==================================================================
;= ENVIRONMENT LISTING
;= ==================================================================
list_all_environments=list_envs_amk.py
listallenvironments=list_envs_amk.py ;= rem redundant
listallmyenvironments=list_envs_amk.py ;= rem redundant
listmyenvironments=list_envs_amk.py ;= rem redundant
showmyenvironments=list_envs_amk.py ;= rem redundant
show_my_environments=list_envs_amk.py ;= rem redundant
show_all_my_environments=list_envs_amk.py ;= rem redundant
showallmyenvironments=list_envs_amk.py ;= rem redundant
myenvironments=list_envs_amk.py ;= rem redundant
my_environments=list_envs_amk.py ;= rem redundant

;= ==================================================================
;= DRIVE INFORMATION
;= ==================================================================
getdriveinfo=get_drive_info_amk.py
get_my_drive_info=get_drive_info_amk.py ;= rem redundant
getmydriveinfo=get_drive_info_amk.py ;= rem redundant
showdrives=get_drive_info_amk.py ;= rem redundant
showdriveinfo=get_drive_info_amk.py ;= rem redundant
getspaceremaining=get_space_remaining_amk.py
showspaceremaining=get_space_remaining_amk.py ;= rem redundant

;= ==================================================================
;= TRUNK LISTINGS BY VERSION
;= ==================================================================
;= 13.1 Trunks
list131trunks=list_13.1_trunks_amk.py
listtrunks131=list_13.1_trunks_amk.py ;= rem redundant
list131rel=list_13.1_trunks_amk.py ;= rem redundant
listrel131=list_13.1_trunks_amk.py ;= rem redundant
list13trunks=list_13.1_trunks_amk.py ;= rem redundant
listtrunks13=list_13.1_trunks_amk.py ;= rem redundant

;= 12.1 Trunks
list121trunks=list_12.1_trunks_amk.py
listtrunks121=list_12.1_trunks_amk.py ;= rem redundant
list121rel=list_12.1_trunks_amk.py ;= rem redundant
listrel121=list_12.1_trunks_amk.py ;= rem redundant
list12trunks=list_12.1_trunks_amk.py ;= rem redundant
listtrunks12=list_12.1_trunks_amk.py ;= rem redundant

;= 11.3 Trunks
list113trunks=list_11.3_trunks_amk.py
listtrunks113=list_11.3_trunks_amk.py ;= rem redundant
list113rel=list_11.3_trunks_amk.py ;= rem redundant
listrel113=list_11.3_trunks_amk.py ;= rem redundant
list11trunks=list_11.3_trunks_amk.py ;= rem redundant
listtrunks11=list_11.3_trunks_amk.py ;= rem redundant

;= ==================================================================
;= SCADA UTILITIES
;= ==================================================================
get_struct_member_info=cat "%OSI%"\db\SCADA.SKM | fzf
getstructinfo=cat "%OSI%"\db\SCADA.SKM | fzf ;= rem redundant
getstructmemberinfo=cat "%OSI%"\db\SCADA.SKM | fzf ;= rem redundant

;= ==================================================================
;= CONFIGURATION FILE EDITING
;= ==================================================================
addalias=code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd
editalias=code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd ;= rem redundant
editaliases=code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd ;= rem redundant

editflex=code C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua
editprompt=code C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua ;= rem redundant

edit_config_glaze=code C:\Users\aking\.glzr\glazewm\config.yaml
editglaze=code C:\Users\aking\.glzr\glazewm\config.yaml ;= rem redundant

edit_config_ahk=code C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\king_app_switcher1.ahk
editahk=code "C:\Program Files\AutoHotkey\UX\king_app_switcher1.ahk" ;= rem redundant

editquickcompare=code D:\git\S3\utilities\s3\quick_compare.py

;= FZF Configuration
editfzfbindings=C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua
editfzf=code C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua ;= rem redundant
editfzfinputrc=code C:\Users\aking\Downloads\cmder\config\inputrc

;= Script Editing
editcreatenewpythonscript=code C:\alex_scripts\create_new_python_script_amk.py
edittemplateforpythonscripts=code C:\alex_scripts\template_to_dup_for_new_python_scripts.py
editlistdriveinfo=code C:\alex_scripts\get_drive_info_amk.py
editlistenvs=code C:\alex_scripts\list_envs_amk.py

;= Keyboard Shortcuts
editshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt
editkeybshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt ;= rem redundant
editkeybindings=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt ;= rem redundant
editkeyboardshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt ;= rem redundant
editofficialshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt ;= rem redundant
editofficialbindings=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt ;= rem redundant

;= ==================================================================
;= ALIAS AND SCRIPT SEARCH
;= ==================================================================
list_all_my_aliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf
listaliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant
listallmyaliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant
listmyaliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant
list_all_my_aliases_and_scripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant
listaliasesandscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant
listaliasesscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant
listallmyaliasesandscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant
listmyaliasesandscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf ;= rem redundant

;= ==================================================================
;= PATH UTILITIES
;= ==================================================================
gets3path=echo D:\git\S3\
getalexscriptspath=echo C:\alex_scripts

;= ==================================================================
;= FZF-BASED SEARCHES
;= ==================================================================
fzfenvvariables=fzf_over_all_env_variables.py | fzf
fzenvvariables=fzf_over_all_env_variables.py | fzf ;= rem redundant
fzprettyprintpath=echo %PATH:;=&echo.% | fzf
fzprintpath=print_path_variable_pretty_amk.py | fzf

;= Directory searches
fzfsubdirs=dir /s /b /ad | fzf
fzsubdirs=dir /s /b /ad | fzf ;= rem redundant
fzfdirs=dir /s /b /ad | fzf ;= rem redundant
fzdirs=dir /s /b /ad | fzf ;= rem redundant

;= File searches
fzffiles=dir /s /b /a-d | fzf
fzfiles=dir /s /b /a-d | fzf ;= rem redundant
fzfs3=dir /s /b D:\git\S3\ | fzf

;= Keyboard shortcuts search
fzfkeybshortcuts=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py
fzfkeyboardbindings=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py ;= rem redundant
fzfbindings=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py ;= rem redundant
fzfofficialkeyb=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py ;= rem redundant
fzfshortcuts=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py ;= rem redundant
fzfofficialbindings=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py ;= rem redundant

;= ==================================================================
;= AUTOHOTKEY SCRIPT EXECUTION
;= ==================================================================
cdahk=cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat & cd /d C:\Users\aking\
ahk_run_main_script=cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat & cd /d C:\Users\aking\ ;= rem redundant

;= ==================================================================
;= GREP ALIASES
;= ==================================================================
grepBETA=grep --color=auto
grepi=grep -i --color=auto
grepc=grep -c
grepv=grep -v
grepr=grep -r --color=auto
grepin=grep -in --color=auto
grepl=grep -l
grepw=grep -w --color=auto

;= Test grep commands
testgrep1=grep -rnI "%*" . | grep -v boost | grep -v comms | grep -v fep | grep -v vcxproj
testgrep2=grep -rnI "%*" .
testgrep3=grep "%*" .

;= Example grep combinations
grepall=grep -r --color=auto $*
grepfile=grep --color=auto $1 $2

;= ==================================================================
;= FINDSTR ALIASES (Windows-native grep alternative)
;= ==================================================================
find=findstr
findi=findstr /i
findc=findstr /c
findv=findstr /v
findr=findstr /s
findw=findstr /r
findl=findstr /m

;= Example findstr combinations
findall=findstr /s /i $*
findfile=findstr $1 $2

;= ==================================================================
;= GREP REFERENCE
;= ==================================================================
listgrepflags=C:\alex_scripts\list_grep_flags_amk.py
printgrepflags=C:\alex_scripts\list_grep_flags_amk.py ;= rem redundant
seegrepflags=C:\alex_scripts\list_grep_flags_amk.py ;= rem redundant
listgflags=C:\alex_scripts\list_grep_flags_amk.py ;= rem redundant

;= ==================================================================
;= GREP FLAGS REFERENCE
;= ==================================================================
;= -r  : Recursively search directories
;= -n  : Show line numbers of matches
;= -i  : Case-insensitive search
;= -v  : Invert match (show lines that do NOT match)
;= -I  : Ignore binary files
;= -l  : List only filenames with matches
;= -c  : Count the number of matching lines
;= -w  : Match whole words only
;= --color=auto : Highlight matches in color
;=
;= Most useful combination: -rnI
;= Common filter chain: | grep -v boost | grep -v comms | grep -v fep | grep -v vcxproj
;= ==================================================================



















