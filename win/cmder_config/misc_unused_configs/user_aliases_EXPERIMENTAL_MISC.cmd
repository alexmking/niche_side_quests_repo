;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
e.=explorer .
gl=git log --oneline --all --graph --decorate  $*
clear=cls
unalias=alias /d $1
repos=cd /d D:\git\
home=cd /d C:\Users\aking\
vi=vim $*
cmderr=cd /d "%CMDER_ROOT%"
pwsh=%SystemRoot%/System32/WindowsPowerShell/v1.0/powershell.exe -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%CMDER_ROOT%/vendor/profile.ps1'''"
ak=cd /d C:\alex_scripts\
ls=ls
pwd=cd | clip
cpydir=cd | clip
cwd=cd | clip
copydir=cd | clip
c=cd | clip
copieddir=cd | clip

;= rem MY GIT ALIASES (more to come...)
gs=git status
gf=git fetch
gpull=git pull
gpush=git push



;= rem think of best replacement for 'make clean' and 'make' commands from below aliases
;= rem mc & mk   ... or ... mclean & m ... or ... makeclean & make ... or ... makecl & mk etc etc...
;= rem mc & mk [THIS IS PROB THE BEST ONE SO FAR]
mc=make clean
mclean=make clean
makeclean=make clean
makecl=make clean
m=make
mk=make
build=make

;= rem MY MISC ALIASES
;= rem sz=call D:\git\niche_side_quests_repo\win\user_aliases.cmd && echo user_aliases.cmd sourced :)
sz=call C:\Users\aking\Downloads\cmder\config\user_aliases.cmd && echo user_aliases.cmd sourced :)
lh=dir /a
lsh=dir /a:h
show_hidden_files=dir /a 
show_only_hidden_files=dir /a:h
..=cd ..
cd..=cd ..
...=cd ../../../
....=cd ../../../../
.....=cd ../../../../../
.3=cd ../../../
.4=cd ../../../../
.5=cd ../../../../../
cd-=cd -
fz=fzf


;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem = SPEND 10-20 MIN determining which commands/aliases can be added to RAYCAST for quick access there...
;= rem (obviously the cd aliases are a bit tricky since they depend on current env, but the others should be easy enough to add there)
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================
;= rem ==================================================================








































;= rem ==================================================================
;= rem = RULES OF THUMB for 'prefaces' of aliases...
;= rem ==================================================================
;= rem 		cd 		== 		obvi
;= rem 		edit 	== 		edit the file in VS Code
;= rem 		fz 		== 		doing fzf over some output 
;= rem 
;= rem 		list 	== 		printing a list sep by new lines (like PATH) or etc
;= rem 		get 	== 		either returns only 1 simple thing (like a single env var) AND/OR copies it to clipboard at same time
;= rem 		cpy 	== 		?? this one is good alternative to 'get' 
;= rem
;= rem  	///////////////////////////////////////////////
;= rem  	/////////// other ones to consider ////////////
;= rem  	///////////////////////////////////////////////
;= rem 		my 		== 		??
;= rem 		sel 	== 		short for 'select'. This one is another alt/variation of 'get' and/or 'cpy'?? 
;= rem 		show 	== 		?? maybe inbetween 'list' and 'get'? such as show-drive-info ?? 
;= rem 		see 	== 		?? interchangeable with 'show' i think ??
;= rem 
;= rem 		print 	== 		?? prob not using this one bc 'see' and 'show' and 'list' are all better/shorter
;= rem 
;= rem 
;= rem 


;= rem ==================================================================
;= rem = clever idea of setting up many aliases to the SAME single script (instead of having many scripts with name variations, we have 1 script with many aliases)
;= rem ==================================================================
list_all_my_scripts=list_all_my_scripts.py
listallmyscripts=list_all_my_scripts.py
listmyscripts=list_all_my_scripts.py
list_my_scripts=list_all_my_scripts.py
list_all_alex_scripts=list_all_my_scripts.py
listallalexscripts=list_all_my_scripts.py
get_all_my_scripts=list_all_my_scripts.py
getallmyscripts=list_all_my_scripts.py
getalexscripts=list_all_my_scripts.py
getallalexscripts=list_all_my_scripts.py
showallalexscripts=list_all_my_scripts.py
show_all_my_scripts=list_all_my_scripts.py
myscripts =list_all_my_scripts.py
my_scripts =list_all_my_scripts.py

;= rem TODO ADD A KEYBOARD SHORTCUT FOR THIS (bc it makes more sense than a script, considering when you typically need a screenshot it's not terminal related at all)
myscreenshots =open_my_screenshots_amk.py
screenshots =open_my_screenshots_amk.py
seemyscreenshots =open_my_screenshots_amk.py
openmyscreenshots =open_my_screenshots_amk.py
openscreenshots =open_my_screenshots_amk.py

create_new_python_script=create_new_python_script_amk.py $*
createnewpythonscript=create_new_python_script_amk.py $*
new_script=create_new_python_script_amk.py $*
;= rem BELOW is me trying to pipe the output path to 'code' CLI so can open in vs code how I need but no such luck
;= rem new_script=create_new_python_script_amk.py $* | code $*.py 
;= rem new_script=create_new_python_script_amk.py $*

list_all_environments=list_envs_amk.py
listallenvironments=list_envs_amk.py
listallmyenvironments=list_envs_amk.py
listmyenvironments=list_envs_amk.py
showmyenvironments=list_envs_amk.py
show_my_environments=list_envs_amk.py
show_all_my_environments=list_envs_amk.py
showallmyenvironments=list_envs_amk.py
myenvironments=list_envs_amk.py
my_environments=list_envs_amk.py

getdriveinfo=get_drive_info_amk.py
get_my_drive_info=get_drive_info_amk.py
getmydriveinfo=get_drive_info_amk.py
showdrives=get_drive_info_amk.py
showdriveinfo=get_drive_info_amk.py

; = rem 13.1 TRUNKS
list131trunks=list_13.1_trunks_amk.py
listtrunks131=list_13.1_trunks_amk.py
list131rel=list_13.1_trunks_amk.py
listrel131=list_13.1_trunks_amk.py
list13trunks=list_13.1_trunks_amk.py
listtrunks13=list_13.1_trunks_amk.py
; = rem 12.1 TRUNKS
list121trunks=list_12.1_trunks_amk.py
listtrunks121=list_12.1_trunks_amk.py
list121rel=list_12.1_trunks_amk.py
listrel121=list_12.1_trunks_amk.py
list12trunks=list_12.1_trunks_amk.py
listtrunks12=list_12.1_trunks_amk.py
; = rem 11.3 TRUNKS
list113trunks=list_11.3_trunks_amk.py
listtrunks113=list_11.3_trunks_amk.py
list113rel=list_11.3_trunks_amk.py
listrel113=list_11.3_trunks_amk.py
list11trunks=list_11.3_trunks_amk.py
listtrunks11=list_11.3_trunks_amk.py



; = rem work-in-progress alias to get the struct member info from SCADA.SKM file
get_struct_member_info=cat "%OSI%"\db\SCADA.SKM | fzf 
getstructinfo=cat "%OSI%"\db\SCADA.SKM | fzf 
getstructmemberinfo=cat "%OSI%"\db\SCADA.SKM | fzf 

;= rem QUICK WAYS TO SEE ENV VARIABLE CURR VALUES 
echoosi=echo %OSI%
getosi=echo %OSI%

;= rem C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua
;= rem C:\Users\aking\Downloads\cmder\vendor\clink\flexprompt_config.lua
;= rem QUICK WAYS TO EDIT SPECIFIC CONFIGS...(notice we have 2 variations for each)


;= rem THESE WILL BE FOR WHEN WE OFFICIALLY MOVE CMDER CONFIGS TO MY DOTFILE REPO NICHESIDEQUESTS
;= rem add_alias=code D:\git\niche_side_quests_repo\win\user_aliases.cmd
;= rem addalias=code D:\git\niche_side_quests_repo\win\user_aliases.cmd
addalias=code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd
editalias=code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd
editaliases=code C:\Users\aking\Downloads\cmder\config\user_aliases.cmd



;= rem edit_config_flexprompt=code C:\Users\aking\Downloads\cmder\vendor\clink\flexprompt_config.lua
;= rem editflex=code C:\Users\aking\Downloads\cmder\vendor\clink\flexprompt_config.lua
editflex=code C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua
editprompt=code C:\Users\aking\Downloads\cmder\config\flexprompt_config.lua
edit_config_glaze=code C:\Users\aking\.glzr\glazewm\config.yaml
editglaze=code C:\Users\aking\.glzr\glazewm\config.yaml
edit_config_ahk=code C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\king_app_switcher1.ahk
;= rem editahk=code C:\alex_scripts\king_app_switcher1.ahk
;= rem editahk=code C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\king_app_switcher1.ahk
editahk=code "C:\Program Files\AutoHotkey\UX\king_app_switcher1.ahk"

editquickcompare=code D:\git\S3\utilities\s3\quick_compare.py
editglaze=code C:\Users\aking\.glzr\glazewm\config.yaml

editfzfbindings=C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua
editfzf=code C:\Users\aking\Downloads\cmder\vendor\clink\clink_gizmos\fzf.lua
editfzfinputrc=code C:\Users\aking\Downloads\cmder\config\inputrc
;= rem OLD FZF editfzf=code C:\Users\aking\Downloads\cmder\config\inputrc
;= rem OLD FZF editfzflua=code C:\Users\aking\Downloads\cmder\vendor\fzf.lua

editcreatenewpythonscript=code C:\alex_scripts\create_new_python_script_amk.py
edittemplateforpythonscripts=code C:\alex_scripts\template_to_dup_for_new_python_scripts.py
editlistdriveinfo=code C:\alex_scripts\get_drive_info_amk.py
editlistenvs=code C:\alex_scripts\list_envs_amk.py





;= rem DONE adjusting these to new git repo path
editshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt
editkeybshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt
editkeybindings=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt
editkeyboardshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt
editofficialshortcuts=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt
editofficialbindings=code D:\git\niche_side_quests_repo\_universal\current_keyboard_bindings.txt
;= rem  editshortcuts=code C:\alex_scripts\current_keyboard_bindings.txt
;= rem  editkeybshortcuts=code C:\alex_scripts\current_keyboard_bindings.txt
;= rem  editkeybindings=code C:\alex_scripts\current_keyboard_bindings.txt
;= rem  editkeyboardshortcuts=code C:\alex_scripts\current_keyboard_bindings.txt
;= rem  editofficialshortcuts=code C:\alex_scripts\current_keyboard_bindings.txt
;= rem  editofficialbindings=code C:\alex_scripts\current_keyboard_bindings.txt



;= rem editvscodekeybindingsjson=code C:\Users\aking\AppData\Roaming\Code\User\keybindings.json
;= rem C:\Users\aking\AppData\Roaming\Code\User\keybindings.json



;= rem ==================================================================
;= rem sol for when you can't remember the command AND/OR alias so can do
;= rem this fzf search over my alises within this doc AND my scripts in alex_scripts/ dir ... 
;= rem ==================================================================
list_all_my_aliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
listaliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
listallmyaliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
listmyaliases=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
list_all_my_aliases_and_scripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
listaliasesandscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
listaliasesscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
listallmyaliasesandscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 
listmyaliasesandscripts=cat C:\Users\aking\Downloads\cmder\config\user_aliases.cmd | fzf 

;= rem ||TODO:|| figure out how to do ONE fzf across the DIR list of /alex_scripts/ AND the user_aliases.cmd file CONTENTS (not just file name)
;= rem ||TODO:|| bc the above aliases for this section only search the user_aliases.cmd file, not the alex_scripts dir
;= rem ||TODO:|| QUICK_SOL1: just do an 'ls' of alex_scripts, then paste output to bottom of this file. Then my fzf over user_aliases will still be hitting the alex_Scripts files 
;= rem ||TODO:|| QUICK_SOL1: CONT... HOWEVER, we must update this list manually, so not ideal, but it's just a simple copy/paste of LS output so not too bad
;= rem ||TODO:|| QUICK_SOL1: CONT2... This way, you can find the what you need WITHOUT ever having to leave CLI, even if you don't remember the alias/script name on the spot



;= rem ==================================================================
;= rem MY 'get/cpy' ALIASES ... 
;= rem ==================================================================
gets3path= echo D:\git\S3\
getalexscriptspath = echo C:\alex_scripts
getspaceremaining=get_space_remaining_amk.py
showspaceremaining=get_space_remaining_amk.py







;= rem ==================================================================
;= rem MY CD ALIASES ... (the %OSI% ones obvi only work when have sel env first)
;= rem ==================================================================
cdsrc=cd /d "%OSI%"\src\
cdsrcwww=cd /d "%OSI%"\srcWWW\
cdasi=cd /d "%OSI%"\src\asi\
cdopenscada=cd /d "%OSI%"\src\openscada\
cdsdk=cd /d "%OSI%"\src\scada_sdk\
cdscadasdk=cd /d "%OSI%"\src\scada_sdk\
cdotsfw=cd /d "%OSI%"\src\otsfw\
cdinterface=cd /d "%OSI%"\src\scada_interface\
cdscadainterface=cd /d "%OSI%"\src\scada_interface\
cdtagging=cd /d "%OSI%"\src\tagging_subsystem\
cdviewpoint=cd /d "%OSI%"\src\viewpoint\
cdrc=cd /d "%OSI%"\sys\rc\
cdrcfiles=cd /d "%OSI%"\sys\rc\
cddata=cd /d "%OSI%"\data
cddatafiles=cd /d "%OSI%"\data
cddb=cd /d "%OSI%"\db
cddbfiles=cd /d "%OSI%"\db
cdrel=cd /d "%OSI%"\rel
cdrelfiles=cd /d "%OSI%"\rel
cdci=cd /d "%OSI%"\ci

;= rem CD aliases for GIT REPOS (1 for each main prod, just like the above local-osi cd aliases)
;= rem for these git-side ones I'm using the D:\git\TagSubsystem\src\tagging_subsystem instead of the less-useful top-level path def like this: D:\git\TagSubsystem\src\tagging_subsystem 
;= rem ||TODO:|| decide if it's better to use the D:\git\ProductName\ instead of the deeper level path I set up originally, like D:\git\TagSubsystem\src\tagging_subsystem
cdgitopenscada= cd /d D:\git\OpenSCADA\src\openscada\
cdgitsdk= cd /d D:\git\SCADA-SDK\src\scada_sdk\
cdgitscadasdk= cd /d D:\git\SCADA-SDK\src\scada_sdk\
cdgitotsfw= cd /d D:\git\OTS-Framework\src\otsfw\
cdgitinterface= cd /d D:\git\ScadaInterface\src\scada_interface\
cdgitscadainterface= cd /d D:\git\ScadaInterface\src\scada_interface\
cdgitviewpoint= cd /d D:\git\ViewPoint\src\viewpoint\
cdgittagging= cd /d D:\git\TagSubsystem\src\tagging_subsystem\
cdgitasi= cd /d D:\git\ASI\src\asi\
cds3=cd /d D:\git\s3\
;= rem REMINDER that I made two sep aliases (see above 'cdgit' alias section) for the git repos of scada interface and scada sdk (1 that uses the prefix 'scada' and 1 that does not, so no matter what I can get there asap whether I included the scada part or not)
cdallconfigs=cd /d C:\Users\aking\ALL_CONFIGS\
cddesktop=cd /d C:\Users\aking\Desktop\
cdosi=cd /d D:\osi\
cdalexscripts=cd /d C:\alex_scripts\
cdconfig=cd /d C:\Users\aking\.config\
cdcdrive=cd /d C:\Users\aking\
cdc=cd /d C:\Users\aking\
cddrive=cd /d D:\osi\
cdd=cd /d D:\osi\
cdclink =cd /d C:\Users\aking\Downloads\cmder\vendor\clink
cddownloads=cd /d C:\Users\aking\Downloads\
cdaking=cd /d C:\Users\aking\
cdquickref=cd /d C:\Users\aking\quick_ref\
cdrepos=cd /d D:\git\
cdgit=cd /d D:\git\
cdcmder=cd /d C:\Users\aking\Downloads\cmder
prettyprintpath=echo %PATH:;=&echo.% 

cdniche=cd /d D:\git\niche_side_quests_repo\
cddotfiles=cd /d D:\git\niche_side_quests_repo\
cdsidequests=cd /d D:\git\niche_side_quests_repo\

cdnichewin=cd /d D:\git\niche_side_quests_repo\win\
cddotfileswin=cd /d D:\git\niche_side_quests_repo\win\
cduniversal=cd /d D:\git\niche_side_quests_repo\_universal



;= rem fzfenvvariables=fzf_over_all_env_variables.py | fzf --preview 'echo {}' --preview-window=up:30% --bind 'enter:execute(echo {} | clip)'


;= rem ==================================================================
;= rem =FZF-based aliases [all of these should be prefixed with a 'fz', just like 'cd' and 'edit' aliases]
;= rem ==================================================================
fzfenvvariables=fzf_over_all_env_variables.py | fzf
fzenvvariables=fzf_over_all_env_variables.py | fzf
fzprettyprintpath=echo %PATH:;=&echo.% | fzf 
fzprintpath=print_path_variable_pretty_amk.py | fzf
;= REM Alias for fzf command to recursively search for only ***subdirectories*** (not files)
fzfsubdirs=dir /s /b /ad | fzf
fzsubdirs=dir /s /b /ad | fzf
fzfdirs=dir /s /b /ad | fzf
fzdirs=dir /s /b /ad | fzf
;= REM Alias for fzf command to recursively search for only ***FILES*** (not subdirs like the above fzfsubdirs command)
fzffiles=dir /s /b /a-d | fzf
fzfiles=dir /s /b /a-d | fzf
fzfs3=dir /s /b D:\git\S3\ | fzf
fzfkeybshortcuts=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py
fzfkeyboardbindings=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py
fzfbindings=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py
fzfofficialkeyb=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py
fzfshortcuts=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py
fzfofficialbindings=C:\alex_scripts\fzf_keyboard_shortcuts_amk.py


;= rem fzf command to recursively search for only subdirectories (not files)
;= rem  fzfsubdirs=dir /s /b /ad | fzf --preview 'echo {}' --preview-window=up:30% --bind 'enter:execute(echo {} | clip)'
;= rem fzfsubdirs=dir /s /b /ad | fzf --preview 'echo {}' --preview-window=up:30% --bind 'enter:execute(echo {})














;= rem ==================================================================
;= rem *****UPDATE***** I made a script to do this instead (get_drive_info_amk.py)
;= rem =display specs of all DRIVES (C and D drives in this case) [ONLY PROB IS THE CONVERSION FROM BYTES TO GBs needs a workaround in cmd.exe]
;= rem TODO suggestion: simplifiy this command to only return/print the one drives 'free space' val (Which will bein bytes) and then pipe that to some other script/etc that will convert it to GBs
;= rem UPDATE!! I made a script to do this instead (get_drive_info_amk.py)
;= rem ==================================================================
;= rem for /f "skip=1 tokens=1,2,3" %a in ('wmic logicaldisk get name^,size^,freespace') do @if not "%a"=="" @echo Drive %a - Total: %c bytes (%=c/1073741824 GB), Free: %b bytes (%=b/1073741824 GB)^C

;= rem ==================================================================
;= rem =trying to be able2 launch my ahk app-switcher script from CLI
;= rem ==================================================================
;= rem below is the good enough for now, the only slight downside is that it returns us to HOME cd instead of the original dir we were in when we ran the command
cdahk= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat & cd /d C:\Users\aking\
ahk_run_main_script= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat & cd /d C:\Users\aking\


;= rem ============== BELOW IS EXPERIMENTAL versions of ahk script from cli ======================
;= rem ============== BELOW IS EXPERIMENTAL versions of ahk script from cli ======================
;= rem cdahk1= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\
;= rem cdahk2= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat
;= rem ;= rem FOR SOME REASON I'm unable to get the 'cd -' command to work, it just keeps erroring about unable to find path
;= rem cdahk3= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat & cd -
;= rem cdahk4= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & cd -
;= rem cdahk5= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & cd /d -
;= rem cdahk6= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & cd /d -
;= rem ;= rem it DOES WORK when it's the FIRST/only command, as opposed to being &'d with another cd (which i think is what is causing the 'unalbe to find path' error, in that, cding somewhere BEFORE the cd - cmd within the same single line command prob causing issues) I'm unable to get the 'cd -' command to work, it just keeps erroring about unable to find path
;= rem cdahk7= cd -
;= rem cdahk8= /d cd -
;= rem ;= rem cdahk2=cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat
;= rem cdahk9= cd /d C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\ & run_my_ahk_script.bat & cd /d C:\Users\aking\

;= rem ==================================================================
;= rem GREP ALIASES
;= rem ==================================================================
;= rem TODO: add this ignore-file-types snippet to all grep aliases below from richard: | grep -v boost | grep -v comms | grep -v fep | grep -v vcxproj
grepBETA=grep --color=auto  ;= rem Runs `grep` with color highlighting.
grepi=grep -i --color=auto  ;= rem Case-insensitive `grep` with color highlighting.
grepc=grep -c  ;= rem Counts the number of matching lines.
grepv=grep -v  ;= rem Inverts the match (excludes lines with the pattern).
grepr=grep -r --color=auto  ;= rem Recursively searches directories with `grep`.
grepin=grep -in --color=auto  ;= rem Case-insensitive recursive search with line numbers.
grepl=grep -l  ;= rem Displays only filenames with matches.
grepw=grep -w --color=auto  ;= rem Matches whole words only.

testgrep1=grep -rnI "%*" . | grep -v boost | grep -v comms | grep -v fep | grep -v vcxproj
testgrep2=grep -rnI "%*" .
;= rem testgrep2=grep -I "%*" . -r | grep -v boost | grep -v comms | grep -v fep | grep -v vcxproj
;= rem testgrep2=grep -I "%*" .

testgrep3=grep "%*" .

;= rem FINDSTR ALIASES (Windows-native grep-like tool)
find=findstr  ;= rem Basic `findstr` command.
findi=findstr /i  ;= rem Case-insensitive search.
findc=findstr /c  ;= rem Searches for an exact string.
findv=findstr /v  ;= rem Excludes lines with the pattern.
findr=findstr /s  ;= rem Recursive search in directories.
findw=findstr /r  ;= rem Uses regular expressions.
findl=findstr /m  ;= rem Displays only filenames with matches.

;= rem ==================================================================
;= rem EXAMPLES
;= rem ==================================================================
grepall=grep -r --color=auto $*  ;= rem Searches for a string recursively in all files in the current directory.
findall=findstr /s /i $*  ;= rem Windows-native recursive search for a string.
grepfile=grep --color=auto $1 $2  ;= rem Searches for a string in a specific file.
findfile=findstr $1 $2  ;= rem Windows-native search for a string in a specific file.



;= rem ==================================================================
;= rem ALIASES TO LIST/PRINT/SEE ALL GREP FLAGS VIA A SCRIPT
listgrepflags=C:\alex_scripts\list_grep_flags_amk.py
printgrepflags=C:\alex_scripts\list_grep_flags_amk.py
seegrepflags=C:\alex_scripts\list_grep_flags_amk.py
listgflags=C:\alex_scripts\list_grep_flags_amk.py



;= rem ==================================================================
;= rem brief expl of all the grep flags, roughly sorted by most useful to least useful
;= rem ==================================================================
;= rem  -r  :   Recursively search directories.
;= rem  -n  :   Show line numbers of matches.
;= rem  -i  :   Case-insensitive search.
;= rem  -v  :   Invert match (show lines that do NOT match).
;= rem  -I  :   Ignore binary files.
;= rem  -l  :   List only filenames with matches.
;= rem  -c  :   Count the number of matching lines.
;= rem  -w  :   Match whole words only.
;= rem  --color=auto :   Highlight matches in color (if output is to a terminal).
;= rem ==================================================================
;= rem my top flag(s) combos:
;= rem ==================================================================
;= rem  -rnI  :   Recursive, show line numbers, ignore binary files.
;= rem  | grep -v boost | grep -v comms | grep -v fep | grep -v vcxproj
;= rem ==================================================================



















