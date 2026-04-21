#Requires AutoHotkey v2.0
#SingleInstance Force

;*##############################
;*# THE SECTIONS OF THIS DOC: search for '   zz-  or -zz  '
;*##############################
;#      1. INITIAL GLOBAL VARIABLES/PATHS           (plus USEFUL REF STUFF (like LEGEND))
;#      x. APP-SPECIFIC COMMANDS                    (like when CHROME is active window...then certain hotkeys do certain things)
;#      2. Fn ROW COMMANDS for app-switching        (most imp obvi)
;#      3. Alt + Z COMMAND (zzshortcuts)            [designated SPECIAL as it's own group section here]
;#      4. Alt + Numpad COMMANDS & (ALT + QWER)     (GLOBAL moving windows 3x3)
;#      5. Alt + Shift + Numpad COMMANDS            (GLOBAL-MISC commands (like VolUp/EmojiPanel etc)
;#      6. Ctrl + Numpad COMMANDS                   (app-specific 9 commands) ;![***NOT CREATED YET***] MAY ACTUALLY MOVE THIS ONE AND INSTEAD HAVE IT BE ONE OF THE groups of commands within the MISC SECTION
;#      7. Other/Misc COMMANDS                      (like Alt + Char or Alt + Shift + char)
;#      8. EVERYTHING-ELSE: COMMANDS/IDEAS-STILL-IN-THE-WORKS/ CHERRY-ON-TOP-CATEGORY

;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
; cmd (Admin)
; ahk_class VirtualConsoleClass
; ahk_exe ConEmu64.exe
; ahk_pid 16820
; ahk_id 397062
; TODO TODO! !# TODO

; MAKE A NEW SECTION THAT DOES ...
; if activeWindow == Cmder {
; Ctrl + D:: Send Ctrl + X
; }
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################

; SetTitleMatchMode 1
; #HotIf WinActive("ahk_exe ConEmu64.exe")

; SetTitleMatchMode 3
; #HotIf WinActive("ahk_exe ConEmu64.exe")
;     ; #HotIf WinActive("ahk_exe Cmder.exe")

;     ^d::
;     {

;         Send("^x")
;         MsgBox "in cmder"

;     }

; #HotIf

; -zz-
;*####################################################################################################
;*####################################################################################################
;*# SECTION 1: INITIAL GLOBAL VARIABLES/PATHS:
;*####################################################################################################
;*####################################################################################################
DetectHiddenWindows(1)

bottomMargin := A_ScreenHeight / 24
topMargin := A_ScreenHeight / 30
leftAndRightMargin := A_ScreenWidth / 160

file_expl := 'explorer.exe'
cmder := 'C:\Users\aking\Downloads\cmder\vendor\conemu-maximus5\ConEmu64.exe'
chrome := 'chrome.exe'
; vs_code := "C:\Program Files\Microsoft VS Code\Code.exe"
vs_code := "C:\Users\aking\AppData\Local\Programs\Microsoft VS Code\Code.exe"
visual_studio_17 := "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe"
visual_studio_22 := "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
trello := 'Trello.exe'
; trello_full_path := 'C:\Program Files\WindowsApps\45273LiamForsyth.PawsforTrello_2.15.7.0_x64__7pb5ddty8z1pa\app\Trello.exe'
trello_full_path :=
    'C:\Program Files\WindowsApps\45273LiamForsyth.PawsforTrello_2.15.13.0_x64__7pb5ddty8z1pa\app\Trello.exe'
excel_gen := 'EXCEL.EXE'
; TEAMS path broken so this is just placeholder for now
; teams := 'C:\Program Files\WindowsApps\MSTeams_25072.1611.3570.1995_x64__8wekyb3d8bbwe\ms-teams.exe'
teams := "C:\Program Files\WindowsApps\MSTeams_25255.703.3978.7153_x64__8wekyb3d8bbwe\ms-teams.exe"
github_desktop := "C:\Users\aking\AppData\Local\GitHubDesktop\app-3.5.6\GitHubDesktop.exe"
notepad_plus_plus := "C:\Program Files (x86)\Notepad++\notepad++.exe"
outlook := "OUTLOOK.EXE"


ZZSHORTCUTS_PATH := "C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm"
REF_SHEET2025_PATH := "C:\Users\aking\amk\notes\quick_ref\ref_sheet2025.xlsx"
QUICK_REF_DIR := "C:\Users\aking\amk\notes\quick_ref\"
ALEX_SCRIPTS_DIR := "C:\Users\aking\amk\tools\alex_scripts\"

RUN_ZZSHORTCUTS := "C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm - Excel"
; RUN_ZZSHORTCUTS_EXPLICIT := "excel.exe C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm - Excel"
RUN_ZZSHORTCUTS_EXPLICIT := "excel.exe C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm"


zzshortcuts := "zzshortcuts.xlsm - Excel" ; this is the one we want for the WINEXISTS() and WINACTIVATE() functions...


RUN_REF_SHEET2025 := "excel.exe C:\Users\aking\amk\notes\quick_ref\ref_sheet2025.xlsx - Excel"
; RUN_REF_SHEET2025_EXPLICIT := "excel.exe C:\Users\aking\amk\notes\quick_ref\ref_sheet2025.xlsx - Excel"
RUN_REF_SHEET2025_EXPLICIT := "excel.exe C:\Users\aking\amk\notes\quick_ref\ref_sheet2025.xlsx"


ref_sheet2025 := "ref_sheet2025.xlsx - Excel" ; this is the one we want for the WINEXISTS() and WINACTIVATE() functions...

; Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")


; king_app_switcher1.ahk - Visual Studio Code
; ahk_class Chrome_WidgetWin_1
; ahk_exe Code.exe
; ahk_pid 17096
; ahk_id 460748

; src - Microsoft Visual Studio (Administrator)
; ahk_class HwndWrapper[DefaultDomain;;b0d1eef8-e407-4443-8b2a-df2de2c945ee]
; ahk_exe devenv.exe
; ahk_pid 39172
; ahk_id 1247546

; ====================================================================
; REMEMBER to check if there's a space between ahk_exe and the path (it was debugging hell b4 realizing this bull)
; ====================================================================
winTitle_file_expl := 'ahk_exe' file_expl
winTitle_chrome := 'ahk_exe' chrome
winTitle_vs_code := 'ahk_exe ' vs_code
winTitle_visual_studio_17 := 'ahk_exe ' visual_studio_17
winTitle_visual_studio_22 := 'ahk_exe ' visual_studio_22
winTitle_cmder := 'ahk_exe ' cmder
winTitle_trello := 'ahk_exe ' trello
winTitle_excel_gen := 'ahk_exe' excel_gen
winTitle_github_desktop := 'ahk_exe ' github_desktop
winTitle_notepad_plus_plus := 'ahk_exe ' notepad_plus_plus
winTitle_outlook := 'ahk_exe ' outlook

; explorer_class_string := "ahk_class CabinetWClass" ; THIS ONE CONFIRMED TO WORK w winWait() and winExist()

; Variable to track current explorer window index for cycling
current_explorer_index := 0

; Variable to track current chrome window index for cycling
current_chrome_index := 0
; chrome_class_string := "ahk_exe chrome.exe" ; Chrome window identifier(TOO BORAD 4 giddenwindows)
; chrome_class_string := "ahk_class Chrome_WidgetWin_1" ; Chrome window identifier


; Variable to track current editor window index for cycling
current_editor_index := 0
; Editor/IDE window identifiers
; vscode_class_string := "ahk_exe Code.exe"           ; VS Code
; vs2017_class_string := "ahk_exe devenv.exe"         ; Visual Studio 2017/2022 (same exe name)
; vs2022_class_string := "ahk_exe devenv.exe"         ; Visual Studio 2017/2022 (same exe name)

; Variable to track current Teams window index for cycling
current_teams_index := 0

; teams_class_string := "ahk_exe ms-teams.exe"  ; Microsoft Teams window identifier
run_teams := "ms-teams.exe"

; Variable to track current Excel window index for cycling
current_excel_index := 0
; excel_class_string := "ahk_exe EXCEL.EXE"        ; Microsoft Excel window identifier
excel_class_string := "ahk_class XLMAIN"        ; Microsoft Excel window identifier
; ids := WinGetList("ref", , excel_class_string)

; Variable to track current ConEmu window index for cycling
current_conemu_index := 0
conemu_class_string := "ahk_exe ConEmu64.exe"     ; ConEmu terminal window identifier

explorer_class_string := "ahk_class CabinetWClass" ; THIS ONE CONFIRMED TO WORK w winWait() and winExist()
chrome_class_string := "ahk_class Chrome_WidgetWin_1" ; CONFIRMED WORKS FOR CHROME
teams_class_string := "ahk_class TeamsWebView"  ; CONFIRMED WORKING FOR TEAMS...Microsoft Teams window identifier
vscode_class_string := "ahk_class Chrome_WidgetWin_1" ; CONFIRMED WORKS FOR VS Code
vs2017_class_string := "ahk_exe devenv.exe"

















; =================
; TEAMS stuff below is broken so they're just placeholder for now
; =================
teams := 'C:\Program Files\WindowsApps\MSTeams_25072.1611.3570.1995_x64__8wekyb3d8bbwe\ms-teams.exe'
winTitle_teams := 'ahk_exe ' teams

; ==================================================================
; USEFUL REF STUFF
; ==================================================================

; SetTitleMatchMode 1 (MEDIUM TO MATCH) Title must start with specified text.
; SetTitleMatchMode 2 (EASIEST TO MATCH) Title must contain the specified text.
; SetTitleMatchMode 3 (HARDEST TO MATCH) Title must exactly match specified tex
; ALT-WIN-T ==> Win+2
; !#t:: Send '#{2}

; ==================
; ==== LEGEND: =====
; ==================
;=      ^ means Ctrl        ^!#x ==> Ctrl + Alt + WinKey + x
;=      + means Shift
;=      ! means Alt
;=      <# means windowKey (left windows key specifically) (we want to AVOID using this one as much as possible, aside from my 1,2,5 remaps for Finder,cmder and Teams that will get us to 100% AHK coverage across all Fn app-switching keys on the windows side :) )

; C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\
; C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\AutoHotkeyUX.exe

; (fileExpl)    [!!! BROKEN?? !!!] doesnt switch at all
; (cmder)       DONE
; (chrome)      DONE
; (vscode)      DONE
; (Teams)       [!!! BROKEN?? !!!] doesn't switch at all
; (Trello)      DONE
; (Excel_gen)   [!!! BROKEN?? !!!]: only switches when excel in same VirtDesktop
; (Excel specific Ref doc)
; (Excel specific zzShortcuts)

; cmd (Admin)
; ahk_class VirtualConsoleClass
; ahk_exe ConEmu64.exe
; ahk_pid 16820
; ahk_id 397062
; TODO TODO! !# TODO

; TITLE:    cmd (Admin)
; CLASS:    ahk_class VirtualConsoleClass
; PROCESS: ahk_exe ConEmu64.exe
; ahk_pid 26128
; ahk_id 527100

; "C:\Users\aking\Downloads\cmder\vendor\conemu-maximus5\ConEmu64.exe"

; id := WinActive('A')

; MsgBox(id)

; SetTitleMatchMode 3

; If WinActive("ahk_exe ConEmu64.exe")
; If WinActive("ahk_exe cmd (Admin)")
; If WinActive("ahk_exe C:\Users\aking\Downloads\cmder\vendor\conemu-maximus5\ConEmu64.exe")

; -zz-
;*####################################################################################################
;*####################################################################################################
;*# SECTION x: APP-SPECIFIC COMMANDS (like when CHROME is active window...then certain hotkeys do certain things):
;*####################################################################################################
;*####################################################################################################
;* NOTE this section is EQUIV to my BTT app-specific shortcuts under the top 'For All Apps' section. But we wont need NEARLY as much here on WINDOWS since we dont need to mass remap ALT <-> CTRL like we do for EVERY app on MAC side)

; =====================================
; CMDER's APP-SPECIFIC COMMANDS:
; =====================================
SetTitleMatchMode 2
#HotIf WinActive(winTitle_cmder)
{
    ; workaround so that Ctrl + D == fzfDir command in cmder...
    ^d::
    {
        Send("!c")
    }

    ; workaround so that Alt+Shift+C == copydir command/alias in cmder...(and that we keep the same Alt+Shift+c command for all copy-path commands across all apps, like vscode,finder,chrome,VisualStudio etc))
    !+c::
    {
        Send("copieddir{Enter}")
    }

    ; Setup ‘Tasks’: Settings(157)
    ; Setup ‘Tasks’: Settings(157)
    ; my attempt at preventing the stupid cmder settings shortcut (alt-opt-t) from triggering (which was being mistakenly triggered off my app-switch-to-cmder hotkey of alt-opt-t)
    ; !#t::
    ; {
    ;     ; Send('^{g}')
    ;     ; Send('^{g}')
    ;     ; Send('^{g}')
    ;     ; Send('^{g}')

    ;     ; Send('^{g}')

    ;     ; Send('^{g}')

    ;     ; Send('^{g}')

    ;     ; Send('^{g}')

    ;     ; Send('^{g}')
    ;     ; Send('{Escape}')
    ;     ; Send('{Escape}')
    ;     ; Send('{Escape}')
    ;     ; Sleep(100) ; wait a bit to avoid any sticky-key issues
    ;     ; Send('{Escape}')
    ;     ; ; KeyWait("t") ; wait for the 't' key to be released to avoid triggered cmders internal/unchangeable alt-opt-t shortcut
    ;     ; ; KeyWait("LWin") ; wait for the 'Win' key to be released to avoid any sticky-key issues
    ;     ; ; KeyWait("Alt") ; wait for the 'Alt' key to be released to avoid any sticky-key issues

    ;     ; ; Send('aaaaaaaaaaaa')
    ;     ; Send('{Escape}')
    ; }

}
#HotIf

; =====================================
; FILE-EXPLORER's APP-SPECIFIC COMMANDS:
; =====================================
#HotIf WinActive(winTitle_file_expl)
{
    ; --- AHK v2 ---
    ; alt+Shift+c => Copy selected file(s) full path(s) in fileExplorer. If no selection, copy current directory path
    !+c:: {
        try {
            win := WinGetID("ahk_class CabinetWClass")
            if !win {
                MsgBox("No File Explorer window is active.")
                return
            }
            shell := ComObject("Shell.Application")
            for window in shell.Windows {
                if window.HWND = win {
                    items := window.Document.SelectedItems
                    if items.Count > 0 {
                        paths := []
                        for item in items {
                            paths.Push(item.Path)  ; full path
                        }
                        result := ""
                        for path in paths {
                            result .= path "`r`n"
                        }
                        A_Clipboard := RTrim(result, "`r`n")
                        ToolTip("📄 Copied " items.Count " path(s) to clipboard.")
                        SetTimer(() => ToolTip(), -1000)
                    } else {
                        ; Fallback: no selection -> copy folder path
                        path := window.Document.Folder.Self.Path
                        A_Clipboard := path
                        ToolTip("📁 No selection. Copied folder path:`n" path)
                        SetTimer(() => ToolTip(), -1200)
                    }
                    return
                }
            }
            MsgBox("Couldn't access the Explorer selection.")
        } catch Error as e {
            MsgBox("Error: " e.Message)
        }
    }
}
#HotIf

; ; winTitle_file_expl

; ; --- AHK v2 ---
; ; Ctrl+Shift+C => Copy current folder path
; ^+c::{
;     try {
;         win := WinGetID("ahk_class CabinetWClass") ; File Explorer window
;         if !win {
;             MsgBox("No File Explorer window is active.")
;             return
;         }
;         shell := ComObject("Shell.Application")
;         for window in shell.Windows {
;             if window.HWND = win {
;                 path := window.Document.Folder.Self.Path
;                 A_Clipboard := path
;                 ToolTip("📁 Copied folder path:`n" path)
;                 SetTimer(() => ToolTip(), -1000)
;                 return
;             }
;         }
;         MsgBox("Couldn't resolve the folder path for the active Explorer window.")
;     } catch e {
;         MsgBox("Error: " e.Message)
;     }
; }

; =====================================
; CHROME's APP-SPECIFIC COMMANDS:
; =====================================
SetTitleMatchMode 2
#HotIf WinActive(winTitle_chrome)
{
    ; LEETCODE.COM SPECIFIC SHORTCUTS to mirror MAC sides and ensure universality in our leet sessions, whether through WINDOWS or MAC browsers
    ^[::
    {
        Send("!-")
    }

    ^]::
    {
        Send("!=")
    }

    ^!#tab::
    {

    ; MsgBox "debug test for new tab"

        Send("^#!t")

    }

}
#HotIf




























































































; -zz-fn
;*####################################################################################################
;*####################################################################################################
;*# SECTION 2: app-switching SHORTCUTS (most imp obvi): (alt-opt) modGroup (aka optHyperKey)
;*####################################################################################################
;*####################################################################################################
; TRACKING PROGRESS ON THE MULTI-INSTANCE 'repeatedly-press-to-cycle-through-windows' FEATURE:
; fileExpl ==   DONE
; cmder ==          ***TODO****
; chrome ==     DONE
; vscode ==         ***TODO****
; teams ==      DONE     
; excel ==          ***TODO***??
; any others worth enabling this feature for? ... 
; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; REMINDER: of how the "Send #{1}" type of commands kill TWO-BIRDS with ONE-STONE, so don't need any IF( ) checks and can simply put (Win+1)
; FOR FILE EXPL
; currently using roundabout approach where I use AHK to send the (WinKey+1) command instead of simply having the LogiOptions itself be the (Winkey+1)
!#f::
^!F1::
^!+F1::
{
    ; ; we want to (send WinKey + 1) command (to simulate the same thing my Logioptions is doing for F1)
    ; Send '#{1}' ; Note the original F1 code (which wasn't working well) is saved in the king_app_switcher1_SANDBOX.ahk file if we end up needing it to ref at some pt
    ; return
    DetectHiddenWindows(1)

    global current_explorer_index
    SetTitleMatchMode 2
    
    ; Get list of all File Explorer windows
    ; explorer_windows := WinGetList(explorer_class_string) ; OLD/broken
    explorer_windows := WinGetList(explorer_class_string) ; WORKS FINE AS IS (not as complex as the chrome window stuff i gues)


    ; ; print list of explorer windows for debugging
    ; for index, win in explorer_windows {
    ;     MsgBox("Explorer window " . index . ": " . win)
    ; }

    
    ; If no explorer windows exist, launch a new one
    if (explorer_windows.Length = 0) {
        MsgBox("No File Explorer window open. Launching a new one.")
        Run("explorer.exe")
        WinWait(explorer_class_string)
        current_explorer_index := 0
        return
    }
    
    ; If only one explorer window exists, just activate it
    if (explorer_windows.Length = 1) {
        ; MsgBox ("Only one File Explorer window open. Activating it.")
        WinActivate(explorer_windows[1])
        current_explorer_index := 0
        return
    }
    
    ; Multiple explorer windows exist - cycle through them
    ; Get the currently active window to ensure we switch to a different one
    current_active := WinGetID("A")
    
    current_explorer_index++
    
    ; Reset index if we've gone past the last window
    if (current_explorer_index > explorer_windows.Length) {
        current_explorer_index := 1
    }
    
    ; If the window we're about to activate is already active, move to the next one
    if (explorer_windows[current_explorer_index] = current_active) {
        current_explorer_index++
        if (current_explorer_index > explorer_windows.Length) {
            current_explorer_index := 1
        }
    }
    
    ; Activate the current window in the cycle
    try {
        WinActivate(explorer_windows[current_explorer_index])
        ; MsgBox("Switched to explorer window " . current_explorer_index . " of " . explorer_windows.Length)
    } catch {
        ; If window no longer exists, reset and try first window
        MsgBox("Explorer window no longer exists. Resetting to first window.")
        current_explorer_index := 1
        if (explorer_windows.Length > 0) {
            WinActivate(explorer_windows[current_explorer_index])
        }
    }
}


!#t::
{
    ;########################### NOTE ###################################
    ; (this block may be outdated info! this shortcut is ALSO using a HOTIF-cmder-active section to prevent the stupid cmder settings shortcut (alt-opt-t) from triggering (which was being mistakenly triggered off my app-switch-to-cmder hotkey of alt-opt-t)
    ; (this block may be outdated info! ****(This is the same HOTIF section where I defined the ALT-SHIFT-C copydir command for cmder)****
    ; (this block may be outdated info! atm it is  ****VERY_HACKY**** (how were sending ctrl-g, then 'esc' keys etc) but it seems to be working for now so just going to leave it...
    ;########################### NOTE ###################################
    ; DetectHiddenWindows(1)

    ; global current_conemu_index
    ; SetTitleMatchMode 2
    
    ; ; Get list of all ConEmu windows
    ; conemu_windows := WinGetList(conemu_class_string)
    
    ; ; If no ConEmu windows exist, launch a new one
    ; if (conemu_windows.Length = 0) {
    ;     MsgBox("No ConEmu window open. Launching ConEmu.")
    ;     Run("ConEmu64.exe")
    ;     WinWait(conemu_class_string)
    ;     current_conemu_index := 0
    ;     return
    ; }
    
    ; ; If only one ConEmu window exists, just activate it
    ; if (conemu_windows.Length = 1) {
    ;     MsgBox("Only one ConEmu window open. Activating it.")
    ;     WinActivate(conemu_windows[1])
    ;     current_conemu_index := 0
    ;     return
    ; }
    
    ; ; Multiple ConEmu windows exist - cycle through them
    ; ; Get the currently active window to ensure we switch to a different one
    ; current_active := WinGetID("A")
    
    ; current_conemu_index++
    
    ; ; Reset index if we've gone past the last window
    ; if (current_conemu_index > conemu_windows.Length) {
    ;     current_conemu_index := 1
    ; }
    
    ; ; If the window we're about to activate is already active, move to the next one
    ; if (conemu_windows[current_conemu_index] = current_active) {
    ;     current_conemu_index++
    ;     if (current_conemu_index > conemu_windows.Length) {
    ;         current_conemu_index := 1
    ;     }
    ; }
    
    ; ; Activate the current window in the cycle
    ; try {
    ;     WinActivate(conemu_windows[current_conemu_index])
    ;     ; MsgBox("Switched to ConEmu window " . current_conemu_index . " of " . conemu_windows.Length)
    ; } catch {
    ;     ; If window no longer exists, reset and try first window
    ;     MsgBox("ConEmu window no longer exists. Resetting to first window.")
    ;     current_conemu_index := 1
    ;     if (conemu_windows.Length > 0) {
    ;         WinActivate(conemu_windows[current_conemu_index])
    ;     }
    ; }


    ; ; BELOW 5 LINES IS THE PREV WORKING SHORTCUT b4 figured out multi-window stuff:
    KeyWait("t") ; wait for the 't' key to be released to avoid triggered cmders internal/unchangeable alt-opt-t shortcut
    KeyWait("LWin") ; wait for the 'Win' key to be released to avoid any sticky-key issues
    KeyWait("Alt") ; wait for the 'Alt' key to be released to avoid any sticky-key issues
    Send '#{2}' ; note I'm using the win+2 here to get around some annoying windows11/cmder/window-recognition bugs.
    return
}



; FOR CHROME
!#b::
^!F3::
^!+F3::
{
    ; MsgBox("ALT-OPT-B pressed - attempting to switch Chrome windows")
    DetectHiddenWindows(1)
    global current_chrome_index
    SetTitleMatchMode 2
    
    ; Get list of all Chrome windows
    ; chrome_class_string := "ahk_class Chrome_WidgetWin_1" ; Chrome window identifier
    ; chrome_windows := WinGetList(chrome_class_string)
    ; chrome_windows := WinGetList("Google", , chrome_class_string)
    chrome_windows := WinGetList("Google", , chrome_class_string) ; THIS ONE WORKS FOR CHROME!

    ; chrome_windows := WinGetList("Chrome", chrome_class_string)

    ; ; print how many chrome windows were found (this should help sus out if it's detecting 'invisible' windows)
    ; ; MsgBox(chrome_windows.Length . " Chrome windows found.")
    ; numWindows := chrome_windows.Length
    ; windowsList := ""
    ; for index, win in chrome_windows {
    ;     windowsList .= "Window " . index . ": " . win . "`n"
    ; }

    ; ; print full list of chrome windows and total number of windows for debugging to see what these hidden windows are (if any)
    ; MsgBox("List of Chrome windows:`n" . windowsList . "`nTotal: " . numWindows)

    ; for index, win in chrome_windows {
    ;     MsgBox("Chrome window " . index . ": " . win)
    ; }

    
    ; If no Chrome windows exist, launch a new one
    if (chrome_windows.Length = 0) {
        ; MsgBox("No Chrome window open. Launching a new one.")
        Run("chrome.exe")
        WinWait(chrome_class_string)
        current_chrome_index := 0
        return
    }
    
    ; If only one Chrome window exists, just activate it
    if (chrome_windows.Length = 1) {
        ; MsgBox("Only one Chrome window open. Activating it.")
        WinActivate(chrome_windows[1])
        current_chrome_index := 0
        return
    }
    
    ; Multiple Chrome windows exist - cycle through them
    ; Get the currently active window to ensure we switch to a different one
    current_active := WinGetID("A")
    
    current_chrome_index++

    ; MsgBox(chrome_windows.Length . " Chrome windows found. Current index: " . current_chrome_index)
    
    ; Reset index if we've gone past the last window
    if (current_chrome_index > chrome_windows.Length) {
        current_chrome_index := 1
        ; MsgBox("Resetting Chrome window index to 1.")
    }
    
    ; If the window we're about to activate is already active, move to the next one
    if (chrome_windows[current_chrome_index] = current_active) {
        current_chrome_index++
        if (current_chrome_index > chrome_windows.Length) {
            current_chrome_index := 1
        }
    }

    ; Activate the current window in the cycle
    try {
        WinActivate(chrome_windows[current_chrome_index])

    } catch {
        ; If window no longer exists, reset and try first window
        MsgBox("Chrome window no longer exists. Resetting to first window.")
        current_chrome_index := 1
        if (chrome_windows.Length > 0) {
            WinActivate(chrome_windows[current_chrome_index])
        }
    }

    ; Send '#{3}' ; Note the original F1 code (which wasn't working well) is saved in the king_app_switcher1_SANDBOX.ahk file if we end up needing it to ref at some pt
    ; return
}



; king_app_switcher1.ahk - Visual Studio Code [Administrator]
; ahk_class Chrome_WidgetWin_1
; ahk_exe Code.exe
; ahk_pid 15824
; ahk_id 2428714

; src - tlq_summary.c - Microsoft Visual Studio (Administrator)
; ahk_class HwndWrapper[DefaultDomain;;0aeec4c3-d8d7-422e-a453-d1a348b765a4]
; ahk_exe devenv.exe
; ahk_pid 16552
; ahk_id 3936262

; FALSE POSITIVE MATCH ON THE BELOW 'teams' window...

; Activity | Code Freeze Reminder | Emerson | alex.king@emerson.com | Microsoft Teams
; ahk_class TeamsWebView
; ahk_exe ms-teams.exe
; ahk_pid 36836
; ahk_id 9833506



; vscode_class_string := "ahk_class Chrome_WidgetWin_1" ; CONFIRMED WORKS FOR VS Code
; vs2017_class_string := "ahk_exe devenv.exe"

; VS_CODE || VISUALSTUDIO-17/22
; outdated info here? CURRENT BUG WHERE the VisualStudio2017/22 Functionalitt ONLY works if it's in the same WORKSPACE as VSCODE...
; So this may MEAN it's a TIMING issue? I need to give it more time to find the window instance across worksapces? IDK
!#c::
^!F4::
{
    DetectHiddenWindows(1)
    global current_editor_index
    SetTitleMatchMode 2
    
    ; Get list of all editor windows from different applications
    ; vscode_windows := WinGetList(vscode_class_string) ; OLD/BROKEN 
    ; vs_all_windows := WinGetList(vs2017_class_string) ; OLD/ BROKEN This will get both VS2017 and VS2022 since they use same exe
    
    vscode_windows := WinGetList("Code", , vscode_class_string)
    vs_all_windows := WinGetList("- Microsoft Visual Studio", , vs2017_class_string)

    ; ; ; ##### EVERYTHING NEEDED FOR VSCODE/17/22 switcher shortcut
    ; ; combine ids1 and ids2 into one list of ids to visit (since both vscode and visual studio are code editors that I want to be able to cycle through with the same shortcut, it makes sense to combine them into one list for the purposes of this visiting-each-window loop)
    ; all_editor_windows := []
    ; for index, id in vscode_windows {
    ;     all_editor_windows.Push(id)
    ; }
    ; for index, id in vs_all_windows {
    ;     all_editor_windows.Push(id)
    ; }



    ; Filter Visual Studio windows to only get main windows (not child/sub-windows)
    vs_windows := []
    for index, win in vs_all_windows {
        ; Only include windows that are main windows (have no parent and are visible)
        try {
            ; Check if window is visible and has no parent (main window characteristic)
            if (WinGetStyle(win) & 0x10000000) && (!DllCall("GetParent", "Ptr", win)) {
                ; Additional check: main VS windows usually have meaningful titles
                win_title := WinGetTitle(win)
                ; Skip windows with empty titles or system dialog titles
                if (win_title != "" && !InStr(win_title, "Microsoft Visual Studio") = 0) {
                    vs_windows.Push(win)
                }
            }
        } catch {
            ; Skip windows that cause errors when queried
            continue
        }
    }
    
    ; Combine all editor windows into a single array
    all_editor_windows := []
    
    ; Add VS Code windows
    for index, win in vscode_windows {
        all_editor_windows.Push(win)
    }
    
    ; Add Visual Studio windows
    for index, win in vs_windows {
        all_editor_windows.Push(win)
    }


    ;---------------------------------------
    ; SETUP DONE, NOW IMPL LOGIC STEPS HERE...
    ;---------------------------------------
    
    ; If no editor windows exist, launch VS Code as default
    if (all_editor_windows.Length = 0) {
        MsgBox("No editor/IDE windows open. Launching VS Code.")
        Run("code.exe")
        WinWait(vscode_class_string)
        current_editor_index := 0
        return
    }
    
    ; If only one editor window exists, just activate it
    if (all_editor_windows.Length = 1) {
        ; MsgBox("Only one editor/IDE window open. Activating it.")
        WinActivate(all_editor_windows[1])
        current_editor_index := 0
        return
    }
    
    ; Multiple editor windows exist - cycle through them
    ; Get the currently active window to ensure we switch to a different one
    current_active := WinGetID("A")
    
    current_editor_index++
    
    ; Reset index if we've gone past the last window
    if (current_editor_index > all_editor_windows.Length) {
        current_editor_index := 1
    }
    
    ; If the window we're about to activate is already active, move to the next one
    if (all_editor_windows[current_editor_index] = current_active) {
        current_editor_index++
        if (current_editor_index > all_editor_windows.Length) {
            current_editor_index := 1
        }
    }
    
    ; Activate the current window in the cycle
    try {
        WinActivate(all_editor_windows[current_editor_index])
        ; Optional: Show which window we switched to
        ; win_title := WinGetTitle(all_editor_windows[current_editor_index])
        ; MsgBox("Switched to: " . win_title)
    } catch {
        ; If window no longer exists, reset and try first window
        MsgBox("Editor window no longer exists. Resetting to first window.")
        current_editor_index := 1
        if (all_editor_windows.Length > 0) {
            WinActivate(all_editor_windows[current_editor_index])
        }
    }
}


; TEAMS
; UPDATE: went back to LogiOption straight key-shortcut instead of going through AHK bc this was buggy (like it not being able to switch if youre currently in VisualStudio 2017)
; currently using roundabout approach where I use AHK to send the (WinKey+1) command instead of simply having the LogiOptions itself be the (Winkey+1)
; BUGFIX is LIKELY JUST NEED TO ADD SOME 'WAIT' and or 'PAUSE' commands around the SEND() but idk...
;===========================================================
; TODO: DECIDE ON THE 3 DIFF SHORTCUTS FOR TEAMS HERE (A or 5, now that M was det to be too awkward/cant-reach-w-1-hand)
;============================================================
!#5::
!#a::
!#m::
^!F5::
{
    DetectHiddenWindows(1)
    global current_teams_index
    SetTitleMatchMode 2
    
    ; Mail - King, Alex [EMR/SYSS/AT/MEDI] - Outlook
    ; ahk_class Outlook Host
    ; ahk_exe olk.exe
    ; ahk_pid 2032
    ; ahk_id 393428


    ; Get list of all Teams windows
    ; teams_windows := WinGetList(teams_class_string)
    ; teams_windows := WinGetList("MEDI", , teams_class_string) ; THIS ONE WORKS FOR TEAMS!

    ; trying to get it to eclude the OUTLOOK window ...
    ; teams_windows := WinGetList("Emerson", , teams_class_string) ; THIS ONE WORKS FOR TEAMS!
    teams_windows := WinGetList("Emerson", , teams_class_string, "Drive") ; THIS ONE WORKS FOR TEAMS! (and ignores the Outlook window)

    ; If no Teams windows exist, launch a new one
    if (teams_windows.Length = 0) {
        MsgBox("No Teams window open. Launching Teams.")
        Run(run_teams)
        WinWait(teams_class_string)
        current_teams_index := 0
        return
    }
    
    ; If only one Teams window exists, just activate it
    if (teams_windows.Length = 1) {
        ; MsgBox("Only one Teams window open. Activating it.")
        WinActivate(teams_windows[1])
        current_teams_index := 0
        return
    }
    
    ; Multiple Teams windows exist - cycle through them
    ; Get the currently active window to ensure we switch to a different one
    current_active := WinGetID("A")
    
    current_teams_index++
    
    ; Reset index if we've gone past the last window
    if (current_teams_index > teams_windows.Length) {
        current_teams_index := 1
    }
    
    ; If the window we're about to activate is already active, move to the next one
    if (teams_windows[current_teams_index] = current_active) {
        current_teams_index++
        if (current_teams_index > teams_windows.Length) {
            current_teams_index := 1
        }
    }
    
    ; Activate the current window in the cycle
    try {
        WinActivate(teams_windows[current_teams_index])
        ; MsgBox("Switched to Teams window " . current_teams_index . " of " . teams_windows.Length)
    } catch {
        ; If window no longer exists, reset and try first window
        MsgBox("Teams window no longer exists. Resetting to first window.")
        current_teams_index := 1
        if (teams_windows.Length > 0) {
            WinActivate(teams_windows[current_teams_index])
        }
    }





    ; ; MsgBox "DEBUG: reading as if in the F5 hotkey for TEAMS"
    ; ; we want to (send WinKey + 5) command (to simulate the same thing my Logioptions is doing for F5)
    ; Send '#{5}' ; Note the original F1 code (which wasn't working well) is saved in the king_app_switcher1_SANDBOX.ahk file if we end up needing it to ref at some pt
    ; return
}

; TRELLO
; NOTE I'm removing the 'SHIFT' from this hotjey to avoid the dumb M365-CoPilot launch action that's for some reason designated to the ^!+F6 giant-ass hotkey
; NOTE2: I had to FURTHER devolve this down to ALT-F6 just bc stupid COPILOT is now overridding my (Alt + Ctrl + F6) command which was ALREADY meant to be avoiding the FIRST TIME COPILOT stole the global shrotcut
!#y::
!F6::
^!F6::
{
    SetTitleMatchMode 1
    ; SetTitleMatchMode 2
    ; SetTitleMatchMode 3
    Send '#{6}' ; THIS 1 LINE DOES BOTH CASES AT ONCE (since it'll open the app if not running, but if it IS-already-running, then will switch to that window)

    WinWait(winTitle_trello) ; MAYBE DONT NEED THIS?
    WinActivate(winTitle_trello) ; MAYBE DONT NEED THIS?
    WinWaitActive(winTitle_trello) ; MAYBE DONT NEED THIS?
    return
}

; %%%%%%%%%%%%%%%%%%%%%%%% TODO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; fig out how we want the two excel switching shortcuts to work since they're not like the other 
; multi-instance switching apps I just added (chrome,fileExpl,vscode etc) since we're not simply 
; checking if excel app as a whole is open, but rather if a SPECIFIC FILE is open (and if not, then we open that specific file)...so may need to add some extra logic to check for the specific file name in the window title or something like that? IDK
; and then from there we want to make sure it always tries to open the same file for its shortcut (so R should always first open Ref_sheet, while E === )
; %%%%%%%%% little update below %%%%%
; #### actually on WINDOWS here, we we can just have the same shortcut for R and E since E SHOULD be for REF BOARD on trello but bc were not using that on windows laptop, it's a FREE KEY that we can just use as another EXCEL swithcher...
; EXCEL-ref_sheet2025-speciic file (ctrl + alt) and (ctrl + alt + shift )
!#r::
!#e::
^!F7::
{
    DetectHiddenWindows(1)

    global current_excel_index
    SetTitleMatchMode 2
    
    ; Get list of all Excel windows
    ; excel_windows := WinGetList(excel_class_string)
    excel_windows := WinGetList("ref", , excel_class_string)

    ; If no Excel windows exist, launch a new one
    if (excel_windows.Length = 0) {
        MsgBox("No Excel window open. Launching Excel.")
        ; Run("excel.exe")
        ; if excel not running, then need to specify a default file to open (instead of simply opening excel w no file which just brings up the excel menu window thing)
        ; Run("excel.exe C:\Users\aking\quick_ref\ref_sheet2025.xlsx")
        Run(RUN_REF_SHEET2025_EXPLICIT)

        WinWait(excel_class_string)
        current_excel_index := 0
        return
    }
    
    ; If only one Excel window exists, just activate it
    if (excel_windows.Length = 1) {
        ; MsgBox("Only one Excel window open. Activating it.")
        WinActivate(excel_windows[1])
        current_excel_index := 0
        return
    }
    
    ; Multiple Excel windows exist - cycle through them
    ; Get the currently active window to ensure we switch to a different one
    current_active := WinGetID("A")
    
    current_excel_index++
    
    ; Reset index if we've gone past the last window
    if (current_excel_index > excel_windows.Length) {
        current_excel_index := 1
    }
    
    ; If the window we're about to activate is already active, move to the next one
    if (excel_windows[current_excel_index] = current_active) {
        current_excel_index++
        if (current_excel_index > excel_windows.Length) {
            current_excel_index := 1
        }
    }
    
    ; Activate the current window in the cycle
    try {
        WinActivate(excel_windows[current_excel_index])
        ; MsgBox("Switched to Excel window " . current_excel_index . " of " . excel_windows.Length)
    } catch {
        ; If window no longer exists, reset and try first window
        MsgBox("Excel window no longer exists. Resetting to first window.")
        current_excel_index := 1
        if (excel_windows.Length > 0) {
            WinActivate(excel_windows[current_excel_index])
        }
    }




    ; ; SetTitleMatchMode 1
    ; SetTitleMatchMode 2
    ; ; SetTitleMatchMode 3
    ; ; MsgBox "triggered ahk thing...INSIDE window-switcher-ahk logic section..."
    ; winTitle_excel_gen := "ahk_exe EXCEL.EXE"

    ; if !WinExist("ref_sheet2025.xlsx - Excel") {
    ;     Run("C:\Users\aking\quick_ref\ref_sheet2025.xlsx - Excel")
    ;     WinWait("ref_sheet2025.xlsx - Excel")
    ; }

    ; ; SOL3
    ; WinActivate("ref_sheet2025.xlsx - Excel")

    ; return
}

; EXCEL-zzshortcuts-speciic file
!#z::
^!F8::
{
    DetectHiddenWindows(1)

    global current_excel_index
    SetTitleMatchMode 2

    zzshortcuts := "zzshortcuts.xlsm - Excel"

    if !WinExist(zzshortcuts) {
        ; MsgBox "RUT ROH!!! it's reading as if NO EXCEL zzshorts is running atm"
        Run(RUN_ZZSHORTCUTS)
        ; Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")
        WinWait(zzshortcuts)
        return
    }
    else {
        ; MsgBox "it's reading as if the zzshortcuts excel file IS already open, so just activating it now"
        WinActivate(zzshortcuts)
        return
    }

    ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ; the below code is the more sophisticated multi-window-cycling code but that's not needed for this zzshortcuts shortcut 
    ; atm the below code is UNREACHABLE fyi (since the above code will suffice for now...)
    ; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    ; Get list of all Excel windows
    excel_windows := WinGetList(excel_class_string)
    
    ; If no Excel windows exist, launch a new one
    if (excel_windows.Length = 0) {
        MsgBox("No Excel window open. Launching Excel.")
        ; Run("excel.exe")
        ; if excel not running, then need to specify a default file to open (instead of simply opening excel w no file which just brings up the excel menu window thing)
        ; Run("excel.exe C:\Users\aking\quick_ref\ref_sheet2025.xlsx")
        ; Run("excel.exe C:\Users\aking\amk\notes\quick_ref\zzshortcuts.xlsm - Excel")
        Run(RUN_ZZSHORTCUTS_EXPLICIT)
        ; Run("excel.exe C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")

        WinWait(excel_class_string)
        current_excel_index := 0
        return
    }
    
    ; If only one Excel window exists, just activate it
    if (excel_windows.Length = 1) {
        ; MsgBox("Only one Excel window open. Activating it.")
        WinActivate(excel_windows[1])
        current_excel_index := 0
        return
    }
    
    ; Multiple Excel windows exist - cycle through them
    ; Get the currently active window to ensure we switch to a different one
    current_active := WinGetID("A")
    
    current_excel_index++
    
    ; Reset index if we've gone past the last window
    if (current_excel_index > excel_windows.Length) {
        current_excel_index := 1
    }
    
    ; If the window we're about to activate is already active, move to the next one
    if (excel_windows[current_excel_index] = current_active) {
        current_excel_index++
        if (current_excel_index > excel_windows.Length) {
            current_excel_index := 1
        }
    }
    
    ; Activate the current window in the cycle
    try {
        WinActivate(excel_windows[current_excel_index])
        ; MsgBox("Switched to Excel window " . current_excel_index . " of " . excel_windows.Length)
    } catch {
        ; If window no longer exists, reset and try first window
        MsgBox("Excel window no longer exists. Resetting to first window.")
        current_excel_index := 1
        if (excel_windows.Length > 0) {
            WinActivate(excel_windows[current_excel_index])
        }
    }

    ; ; SetTitleMatchMode 1
    ; SetTitleMatchMode 2
    ; ; SetTitleMatchMode 3

    ; winTitle_excel_gen := "ahk_exe EXCEL.EXE"

    ; if !WinExist("zzshortcuts.xlsm - Excel") {
    ;     Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")
    ;     WinWait("zzshortcuts.xlsm - Excel")
    ; }

    ; ; SOL3
    ; WinActivate("zzshortcuts.xlsm - Excel")
    ; return
}

; OTHERS TO ADD FOR APP-SWITCHER...
; Github Desktop, Mail/Outlook, VisualStudio(17/22?), Spotify

!#g::
{
    ; UPDATE!! may have to move this one off the win-numRow hotkeys to make room for both VS17 and VS22 (until I'm able to get my fancy 17 & 22 single-key functionality to work)
    ; github desktop...
    ; Send '#{8}'
    ; return
    ; C:\Users\aking\AppData\Local\GitHubDesktop
    ;C:\Users\aking\AppData\Local\GitHubDesktop\app-3.5.6\GitHubDesktop.exe

    ; "C:\Users\aking\AppData\Local\GitHubDesktop\app-3.5.6\GitHubDesktop.exe"

    ; "C:\Users\aking\AppData\Local\GitHubDesktop\app-3.5.6\GitHubDesktop.exe"
    ; SetTitleMatchMode 2
    ; if !WinExist(winTitle_github_desktop) {
    ;     Run(github_desktop), WinWait(winTitle_github_desktop)
    ; }
    ; return


    SetTitleMatchMode 2

    if !WinExist(winTitle_github_desktop) {
        Run(github_desktop), WinWait(winTitle_github_desktop)
    }
    WinActivate(winTitle_github_desktop)
}

!#i::
{

    ; chrome := 'chrome.exe'
    ; winTitle_chrome := 'ahk_exe' chrome

    ; outlook...
    SetTitleMatchMode 1
    ; SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    if !WinExist('ahk_exe olk.exe') {
        Run('olk.exe')
        Sleep(300) ; trying to fix error when switching to outlook when it's not already running.
        WinWait('ahk_exe olk.exe')
    }

    ; SOL3
    WinWait('ahk_exe olk.exe')
    WinActivate('ahk_exe olk.exe')
    WinWaitActive('ahk_exe olk.exe')
    return
}

!#s::
{
    ; spotify...
    SetTitleMatchMode 1
    ; SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    if !WinExist('ahk_exe Spotify.exe') {
        ; MsgBox "DEBUG: trying to run spotify exe now and it's reading as if spotify NOT already running"
        ; Run('Spotify.exe')
        Run('C:\Users\aking\AppData\Roaming\Spotify\Spotify.exe')
        Sleep(300) ; trying to fix error when switching to spotify when it's not already running.
        WinWait('ahk_exe Spotify.exe')
    }

    ; SOL3
    WinWait('ahk_exe Spotify.exe')
    WinActivate('ahk_exe Spotify.exe')
    WinWaitActive('ahk_exe Spotify.exe')
    return
}

!#v::
{

    ;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    ; TODO: Decide how to treat this 'v' shortcut now that we got 'c' shortcut working for ALL editors (vscode, vs17 and vs22)...
    ; EXAMPLE: maybe we could have 'v' be strictly for visual studio (both 17 and 22) while 'c' is for vscode? 
    ; or maybe we just retire the 'v' shortcut since we have the 'c' shortcut working well for all code editors now? IDK
        ; OPTION 1:
        ; alt-opt-c =>      cycle through windows of ALL 3 editors (VSCode, VS2017, VS2022)
        ; alt-opt-v =>      cycle through windows of Visual Studio only (VS2017, VS2022)

        ; OPTION 2:
        ; alt-opt-c =>      cycle through windows of ONLY vscode     (this would have adv of reliably switching to vscode window every time, unlike w all-3 option where the first-window it switches to could be VS17/22 windows which is not what 'c' for 'vs-CODE' is meant to represent) (small diff either way tbh, what we go with does not matter much at all)
        ; alt-opt-v =>      cycle through windows of Visual Studio only (VS2017, VS2022)

        ; OPTION 3:
        ; alt-opt-c =>      cycle through windows of ONLY vscode   
        ; alt-opt-v =>      cycle through windows of ALL 3 editors (VSCode, VS2017, VS2022)


    MsgBox "FIXME??"

    ; Send '#{7}'
    return
}

; 'exe': 'Spotify.exe',
; 'path': r'C:\Users\aking\AppData\Roaming\Spotify\Spotify.exe',
;C:\Users\aking\AppData\Roaming\Spotify\Spotify.exe

; 'exe': 'GitHubDesktop.exe',
; 'path': r'C:\Users\aking\AppData\Local\GitHubDesktop\app-3.5.4\GitHubDesktop.exe',

; 'exe': 'olk.exe',
; 'path': r'C:\Program Files\WindowsApps\Microsoft.OutlookForWindows_1.2026.105.100_x64__8wekyb3d8bbwe\olk.exe',

; C:\Program Files\WindowsApps\Microsoft.OutlookForWindows_1.2026.114.100_x64__8wekyb3d8bbwe\olk.exe

; ==================================================================
; FIRST ATTEMPT AT FANCY CHROME TAB SWITCHING AUTO on windows...(w==jira, d==codeReview? h==jira, j==jira)
; ==================================================================
; Fancy googleChrome auto to jump to the 'MYWORK' JIRA PAGE, globally (while also only creating a new tab if needed, or iOW will jump to the open tab if this page is already open in chrome)
!#w::
{
    ; TWO STEPS FOR THESE FANCY CHROME SHORTCUTS:
    ; STEP1: send the win+3 command to switch to chrome (or open it if it's not already open)
    ; STEP2 send whichever shortcut you set up within chrome shortcut extention 'jump to tab' feature

    ; Send '#{3}'

    ; Send '!+{g}'

    ; https://osii-jira.atlassian.net/jira/for-you

    ; if chrome is active window, then only send the (ALT + SHIFT + J) command to trigger the 'jump to mywork jira' chrome extension shortcut,
    ; ...but... if chrome is NOT active window, then first send WIN+3 to open or switch to chrome, and then send the (ALT + SHIFT + G) command to trigger the 'jump to mywork jira' chrome extension shortcut

    if WinActive(winTitle_chrome) {
        ; chrome is already active window, so just send the (ALT + SHIFT + CTRL + J) command to trigger the 'jump to mywork jira' chrome extension shortcut
        ; Send '!+^{j}'
        Send '!+^{F6}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W
        return
    }
    else {
        ; chrome is NOT active window, so first send WIN+3 to open or switch to chrome, and then send the (ALT + SHIFT + CTRL + J) command to trigger the 'jump to mywork jira' chrome extension shortcut
        Send '#{3}'
        Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
        WinWait(winTitle_chrome)
        ; Send '!+^{j}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-WORK url (until I get the trello-board-fancy-shortcut workin on win like they are on mac atm)
        Send '!+^{F6}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W
        
        return
    }

    ; If !WinExist(winTitle_chrome)
    ; {
    ;     Run(chrome)
    ; 	Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
    ; 	WinWait(winTitle_chrome)
    ; }

    ; ; ---------------------------------------
    ; ; TODO: ADD MORE FUNCTIONALITY HERE
    ; ; ---------------------------------------

    ; ; SOL3
    ; WinWait(winTitle_chrome)
    ; WinActivate(winTitle_chrome)
    ; WinWaitActive(winTitle_chrome)
}

; JUMP TO CODE-REVIEW URL TAB...(fancy chrome tab auto)
!#d::
{
    ; similar to the above shortcut, but for a different chrome extension shortcut that jumps to a different JIRA page (like the 'jump to mywork jira' shortcut above, but this one is for the 'jump to my backlog jira' chrome extension shortcut)
    if WinActive(winTitle_chrome) {
        ; chrome is already active window, so just send the (ALT + SHIFT + CTRL + G) command to trigger the 'jump to my backlog jira' chrome extension shortcut
        ; Send '!+^{i}' the ACTUAL shortcut setup for one of the the trello board url stuff
        ; Send '!+^{j}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W
        Send '!+^{F5}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W
        return
    }
    else {
        ; chrome is NOT active window, so first send WIN+3 to open or switch to chrome, and then send the (ALT + SHIFT + CTRL + G) command to trigger the 'jump to my backlog jira' chrome extension shortcut
        Send '#{3}'
        Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
        WinWait(winTitle_chrome)
        ; Send '!+^{j}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-WORK url (until I get the trello-board-fancy-shortcut workin on win like they are on mac atm)
        ; Send '!+^{i}' the ACTUAL shortcut setup for one of the the trello board url stuff
        Send '!+^{F5}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W

        return
    }
}

; JUMP TO CODE-REVIEW URL TAB...(fancy chrome tab auto)
!#h::
{
    ; similar to the above shortcut, but for a different chrome extension shortcut that jumps to a different JIRA page (like the 'jump to mywork jira' shortcut above, but this one is for the 'jump to my backlog jira' chrome extension shortcut)
    if WinActive(winTitle_chrome) {
        ; chrome is already active window, so just send the (ALT + SHIFT + CTRL + G) command to trigger the 'jump to my backlog jira' chrome extension shortcut
        ; Send '!+^{?}' the ACTUAL shortcut setup for one of the the trello board url stuff
        ; Send '!+^{j}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W
        Send '!+^{F6}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W

        return
    }
    else {
        ; chrome is NOT active window, so first send WIN+3 to open or switch to chrome, and then send the (ALT + SHIFT + CTRL + G) command to trigger the 'jump to my backlog jira' chrome extension shortcut
        Send '#{3}'
        Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
        WinWait(winTitle_chrome)
        ; Send '!+^{j}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-WORK url (until I get the trello-board-fancy-shortcut workin on win like they are on mac atm)
        ; Send '!+^{?}' the ACTUAL shortcut setup for one of the the trello board url stuff
        Send '!+^{F6}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W


        return
    }
}

; JUMP TO CODE-REVIEW URL TAB...(fancy chrome tab auto)
; %%%%%%% NOTE THIS ONE NEEDS TO ONLY BE alt-ctrl-j bc the chromes-internal shortcut is alt-ctrl-shift-j ... and we can't use full hyper involving alt-ctrl-shift-option-j because that auto-launches co-pilot bullsh%
; %%%%%%% NOTE THIS ONE NEEDS TO ONLY BE alt-ctrl-j bc the chromes-internal shortcut is alt-ctrl-shift-j ... and we can't use full hyper involving alt-ctrl-shift-option-j because that auto-launches co-pilot bullsh%
; %%%%%%% NOTE THIS ONE NEEDS TO ONLY BE alt-ctrl-j bc the chromes-internal shortcut is alt-ctrl-shift-j ... and we can't use full hyper involving alt-ctrl-shift-option-j because that auto-launches co-pilot bullsh%
; %%%% THE FIX FOR THIS:
; %%%% THE FIX FOR THIS:
; %%%% THE FIX FOR THIS:
; %%%% THE FIX FOR THIS: is changing the chrome-internal-shortcut to be a shortcut from the obscure shortcut groups (like Fn keys and stuff) so that way we dont have to work around this conflict involving alt-ctrl-shift-j 
!#j::
{
    ; similar to the above shortcut, but for a different chrome extension shortcut that jumps to a different JIRA page (like the 'jump to mywork jira' shortcut above, but this one is for the 'jump to my backlog jira' chrome extension shortcut)
    if WinActive(winTitle_chrome) {
        ; chrome is already active window, so just send the (ALT + SHIFT + CTRL + G) command to trigger the 'jump to my backlog jira' chrome extension shortcut
        ; Send '!+^{?}' the ACTUAL shortcut setup for one of the the trello board url stuff
        ; Send '!+^{j}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W
        Send '!+^{F6}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W

        return
    }
    else {
        ; chrome is NOT active window, so first send WIN+3 to open or switch to chrome, and then send the (ALT + SHIFT + CTRL + G) command to trigger the 'jump to my backlog jira' chrome extension shortcut
        Send '#{3}'
        Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
        WinWait(winTitle_chrome)
        ; Send '!+^{j}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-WORK url (until I get the trello-board-fancy-shortcut workin on win like they are on mac atm)
        ; Send '!+^{?}' the ACTUAL shortcut setup for one of the the trello board url stuff
        Send '!+^{F6}' ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR-W
    

        return
    }

}

; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; UPDATE!!! It seems modgroups involving OPTION aren't working so well on WINDOWS side...so avoid it when defining the chrome extension shortcuts on the windows side, and just use CTRL + SHIFT + CHAR instead of ALT + SHIFT + CTRL + CHAR for the chrome extension shortcuts that involve jumping to specific JIRA pages or whatever...since it seems like the OPTION key is the one that's really causing the issue with the chrome extension shortcuts not working on windows (even tho they work fine on MAC)
; UPDATE!!! It seems modgroups involving OPTION aren't working so well on WINDOWS side...so avoid it when defining the chrome extension shortcuts on the windows side, and just use CTRL + SHIFT + CHAR instead of ALT + SHIFT + CTRL + CHAR for the chrome extension shortcuts that involve jumping to specific JIRA pages or whatever...since it seems like the OPTION key is the one that's really causing the issue with the chrome extension shortcuts not working on windows (even tho they work fine on MAC)
; UPDATE!!! It seems modgroups involving OPTION aren't working so well on WINDOWS side...so avoid it when defining the chrome extension shortcuts on the windows side, and just use CTRL + SHIFT + CHAR instead of ALT + SHIFT + CTRL + CHAR for the chrome extension shortcuts that involve jumping to specific JIRA pages or whatever...since it seems like the OPTION key is the one that's really causing the issue with the chrome extension shortcuts not working on windows (even tho they work fine on MAC)
; UPDATE!!! It seems modgroups involving OPTION aren't working so well on WINDOWS side...so avoid it when defining the chrome extension shortcuts on the windows side, and just use CTRL + SHIFT + CHAR instead of ALT + SHIFT + CTRL + CHAR for the chrome extension shortcuts that involve jumping to specific JIRA pages or whatever...since it seems like the OPTION key is the one that's really causing the issue with the chrome extension shortcuts not working on windows (even tho they work fine on MAC)
; UPDATE!!! It seems modgroups involving OPTION aren't working so well on WINDOWS side...so avoid it when defining the chrome extension shortcuts on the windows side, and just use CTRL + SHIFT + CHAR instead of ALT + SHIFT + CTRL + CHAR for the chrome extension shortcuts that involve jumping to specific JIRA pages or whatever...since it seems like the OPTION key is the one that's really causing the issue with the chrome extension shortcuts not working on windows (even tho they work fine on MAC)
; UPDATE!!! It seems modgroups involving OPTION aren't working so well on WINDOWS side...so avoid it when defining the chrome extension shortcuts on the windows side, and just use CTRL + SHIFT + CHAR instead of ALT + SHIFT + CTRL + CHAR for the chrome extension shortcuts that involve jumping to specific JIRA pages or whatever...since it seems like the OPTION key is the one that's really causing the issue with the chrome extension shortcuts not working on windows (even tho they work fine on MAC)
;-----
; on windows, the chrome extension w 'shorts' icon may not allow as complex keyshortcuts as on MAC chrome bc ALT-SHIFt-G works fine but the complex ones like ctrl-shift-option-g are NOT working...
; on windows, the chrome extension w 'shorts' icon may not allow as complex keyshortcuts as on MAC chrome bc ALT-SHIFt-G works fine but the complex ones like ctrl-shift-option-g are NOT working...; on windows, the chrome extension w 'shorts' icon may not allow as complex keyshortcuts as on MAC chrome bc ALT-SHIFt-G works fine but the complex ones like ctrl-shift-option-g are NOT working...
; on windows, the chrome extension w 'shorts' icon may not allow as complex keyshortcuts as on MAC chrome bc ALT-SHIFt-G works fine but the complex ones like ctrl-shift-option-g are NOT working...
; on windows, the chrome extension w 'shorts' icon may not allow as complex keyshortcuts as on MAC chrome bc ALT-SHIFt-G works fine but the complex ones like ctrl-shift-option-g are NOT working...
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================
; NOTE =======================================================




; #####################################################
; ##### leet setup (small screen) #####
; #####################################################
; 1. launch this script (via hyper-L), then run morningprep script (via terminal) OR...now can prob do via Raycasts SCRIPT-COMMAND!!
; !!! TODO !!!
; TODO: try getting the morningprep script to be SCRIPT-COMMAND that can be run via Raycast so dont have to switch over to terminal after this leet SETUP auto is done and instead we can just quick trigger via HOTKEY or manual typiing without moving curr window :) 
; morningprep / leet-sesh launch/setup
; !#l::
!+^l::
{
    ; PSEUDO-CODE for this hotkey:
    ; DONE-1. switch-to or launch chrome (prob using win+3)
    ; DONE-  - trigger 'maximize' window shortcut (send Win+upArrow)
    ; 2. switch-to or launch STICKY NOTES-1 APP (not the new one)
    ; 3a. trigger our custom-window-resize shortcut via send() (still need to make this AHK window-resize shortcut in this doc as well, since I'm assuming Raycast is not robust enough w custom-window-resize YET (at least on WINDOWS-beta im using)
    ; 3b. trigger the floating-window shortcut (ALT-F) or (ALT-SH-F)
    ; optional: insert 2nd floating window logic here (switch-to/open ONE-NOTE app, then trigger the 2nd custom-window-resize shortcut via send() (which again, we still need to make this AHK window-resize shortcut in this doc as well, since I'm assuming Raycast is not robust enough w custom-window-resize YET (at least on WINDOWS-beta im using))
    ; optional: switch to terminal after everythings all set since we'll have to do that anyway to run our script 
        ; likely may have to move terminal window to bottom left BTW, otherwise our two floating windows will get in the way
    ; K.I.M!! ==> if we can find ANOTHER app that can resize to the dimensions we need for the 2nd floating window, then we can for-sure do the 2-floating-window auto like we originally wanted to (MAYBE TRY ONE-NOTE app again?)
    ; *LATER-UPGRADE1: for now we're going to ignore the 2nd floating window of sticky notes until we get the top one working properly (since the top one is the only 'definitely-need' floating window)
    ; ***LATER-UPGRADE2: make a separate hotkey just for the LARGE-MONITOR case (which obvi requires a diff window-resize-shortcut than my one meant for our laptops small screen)
    ; *****LATER-UPGRADE3: (totally optional/cherry): combine our two shortcuts into one smart-shortcut which will detect which monitor we're on and trigger the appropriate window-resize-shortcut based on that (so then we dont need two separate hotkeys for the large-monitor vs laptop-screen cases)

    if WinActive(winTitle_chrome) {
        ; chrome is already active window, so send maximize shortcut (Win+upArrow)
        Send('#{Up}')
        ; return
    }
    else {
        ; chrome is NOT active window, so first send WIN+3 to open or switch to chrome, and then send maximize shortcut (Win+upArrow)
        Send '#{3}'
        Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
        WinWait(winTitle_chrome)
        Send('#{Up}')
        ; return
    }

    ; NOW CHROME SHOULD BE OPEN and MAXIMIZED...so next we setup the first floating window which is sticky-notes-app1
    ; ---------------------------
    ; TOP FLOATING WINDOW SETUP (STICKY-NOTES-1 app):
    ; ---------------------------
    ; so now we want to switch to or launch the STICKY-NOTES-1 app (not the new one)
    Send('#{8}')
    ; wait a little bit for the sticky notes app to open and be detected by the script, otherwise the next commands will get messed up since the window won't be detected as open yet
    Sleep(500)
    ; now resize sticky to our custom resize via our ahk shortcut we setup on ALT-U
    Send('!u')
    Sleep(500)
    ; now trigger the 'float window' shortcut (ALT-F)
    Send('!f')
    Sleep(500)
    
    ; ---------------------------
    ; 2nd FLOATING WINDOW LOGIC HERE (switch-to/open TEAMS app, then trigger the 2nd custom-window-resize shortcut via send() (which again, we still need to make this AHK window-resize shortcut in this doc as well, since I'm assuming Raycast is not robust enough w custom-window-resize YET (at least on WINDOWS-beta im using))
    ; ---------------------------
    Send('#{5}') ; decided to use TEAMS instead of ONENOTE bc the window-resize shortcut works for TEAMS and not for ONENOTE for some reason, even tho it should work for both...idk if it's bc of the new vs old versions of ONENOTE or what, but either way, TEAMS is prob better to have as the 2nd floating window anyway since we can have our team chat and meeting notes and stuff in there while we're coding in the main chrome window
    ; now that we know Teams is open and active, we can trigger the custom resize shortcut for the 2nd floating window (which is ALT-SHIFT-I in my current setup)
    Sleep(500)
    Send('!i') ; resize to the dimensions for the 2nd floating window
    Sleep(500)
    ; now trigger the 'float window' shortcut (ALT-F)
    Send('!f')
    
    ; ---------------------------
    ; LESS IMP/ OPTIONAL STUFF
    ; ---------------------------
    ; INSERT LOGIC HERE...
    ; UNCOMMENT THIS AFTER EVERYTHING ABOVE IS WORKING GREAT...
    ; optional: switch to terminal after everythings all set since we'll have to do that anyway to run our script
    ; Send('#{2}')

    return
}

!#;::
{

    ; the BIG-SCREEN-VERSION of leet-setup shortcut (likely wont even need on windows here but just adding it for placeholder purposes anyway)
    if WinActive(winTitle_chrome) {
        ; chrome is already active window, so send maximize shortcut (Win+upArrow)
        Send('#{Up}')
        ; return
    }
    else {
        ; chrome is NOT active window, so first send WIN+3 to open or switch to chrome, and then send maximize shortcut (Win+upArrow)
        Send '#{3}'
        Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
        WinWait(winTitle_chrome)
        Send('#{Up}')
        ; return
    }

    ; NOW CHROME SHOULD BE OPEN and MAXIMIZED...so next we setup the first floating window which is sticky-notes-app1
    ; ---------------------------
    ; TOP FLOATING WINDOW SETUP (STICKY-NOTES-1 app):
    ; ---------------------------
    ; so now we want to switch to or launch the STICKY-NOTES-1 app (not the new one)
    Send('#{8}')
    ; wait a little bit for the sticky notes app to open and be detected by the script, otherwise the next commands will get messed up since the window won't be detected as open yet
    Sleep(500)
    ; now resize sticky to our custom resize via our ahk shortcut we setup on ALT-U
    Send('!u')
    Sleep(500)
    ; now trigger the 'float window' shortcut (ALT-F)
    Send('!f')
    Sleep(500)
    
    ; ---------------------------
    ; 2nd FLOATING WINDOW LOGIC HERE (switch-to/open TEAMS app, then trigger the 2nd custom-window-resize shortcut via send() (which again, we still need to make this AHK window-resize shortcut in this doc as well, since I'm assuming Raycast is not robust enough w custom-window-resize YET (at least on WINDOWS-beta im using))
    ; ---------------------------
    Send('#{5}') ; decided to use TEAMS instead of ONENOTE bc the window-resize shortcut works for TEAMS and not for ONENOTE for some reason, even tho it should work for both...idk if it's bc of the new vs old versions of ONENOTE or what, but either way, TEAMS is prob better to have as the 2nd floating window anyway since we can have our team chat and meeting notes and stuff in there while we're coding in the main chrome window
    ; now that we know Teams is open and active, we can trigger the custom resize shortcut for the 2nd floating window (which is ALT-SHIFT-I in my current setup)
    Sleep(500)
    Send('!i') ; resize to the dimensions for the 2nd floating window
    Sleep(500)
    ; now trigger the 'float window' shortcut (ALT-F)
    Send('!f')
    
    ; ---------------------------               
    ; LESS IMP/ OPTIONAL STUFF
    ; ---------------------------
    ; INSERT LOGIC HERE...
    ; UNCOMMENT THIS AFTER EVERYTHING ABOVE IS WORKING GREAT...
    ; optional: switch to terminal after everythings all set since we'll have to do that anyway to run our script
    ; Send('#{2}')

    return
}



; ----------------------------------------------------------------
; ----------------------------------------------------------------
; ----------------------------------------------------------------
; TEMPORARY COMMAND TO HELP DEBUG HIDDEN WINDOW DET STUFF:
; ----------------------------------------------------------------
; ----------------------------------------------------------------
; ----------------------------------------------------------------
; %%%%%%%%%%%%%%%% UPDATE: %%%%%%%%%%%%%%%%%%%%%%%%%%
;  maybe going to keep this perm bc it's actually pretty useful for debugging and checking window class names and stuff like that %%%%%%%%%%%%%%%%
; %%%%%%%%%%%%%%%% UPDATE: %%%%%%%%%%%%%%%%%%%%%%%%%%
!+b::
{
; ids := WinGetList(,, "Program Manager")
; chrome_class_string := "ahk_exe chrome.exe" ; Chrome window identifier
; chrome_class_string := "ahk_class Chrome_WidgetWin_1" ; Chrome window identifier


; ids := WinGetList("Google", , chrome_class_string) ; THIS ONE WORKS FOR CHROME!

SetTitleMatchMode 2



;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; CONFIRMED WORKING STRING DEFS ...(fileExpl, chrome, teams, vscode/VS2017/VS2022, ))
; explorer_class_string := "ahk_class CabinetWClass" ; THIS ONE CONFIRMED TO WORK w winWait() and winExist()
; chrome_class_string := "ahk_class Chrome_WidgetWin_1" ; Chrome window identifier
; teams_class_string := "ahk_class TeamsWebView"  ; CONFIRMED WORKING FOR TEAMS...Microsoft Teams window identifier
; vscode_class_string := "ahk_class Chrome_WidgetWin_1" ; CONFIRMED WORKS FOR VS Code
; vs2017_class_string := "ahk_exe devenv.exe"


;------
; ids := WinGetList(explorer_class_string) WORKS FINE AS IS (not as complex as the chrome window stuff i gues)
; ids := WinGetList("Google", , chrome_class_string) ; THIS ONE WORKS FOR CHROME!
; ids := WinGetList("MEDI", , teams_class_string) ; THIS ONE WORKS FOR TEAMS!

; ; ##### EVERYTHING NEEDED FOR VSCODE/17/22 switcher shortcut
; vs2017_class_string := "ahk_exe devenv.exe"
; SetTitleMatchMode 2
; ids1 := WinGetList("Code", , vscode_class_string)
; ids2 := WinGetList("- Microsoft Visual Studio", , vs2017_class_string)
; ; combine ids1 and ids2 into one list of ids to visit (since both vscode and visual studio are code editors that I want to be able to cycle through with the same shortcut, it makes sense to combine them into one list for the purposes of this visiting-each-window loop)
; ids := []
; for index, id in ids1 {
;     ids.Push(id)
; }
; for index, id in ids2 {
;     ids.Push(id)
; }
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


; teams_class_string := "ahk_exe ms-teams.exe"  ; Microsoft Teams window identifier
; vscode_class_string := "ahk_exe Code.exe"           ; VS Code
; vs2017_class_string := "ahk_exe devenv.exe"         ; Visual Studio 2017/2022 (same exe name)
vs2022_class_string := "ahk_exe devenv.exe"         ; Visual Studio 2017/2022 (same exe name)

excel_class_string := "ahk_exe EXCEL.EXE"        ; Microsoft Excel window identifier


; explorer_windows := WinGetList(explorer_class_string) WORKS FINE AS IS (not as complex as the chrome window stuff i gues)
; teams_windows := WinGetList(teams_class_string)
; vscode_windows := WinGetList(vscode_class_string)
; vs_all_windows := WinGetList(vs2017_class_string)  ; This will get both VS2017 and VS2022 since
; excel_windows := WinGetList(excel_class_string)

; ids := WinGetList("Emerson", , teams_class_string) ; THIS ONE WORKS FOR TEAMS!


; ids := WinGetList("Google", , chrome_class_string) ; THIS ONE WORKS FOR CHROME!
; ids := WinGetList("MEDI", , teams_class_string) ; THIS ONE WORKS FOR TEAMS!



; vs_all_windows := WinGetList(vs2017_class_string)  ; This will get both VS2017 and VS2022 since
; vs_all_windows := WinGetList(vs2017_class_string)  ; This will get both VS2017 and VS2022 since

; SetTitleMatchMode "RegEx"
; vs2017_class_string := "ahk_class HwndWrapper[DefaultDomain;;]"         ; Visual Studio 2017/2022 (same exe name)

; vs2017_class_string := "ahk_exe devenv.exe"         ; Visual Studio 2017/2022 (same exe name)
; vs2017_class_string := "ahk_class HwndWrapper"         ; Visual Studio 2017/2022 (same exe name)


; SetTitleMatchMode "RegEx"
; ; vs2017_class_string := "ahk_class HwndWrapper"         ; Visual Studio 2017/2022 (same exe name)
; vs2017_class_string := "ahk_class HwndWrapper"         ; Visual Studio 2017/2022 (same exe name)
; ; ids := WinGetList("Visual", , vs2017_class_string)
; ; ids := WinGetList("Microsoft", , vs2017_class_string)
; ids := WinGetList("Microsoft Visual Studio", , vs2017_class_string)

; src - validate.cpp - Microsoft Visual Studio (Administrator)
; ahk_class HwndWrapper[DefaultDomain;;b008144d-21b1-4d5b-bb57-20adba62a6e8]
; ahk_exe devenv.exe        PROCSS NAME:
; ahk_pid 5856
; ahk_id 1705968

; TITLE:    src - validate.cpp - Microsoft Visual Studio (Administrator)
; CLASS:    ahk_class HwndWrapper[DefaultDomain;;b008144d-21b1-4d5b-bb57-20adba62a6e8]
; PROCSS:   ahk_exe devenv.exe
; pID:      ahk_pid 5856
; ahkID:    ahk_id 1705968

; TITLE:    src - Microsoft Visual Studio 
; CLASS:    ahk_class HwndWrapper[DefaultDomain;;3831a426-ca9a-492e-a1fa-06b442968110]
; PROCSS:   ahk_exe devenv.exe
; pID:      ahk_pid 26020
; ahkID:    ahk_id 4459044


; WinGetList(WinTitle, WinText, ExcludeTitle, ExcludeText)
SetTitleMatchMode "RegEx"
SetTitleMatchMode 2
; vs2017_class_string := "ahk_class HwndWrapper"         ; Visual Studio 2017/2022 (same exe name)
; vs2017_class_string := "ahk_class HwndWrapper\[Default.*"         ; Visual Studio 2017/2022 (same exe name)
; vs2017_class_string := "ahk_class \HwndWrapper[Default.*"         ; Visual Studio 2017/2022 (same exe name)
; vs2017_class_string := "ahk_class ^HwndWrapper[Default."         ; Visual Studio 2017/2022 (same exe name)
vs2017_class_string := "ahk_exe devenv.exe"


; ids := WinGetList("Visual", , vs2017_class_string)
; ids := WinGetList("Microsoft", , vs2017_class_string)
; ids := WinGetList("- Microsoft Visual Studio", , vs2017_class_string)
; ids := WinGetList("Microsoft Visual Studio", "winText", vs2017_class_string)
; ids := WinGetList(vs2017_class_string)



; ; ##### EVERYTHING NEEDED FOR VSCODE/17/22 switcher shortcut
; vs2017_class_string := "ahk_exe devenv.exe"
; SetTitleMatchMode 2
; ids1 := WinGetList("Code", , vscode_class_string)
; ids2 := WinGetList("- Microsoft Visual Studio", , vs2017_class_string)
; ; combine ids1 and ids2 into one list of ids to visit (since both vscode and visual studio are code editors that I want to be able to cycle through with the same shortcut, it makes sense to combine them into one list for the purposes of this visiting-each-window loop)
; ids := []
; for index, id in ids1 {
;     ids.Push(id)
; }
; for index, id in ids2 {
;     ids.Push(id)
; }



; ; THIS GROUP OF 3 LINES BELOW IS 'GOOD ENOUGH' at filtering out the excess hidden windows, but def can be improved (when I have more patience w regex BS)
; SetTitleMatchMode 2
; vs2017_class_string := "ahk_exe devenv.exe"
; ids := WinGetList("- Microsoft Visual Studio", , vs2017_class_string)

; SetTitleMatchMode 2
; vs2017_class_string := "ahk_class HwndWrapper[DefaultDomain;;]"         ; Visual Studio 2017/2022 (same exe name)
; ids := WinGetList(vs2017_class_string)




; ids := WinGetList(vs2017_class_string)

; ids := WinGetList("Emerson", , teams_class_string, "Drive") ; THIS ONE WORKS FOR TEAMS!
; ids := WinGetList(excel_class_string)


; ref_sheet2025.xlsx - Excel
; ahk_class XLMAIN
; ahk_exe EXCEL.EXE
; ahk_pid 23316
; ahk_id 199580

; ids := WinGetList("Ref_Sheet2025", , excel_class_string)
; excel_class_string := "ahk_class XLMAIN"        ; Microsoft Excel window identifier
; ids := WinGetList("ref", , excel_class_string)


vscode_class_string := "ahk_class Chrome_WidgetWin_1" ; CONFIRMED WORKS FOR VS Code

vscode_windows := WinGetList("Code", , vscode_class_string) ; 
; vs_all_windows := WinGetList("- Microsoft Visual Studio", , vs2017_class_string)

; ; ##### EVERYTHING NEEDED FOR VSCODE/17/22 switcher shortcut
; combine ids1 and ids2 into one list of ids to visit (since both vscode and visual studio are code editors that I want to be able to cycle through with the same shortcut, it makes sense to combine them into one list for the purposes of this visiting-each-window loop)
all_editor_windows := []
for index, id in vscode_windows {
    all_editor_windows.Push(id)
}
; for index, id in vs_all_windows {
;     all_editor_windows.Push(id)
; }
    
; window title
; window class
; window process name
; process id
; ahk id

full_info := ""
for this_id in all_editor_windows
{
    WinActivate this_id
    this_class := WinGetClass(this_id)
    this_title := WinGetTitle(this_id)
    this_process_name := WinGetProcessName(this_id)
    this_pid := WinGetPID(this_id)

    ; full_info := full_info . "Visiting All Windows`n" . A_Index . " of " . ids.Length . "`nahk_id " . this_id . "`n"
    Result := MsgBox(
    (
        "Visiting All Windows
        " A_Index " of " all_editor_windows.Length "
        ahk_title " this_title "
        ahk_class " this_class "
        ahk_process " this_process_name "
        ahk_pid " this_pid "
        ahk_id " this_id "

        Continue?"
    ),, 4)

    currOutput := "ahk_title " this_title "`n"
        . "ahk_class " this_class "`n"
        . "ahk_process " this_process_name "`n"
        . "ahk_pid " this_pid "`n"
        . "ahk_id " this_id "`n"
        . "------------------------------`n"

    ; keep concatenating the info of all the windows we're visiting into a full_info variable so that if we end up needing to ref it later, we have it all in one place instead of having to go through each MsgBox one by one again
    full_info := full_info . currOutput
    if (Result = "No")
        break
}
MsgBox full_info

}








; TRYING TO fix the hyper-k so it switches to chrome as it opens the html file...
; !+`::
; {

;     MsgBox "STARTING SWITCHER LOGIC..."

; }

























































































;#3   -zz-altz
;*####################################################################################################
;*####################################################################################################
;*# SECTION 3: (ALT-) zzshortcuts:
;*####################################################################################################
;*####################################################################################################
; =================================================================
; *The ULTRA-OPTIMIZED-zzshortcuts command :D (it's a masterpiece)
; =================================================================
;! TODO: fix the STICKY-KEY issue that's getting triggered by the (Alt + Z) command somehow
;! >> adding the winWait() as first tier of fixing the sticky-key issue
;! >> if that alone doesn't work, then we can uncomment the remaining Sleep(100) line below
;! >> adding time delay between the (Alt + Z) and the (Ctrl + Char) commands seems to fix it, so adding a 100ms delay
zzshortcuts := "zzshortcuts.xlsm - Excel"
; !z::
!+z::
!^+z::
{
    SetTitleMatchMode 2
    ; *****************************************************
    ; These are the (Ctrl-char) bindings I created within Excel, and their corresp SHEET
    ; (Ctrl + x)    <===>   FileExpl/Gen
    ; (Ctrl + m)    <===>   Cmder/iTerm2
    ; (Ctrl + g)    <===>   Chrome/Jira
    ; (Ctrl + j)    <===>   VsCode/ VisualStudio
    ; (Ctrl + k)    <===>   Teams
    ; (Ctrl + L)    <===>   Trello
    ; (Ctrl + r)    <===>   excel
    ; (Ctrl + Y)    <===>   GitHub-Desktop
    ; (Ctrl + d)    <===>   (free spot)  (maybe notepad++?)
    ; (Ctrl + h)    <===>   (free spot)
    ; *****************************************************

    ; -------------------
    ; qk catching edge case
    ; -------------------
    ; catching the edge case where zzshortcuts doc isn't already running (rarely the case but still need to handle it)
    if !WinExist(zzshortcuts) {
        MsgBox "RUT ROH!!! it's reading as if NO EXCEL zzshorts is running atm"
        ; Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")
        Run(RUN_ZZSHORTCUTS)
        WinWait(zzshortcuts)
    }

    if WinActive(winTitle_file_expl) {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{x}'
        return
    }

    if WinActive(winTitle_cmder) {
        MsgBox winTitle_cmder
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{t}'
        return
    }

    if WinActive(winTitle_chrome) {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{g}'
        return
    }

    ; jumps to VS sheet either of the 3 (vscode, studio17, studio22) ;! BROKEN for the Studio17 and Studio22 window det (VSCODE window det DOES work)
    if WinActive(winTitle_vs_code || winTitle_visual_studio_17 || winTitle_visual_studio_22 || "ahk_exe devenv.exe") {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{j}'
        return
    }

    ; TODO this TEAMS one is broken (likely due to same TEAMS-only issue of not being able to detect TEANS is already open)
    if WinActive(winTitle_teams) {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{k}'
        return
    }

    if WinActive(winTitle_trello) {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{l}'
        return
    }

    if WinActive(winTitle_excel_gen) {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{e}'
        return
    }

    if WinActive(winTitle_github_desktop) {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{y}'
        return
    }

    ;! There's actually NOT room for these additional slots bc some slots had to be eliminated bc they conflicted with MAC Opt+Alt shortcuts
    ;! There MAY....be 1 or at-most 2 more char that could work but I'd need to check into this
    ; ; TODO create an excel sheet for Notepad++ here (along with the custom excel macro like all the other sheets have tailored
    ; If WinActive(winTitle_notepad_plus_plus)
    ; {
    ;     WinActivate("zzshortcuts.xlsm - Excel")
    ;     Send '^{d}'
    ;     return
    ; }

    ; If WinActive(winTitle_???TBD???)
    ; {
    ;     WinActivate("zzshortcuts.xlsm - Excel")
    ;     Send '^{h}'
    ;     return
    ; }

    ; *============ LAST CASE TO HANDLE ============
    ;  for the case where we get NO MATCHES, we can just switch to zzshorts the exact same way weve done this whole time
    ;  (simply switching to zzshorts and then depending on the LogiOptions leftTab/RightTab actions to quickly move to the sheet we want
    ; CLEVER WORKAROUND for TEAMS if() not working:
    WinActivate(zzshortcuts)
    WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
    ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
    ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
    Send '^{k}' ; this sends us to TEAMS sheet no matter what. So half the time it'll be 'correct' anyway :)
    return
}

;#4   -zz-altnumpad
;*####################################################################################################
;*####################################################################################################
;*# SECTION 4: Alt + Numpad COMMANDS (GLOBAL moving windows 3x3) [NO-resizing, only 'moving' the window]
;*# BOTTOM margin   == 60ish pixels (to avoid taskbar)      === (A_ScreenHeight/24)
;*# TOP margin      == 50 pixels (to avoid top menu bar)    === (A_ScreenHeight/28.8) or /30
;*# LEFT/RIGHT margin     == 0 pixels (no margin needed)          [FOR NOW...maybe add later if needed]
;*####################################################################################################
;*####################################################################################################
; move-window-BOTTOM-LEFT (NO-resizing, only moving)
!Numpad1::
{
    WinGetPos(, , &Width, &Height, 'A')
    WinMove(leftAndRightMargin, A_ScreenHeight - Height - (bottomMargin), , , 'A')
    ; WinMove(0,A_ScreenHeight-Height-(A_ScreenHeight/24),,,'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    ; MsgBox A_ScreenHeight ; 1440 height for DELL MONITOR, laptop height ??? ____ ??? FIXME
    ; MsgBox A_ScreenWidth ; 1440 height for DELL MONITOR, laptop height ??? ____ ??? FIXME
    return
}
; move-window-BOTTOM-RIGHT (NO-resizing, only moving)
!Numpad3::
{
    WinGetPos(, , &Width, &Height, 'A')
    WinMove(A_ScreenWidth - Width - (leftAndRightMargin), A_ScreenHeight - Height - (bottomMargin), , , 'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
; move-window-TOP-LEFT (NO-resizing, only moving)
!Numpad7::
{
    WinMove(leftAndRightMargin, topMargin, , , 'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case

    return
}
; move-window-TOP-RIGHT (NO-resizing, only moving)
!Numpad9::
{
    WinGetPos(, , &Width, &Height, 'A')
    WinMove(A_ScreenWidth - Width - (leftAndRightMargin), topMargin, , , 'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
; move-window-CENTER (NO-resizing, only moving)
!Numpad5::
{
    WinGetPos , , &Width, &Height, "A"
    WinMove (A_ScreenWidth / 2) - (Width / 2), (A_ScreenHeight / 2) - (Height / 2), , , "A"
    return
}

; ---------------------------
; remaining Numpad-2,4,6,8 (the less imp ones)
; ---------------------------
!Numpad2::
{
    WinGetPos(, , &Width, &Height, 'A')
    WinMove((A_ScreenWidth / 2) - (Width / 2), A_ScreenHeight - Height - (bottomMargin), , , 'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}

!Numpad4::
{
    WinGetPos(, , &Width, &Height, 'A')
    WinMove(leftAndRightMargin, (A_ScreenHeight / 2) - (Height / 2), , , 'A')
    ; Sleep(100) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
!Numpad6::
{
    WinGetPos(, , &Width, &Height, 'A')
    WinMove(A_ScreenWidth - Width - (leftAndRightMargin), (A_ScreenHeight / 2) - (Height / 2), , , 'A')
    ; Sleep(100) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
!Numpad8::
{
    WinGetPos(, , &Width, &Height, 'A')
    WinMove((A_ScreenWidth / 2) - (Width / 2), topMargin, , , 'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
!Numpad0::
{
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos , , &Width, &Height, "A"
    WinMove , , (A_ScreenWidth * (19 / 20)), (A_ScreenHeight * (9 / 10)), "A"

    ; SECOND: center the window (same as numpad5 code above)
    WinGetPos , , &Width, &Height, "A"
    WinMove (A_ScreenWidth / 2) - (Width / 2), (((A_ScreenHeight / 2) - (Height / 2)) - A_ScreenHeight / 200), , , "A"
    return
}

; ---------------------------------------------------------------------------------------------------------------------
; ------- ALT-QWER resize-window (enhanced to adjust based on screensize instead of hardcoded pixels like glazeWM has rn) ----------
; ---------------------------------------------------------------------------------------------------------------------
; ; move-window-CENTER (NO-resizing, only moving)
; !q::
; {
;     ; FIRST RESIZE WINDOW to almost full screen...
;     WinGetPos ,, &Width, &Height, "A"
;     WinMove ,,(A_ScreenWidth*(3/10)),(A_ScreenHeight*(3/10)), "A"
;     ; SECOND: center the window (same as numpad5 code)
;     WinGetPos ,, &Width, &Height, "A"
;     WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
;     return
; }

; !w::
; {
;     ; FIRST RESIZE WINDOW to almost full screen...
;     WinGetPos ,, &Width, &Height, "A"
;     WinMove ,,(A_ScreenWidth*(2/5)),(A_ScreenHeight*(2/5)), "A"
;     ; SECOND: center the window (same as numpad5 code)
;     WinGetPos ,, &Width, &Height, "A"
;     WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
;     return
; }

; !e::
; {
;     ; FIRST RESIZE WINDOW to almost full screen...
;     WinGetPos ,, &Width, &Height, "A"
;     WinMove ,,(A_ScreenWidth*(1/2)),(A_ScreenHeight*(1/2)), "A"
;     ; SECOND: center the window (same as numpad5 code)
;     WinGetPos ,, &Width, &Height, "A"
;     WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
;     return
; }

; !r::
; {
;     ; FIRST RESIZE WINDOW to almost full screen...
;     WinGetPos ,, &Width, &Height, "A"
;     ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(4/12))), "A"
;     ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(1/12))), "A"
;     WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5)), "A"
;     ; SECOND: center the window (same as numpad5 code)
;     WinGetPos ,, &Width, &Height, "A"
;     ; WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)-(A_ScreenHeight/10),,, "A"
;     WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
;     return
; }

;! EXPERIMENTAL alt-Y resize just for TRELLO (tall-skinny)
; !+y::
; !h::
!y::
{
    ; MsgBox "debug - this is the experimental alt-y resize just for trello (tall-skinny)"
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos , , &Width, &Height, "A"
    WinMove , , (A_ScreenWidth * (1 / 5)), (A_ScreenHeight * (4 / 5)), "A"
    ; SECOND: center the window (same as numpad5 code)
    WinGetPos , , &Width, &Height, "A"
    WinMove (A_ScreenWidth / 2) - (Width / 2), (A_ScreenHeight / 2) - (Height / 2), , , "A"
    return
}

; ====== CUSTOM SIZE for ALT-T (raycast custom size may replace this later) ======
!t::
{
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos , , &Width, &Height, "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(4/12))), "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(1/12))), "A"
    WinMove , , (A_ScreenWidth * (3 / 5)), (A_ScreenHeight * (3 / 5)), "A"
    ; SECOND: center the window (same as numpad5 code)
    WinGetPos , , &Width, &Height, "A"
    ; WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)-(A_ScreenHeight/10),,, "A"
    WinMove (A_ScreenWidth / 2) - (Width / 2), (A_ScreenHeight / 2) - (Height / 2), , , "A"
    return
}

; ====== CUSTOM SIZE for ALT-U
;======= (USE THIS ONE AS THE LEET-SESH FLOATING WINDOW THAT COVERS THE PROB NAME/PREV-SOL WHEN YOU OPEN THE LINK LIKE I HAD SETUP W STICKIES GUARDRAIL WINDOW)
!u::
{
    ; THIS IS THE TOP-FLOATING WINDOW (for STICKY-NOTE1-APP) that's meant to block out the prob-name, webiste and any other 'giveaway' stuff we want to block so no hints
    ; FIRST RESIZE WINDOW to almost full screen...
    ; FIRST RESIZE WINDOW... via args 3 and 4, and THEN... 'move' the window via args 1 and 2 (this order seems to work better for resizing+moving without glitches)
    WinMove , , 1942, 372, "A" ; DIMENSIONS ARE 1942 WIDTH(aka full-width), and 372 HEIGHT
    WinMove 0, 17, , , "A" ; MOVE TO TOP of screen (so top-left corner of window is at x=0, y=17 (to avoid the top menu bar))
    ; WinGetPos , , &Width, &Height, "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(4/12))), "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(1/12))), "A"
    ; WinMove , , (A_ScreenWidth * (3 / 5)), (A_ScreenHeight * (3 / 5)), "A" ; ORIG
    ; SECOND: center the window (same as numpad5 code)
    ; WinGetPos , , &Width, &Height, "A"
    ; WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)-(A_ScreenHeight/10),,, "A"
    ; WinMove (A_ScreenWidth / 2) - (Width / 2), (A_ScreenHeight / 2) - (Height / 2), , , "A" ; ORIG

    return
}

; ====== CUSTOM SIZE for ALT-I
;======= (USE THIS ONE AS THE LEET-SESH FLOATING WINDOW THAT COVERS THE PROB NAME/PREV-SOL WHEN YOU OPEN THE LINK LIKE I HAD SETUP W STICKIES GUARDRAIL WINDOW)
!i::
{
    ; THIS IS THE 2nd-FLOATING WINDOW (for NOTES-APP that covers prev prob sol but only showing the 'class' and 'def' tab) that's meant to block out the prob-name, webiste and any other 'giveaway' stuff we want to block so no hints
    ; FIRST RESIZE WINDOW to almost full screen...
    ; FIRST RESIZE WINDOW... via args 3 and 4, and THEN... 'move' the window via args 1 and 2 (this order seems to work better for resizing+moving without glitches)
    WinMove , , 807, 1105, "A" ; DIMENSIONS ARE 825 WIDTH, and 1105 HEIGHT
    WinMove 1098, 16, , , "A" ; MOVE TO TOP of screen (so top-left corner of window is at x=0, y=17 (to avoid the top menu bar))
    ; WinGetPos , , &Width, &Height, "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(4/12))), "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(1/12))), "A"
    ; WinMove , , (A_ScreenWidth * (3 / 5)), (A_ScreenHeight * (3 / 5)), "A" ; ORIG
    ; SECOND: center the window (same as numpad5 code)
    ; WinGetPos , , &Width, &Height, "A"
    ; WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)-(A_ScreenHeight/10),,, "A"
    ; WinMove (A_ScreenWidth / 2) - (Width / 2), (A_ScreenHeight / 2) - (Height / 2), , , "A" ; ORIG

    return
}

;#5   -zz-altshiftnumpad
;*####################################################################################################
;*####################################################################################################
;*# SECTION 5: (Alt + Shift + Numpad) COMMANDS (The RANDOM Numpad Section (volDown,volUp, Emoji, env_optimization Excel etc)[***NOT CREATED YET***]
;*####################################################################################################
;*####################################################################################################
; IMPORTANT NOTE ABOUT THE WORKAROUND WE HAD TO DO TO GET THIS (ALT+SHIFT+NUMPAD) group WORK ON WINDOWS-SIDE...
; 'SHIFT' changes the input when with NUMPAD so it becomes the same as if NUMLOCK wasn't on
; So pressing (ALT-SHIFT-NUMPAD2) on WINDOWS, is the SAME as turning NUMLOCK OFF, and pressing (ALT+NumpadDOWN)
;! So...even though the BINDINGS below may no LOOK-LIKE they're set on (ALT+SHIFT+NUMPAD), they really ARE.
; ---------------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
; ---------------------------------------------------------------------------------------------------------------------
;! ALTERNATIVE OPTONS THAT 'DO' FIRE WITH NUMPAD1-9 (aside from already-taken (ALT-numpad) group)
; (ALT-CTRL-NUMPAD)
; (ALT-WIN-NUMPAD)
; NumpadEnd::
!NumpadEnd:: ; NUMPAD1
{
    ; MsgBox "1"
    Send "{Volume_Down}"
    return
}
!NumpadDown:: ; NUMPAD2
{
    Send "{Volume_Up}"
    return
}
!NumpadPgdn:: ; NUMPAD3
{
    Sleep(400) ; THIS GIVES US TIME TO RELEASE THE ALT-SHIFT keys so that ONLY WIN-. are being recognized as the command (otherwise it'll send all the keys at once which is tied to yet another dumb fukcing 'OPEN COPILOT' global shortcut FFS)
    Send '#{.}'
    return
}
!NumpadLeft:: ; NUMPAD4
{
    ; C:\Users\aking\quick_ref\env_optimizations.xlsx
    SetTitleMatchMode 2
    if !WinExist("env_optimizations.xlsx - Excel") {
        ; Run("C:\Users\aking\quick_ref\env_optimizations.xlsx - Excel")
        Run("C:\Users\aking\amk\notes\quick_ref\env_optimizations.xlsx - Excel")
        WinWait("env_optimizations.xlsx - Excel")
    }
    ; SOL3
    WinActivate("env_optimizations.xlsx - Excel")
    return
}
; !+Numpad5:: UNREACHABLE COMMAND, since Numpad5 has no NUMLOCK variation like the others (no big deal)
; {
;     MsgBox "5"
;     Send "{Volume_Down}"
;     return
; }d5545
!NumpadRight:: ; NUMPAD6
{
    ; MsgBox "6"
    ; C:\Users\aking\quick_ref\env_optimizations.xlsx
    MsgBox "This should open the windows-equiv to BTT(Better touch tool), the closest thing being probably my app-switcher AHK doc....so I guess we should have this shortcut open king_app_swticher.ahk for editing or IOW run something like: code C:\Users\aking\quick_ref\king_app_switcher.ahk"
    ; SetTitleMatchMode 2
    ; if !WinExist("AutoHotkey Dash") {
    ;     Run("C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\AutoHotkeyUX.exe")
    ;     WinWait("AutoHotkey Dash")
    ; }
    ; ; SOL3
    ; WinActivate("AutoHotkey Dash")
    ; return
}
; C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX
; AutoHotkey Dash
; ahk_class AutoHotkeyGUI
; ahk_exe AutoHotkeyUX.exe
; ahk_pid 17812
; ahk_id 6099128

!NumpadHome:: ; NUMPAD7
{
    SetTitleMatchMode 2
    if !WinExist("Microsoft 365 Copilot") {
        ; MsgBox "RUT ROH!!! it's reading as if NO M365 Copilot is running atm"
        Run(
            "C:\Program Files\WindowsApps\Microsoft.MicrosoftOfficeHub_19.2507.39131.0_x64__8wekyb3d8bbwe\WebViewHost.exe"
        )
        WinWait("Microsoft 365 Copilot")
    }
    else {
        ; MsgBox "M365 Copilot is already running, so just switching to it"
    }
    ; SOL3
    WinActivate("Microsoft 365 Copilot")
    ; MsgBox "Switched to M365 Copilot window by now (HOPEFULLY)"
    return
}

; C:\Program Files\WindowsApps\Microsoft.MicrosoftOfficeHub_19.2507.39131.0_x64__8wekyb3d8bbwe

; Microsoft 365 Copilot
; ahk_class OfficeApp-Frame
; ahk_exe WebViewHost.exe
; ahk_pid 14848
; ahk_id 393846

!NumpadUp:: ; NUMPAD8
{
    MsgBox "8"
    ; Send "{p}" ; TODO
    return
}
!NumpadPgup:: ; NUMPAD9
{
    SetTitleMatchMode 2

    if !WinExist(winTitle_github_desktop) {
        Run(github_desktop), WinWait(winTitle_github_desktop)
    }
    WinActivate(winTitle_github_desktop)
}
!NumpadIns:: ; NUMPAD0
{
    MsgBox "0"
    ; Send "{}" ; TODO
    return
}

; ==============================================================================
; OPTIONAL CATEGORY BELOW TO EXPLORE: the NUMPAD keys ALONE, WITHOUT numlock on
; --this is definitely a CHERRY-ON-TOP category
; ==============================================================================

;#6   -zz-ctrlnumpad
; TODO This category may honestly be better off in BOTTOM SECTION area bc idk if it's even realistic
;*####################################################################################################
;*####################################################################################################
; * # SECTION 6: Ctrl + Numpad COMMANDS (app-specific 9 commands)      ;![***NOT CREATED YET***]
;*####################################################################################################
;*####################################################################################################
; ==============================================================================
; this is CHERRY-ON-TOP category FYI, so do NOT spend any time on it until
; untill all the other way more imp stuff is taken care of
; ==============================================================================
;! THIS CATEGORY MAY BE MORE COMPLEX THAN I THOUGHT bc EACH of the 9 (Ctrl Numpad) commands need their own trail of if()s for each of the apps
;! so ^Numpad1 should have 5-8 if(), just like zzshortcuts has an IF() for each app. Here we're doing that NINE-TIMES!!! (
;! So it'll be like 9 of the zzshortcuts commands into one big command here
; TODO Start on this section of COMMANDS (though not that important atm)
^Numpad1::
{
    ; Send "{Volume_Down}"
    return
}
^Numpad2::
{
    ; Send "{Volume_Up}"
    return
}
^Numpad3::
{
    ; Send EMOJI-PANEL [ ; TODO NOT SURE WHAT THE EMOJIPANEL-shortcut is on WINDOWS side here  ]
    return
}
^Numpad4::
{
    ; Send "{}" ; TODO << dev_environment. EXCEL doc
    return
}
^Numpad5::
; {
;     ; Send "{}" ; TODO
;     return
; }
^Numpad6::
{
    ; Send "{}" ; TODO
    return
}
^Numpad7::
{
    ; Send "{}" ; TODO
    return
}
^Numpad8::
{
    ; Send "{p}" ; TODO
    return
}
^Numpad9::
{
    ; Send "{}" ; TODO
    return
}
^Numpad0::
{
    ; Send "{}" ; TODO
    return
}

;#7   -zz-other
;*####################################################################################################
;*####################################################################################################
;*# SECTION 7: Other/Misc COMMANDS (like Alt + Char or Alt + Shift + char)
;*####################################################################################################
;*####################################################################################################


; #############################################################################
; ########     PART1:  REMAP winKey ==> (alt-opt) minHyper   ###############
; #############################################################################
; FIRST TRY ATTEMPTING TO turn leftOpt (aka winkey) iunto miniHyper (alt-opt) and then move the actual opt key to replace the rightCtrl key...
; Remap Left Win to Hyper (Ctrl+Shift+Alt+Win)
; ATTEMPT1: !!!! SEEMS TO ALREADY BE WORKING PERFECTLY :) .... so far....
*~LWin::
{
    Send "{Blind}{Alt DownTemp}{LWin DownTemp}"
}

*~LWin Up::
{
    Send "{Blind}{Alt Up}{LWin Up}"
}
; ; ATTEMPT2:
; ; Make Left Windows key act as Ctrl+Shift+Alt+Win
; LWin & a::Send "^!+#a"
; LWin & b::Send "^!+#b"
; ; Optional: If you want LWin to still open the Start Menu
; ; when pressed alone, use this (otherwise it disables it)
; ~LWin::return

; #############################################################################
; ########     PART2:  REMAP rightCTRL key to now be win/ or option key    ###############
; #############################################################################
; Remap Right Ctrl to Right option/winkey (Option)
; RCtrl::RAlt
RCtrl::RWin








; ; the 8 numRow shortcuts for app-switching (mimmicking the LOGIOPTIONS row numbers but for our new modgroup of appswithcing )
; !#1::
; {
;     Send '#{1}'
;     return
; }
; !#2::
; {
;     Send '#{2}'
;     return
; }
; !#3::
; {
;     Send '#{3}'
;     return
; }
; !#4::
; {
;     Send '#{4}'
;     return
; }
; !#5::
; {
;     Send '#{5}'
;     return
; }
; !#6::
; {
;     Send '#{6}'
;     return
; }
; !#7::
; {
;     Send '#{7}'
;     return
; }
; !#8::
; {
;     Send '#{8}'
;     return
; }

; ; WORK-AROUND to app-switch to CMDER (since Raycast isn't recognizing the cmder/conemu odd install structure that prevents it from being recognized as a normal app. But w windows's native Taskbar-app-siwtching we can access it properly
; !#t::
; {
;     ; Send '{Lwin}{2}'
;     ; Send '#{2}'
;     ; Send "{Alt down}{LWin down}{2}{Alt up}{LWin up}"
;     ; Send "{Alt down}{LWin down}2{Alt up}{LWin up}"
;     ; MsgBox "yes"

;     ; using SendInput to try to fix the issue where the above commands weren't working reliably
;     waitTime := 1000
;     SendInput '#{2}'

;     ; SendInput '{Lwin down}{2}{Lwin up}'
;     ; Send '{Lwin}{2}'
;     ; Send '#{2}'
;     ; Send "{Alt down}{LWin down}{2}{Alt up}{LWin up}"
;     ; Send "{Alt down}{LWin down}2{Alt up}{LWin up}"

;     return
; }

; j:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}j{LWin up}{Alt up}{Shift up}{Ctrl up}"
; #############################################################################
; ######## close-all-file-explorer-windows (BETA)   ###############
; #############################################################################
!+f::
{
    ; ; MsgBox "This is the close-all-file-explorer-windows shortcut (ALT-SHIFT-F). We can add a confirmation prompt here later if we want, but for now it's just gonna close all file explorer windows immediately when we hit the shortcut"
    ; WinClose, ahk_class CabinetWClass
    ; return
    SetTitleMatchMode 2

    ; Loop through all windows with the File Explorer class name
    ; CabinetWClass is the window class for File Explorer windows
    while WinExist("ahk_class CabinetWClass") {
        WinClose("ahk_class CabinetWClass")
        Sleep(50) ; Small delay to allow window to close
    }

    ; COMMENTED OUT BC NOT SURE IT'S NEEDED AT ALL...
    ; ; Also close any "Open" or "Save As" dialog boxes that use Explorer
    ; while WinExist("ahk_class #32770") {
    ;     ; Check if it's an Explorer-style dialog
    ;     if WinExist("ahk_class #32770 ahk_exe explorer.exe") {
    ;         WinClose("ahk_class #32770 ahk_exe explorer.exe")
    ;         Sleep(50)
    ;     } else {
    ;         break ; Exit if no more Explorer dialogs found
    ;     }
    ; }

}



; #####################################################
; ####   REMAP rightALT key to be rightArrow ##########
; #####################################################
; remap right-alt key to act as right-arrow, so that I can accept suggestions faster in terminal, since the right-alt key is in much easier location on MXkeys than the right arrow key.
RAlt::
{
    Send '{Right}'
    return
}

; #####################################################
; ########      CAPSLOCK HYPERKEY       ###############
; #####################################################

CapsLock:: {
    KeyWait('CapsLock')                               ; wait for Capslock to be released
    if (A_TimeSinceThisHotkey < 200)                  ; in 0.2 seconds
    and KeyWait('CapsLock', 'D T0.2')                 ; and pressed again within 0.2 seconds
    and (A_PriorKey = 'CapsLock')                     ; block other keys
        SetCapsLockState !GetKeyState('CapsLock', 'T')
}
*CapsLock:: Send '{Blind}{vk07}'                     ; This forces capslock into a modifying key & blocks the alt/start menus

#HotIf GetKeyState("CapsLock", "P")
; -------------------------------
; ---- Your hotkeys go here! ----
; -------------------------------

; CapsLock & c::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}c{LWin up}{Alt up}{Shift up}{Ctrl up}"

; I HAD TO REMOVE THE SHIFT part of the below HYPERKEY commands to get around MICROSOFT PRODUCTS hijacking the (Ctrl + Shift + Alt + Win + Char) commands for their own stupid global shortcuts FFS
; remove the {Shift down} and {Shift up} parts of all the below block of code.
; w:: Send "{Ctrl down}{/Alt down}{LWin down}w{LWin up}{Alt up}{Ctrl up}"    ; hyper-w
;ANOTHER!!! STUPID COPILOT one that needs to be altered around >:/
; e:: Send "{Ctrl down}{Alt down}{LWin down}e{LWin up}{Alt up}{Ctrl up}"    ; hyper-e
e:: Send "{Ctrl down}{Alt down}{Shift down}e{Shift up}{Alt up}{Ctrl up}"    ; hyper-e
; STUPID TEAMS one that needs to be altered around >:/ [NOW HYPER-T is re-directed to CTRL-ALT-space for trellos quick-card-global]
; t:: Send "{Ctrl down}{Alt down}{Space}{Alt up}{Ctrl up}" ; so...this line means HYPER-T will now be re-directed to be CTRL-ALT-SPACE instead... :)
; t:: Send "{Ctrl down}{Alt down}{LWin down}o{LWin up}{Alt up}{Ctrl up}"    ; hyper-t
t:: Send "{Ctrl down}{Alt down}{Shift down}t{Shift up}{Alt up}{Ctrl up}"    ; hyper-t
; STUPID AI-MICROSOFT page one that needs to be altered around >:/
y:: Send "{Ctrl down}{Alt down}{Space}{Alt up}{Ctrl up}" ; so...this line means HYPER-Y will now be re-directed to be CTRL-ALT-SPACE instead... :)
; STUPID OUTLOOK one that needs to be altered around >:/
o:: Send "{Ctrl down}{Alt down}{Shift down}o{Shift up}{Alt up}{Ctrl up}"    ; hyper-o
; STUPID POWERPOINT one that needs to be altered around >:/
p:: Send "{Ctrl down}{Alt down}{Shift down}p{Shift up}{Alt up}{Ctrl up}"  ; hyper-p
; STUPID ONEDRIVE one that needs to be altered around >:/w
; STUPID LINKEDIN one that needs to be altered around >:/w
; l:: Send "{Ctrl down}{Alt down}{LWin down}l{LWin up}{Alt up}{Ctrl up}"
; STUPID EXCEL one that needs to be altered around >:/
; x:: Send "{Ctrl down}{Alt down}{LWin down}x{LWin up}{Alt up}{Ctrl up}"  ; hyper-x
x:: Send "{Ctrl down}{Alt down}{Shift down}x{Shift up}{Alt up}{Ctrl up}"  ; hyper-x
; STUPID COPILOT one that needs to be altered around >:/
c:: Send "{Ctrl down}{Alt down}{Shift down}c{Shift up}{Alt up}{Ctrl up}"  ; hyper-c
; ANOTHER STUPID COPILOT one that needs to be altered around >:/
v:: Send "{Ctrl down}{Alt down}{Shift down}v{Shift up}{Alt up}{Ctrl up}"  ; hyper-v
; STUPID ONENOTE one that needs to be altered around >:/
; n:: Send "{Ctrl down}{Alt down}{LWin down}n{LWin up}{Alt up}{Ctrl up}"
; ANOTHER STUPID COPILOT one that needs to be altered around >:/
g:: Send "{Ctrl down}{Shift down}{Alt down}g{Alt up}{Shift up}{Ctrl up}"    ; hyper-g
; ANOTHER STUPID COPILOT one that needs to be altered around >:/

; p:: Send "{Ctrl down}{Shift down}{Alt down}p{Alt up}{Shift up}{Ctrl up}"


; r:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}r{LWin up}{Alt up}{Shift up}{Ctrl up}"

; USE THESE BELOW AS TEMPLATE FOR HOW TO GET AROUND THE MICROSOFT PRODUCTS STEALING THE HYPERKEY COMMANDS BY REMOVING THE {LWin down}{LWin up} PARTS, and just having it be Ctrl+Shift+Alt+Char instead of Ctrl+Shift+Alt+Win+Char (since it's the WIN key that's being recognized by Microsoft products as the trigger for their global shortcuts, so by removing the WIN key from the command, it should hopefully stop triggering those stupid global shortcuts while still allowing us to use the HYPERKEY commands for app-switching and whatever else we want to use them for without interference from Microsoft products)
; USE THESE BELOW AS TEMPLATE FOR HOW TO GET AROUND THE MICROSOFT PRODUCTS STEALING THE HYPERKEY COMMANDS BY REMOVING THE {LWin down}{LWin up} PARTS, and just having it be Ctrl+Shift+Alt+Char instead of Ctrl+Shift+Alt+Win+Char (since it's the WIN key that's being recognized by Microsoft products as the trigger for their global shortcuts, so by removing the WIN key from the command, it should hopefully stop triggering those stupid global shortcuts while still allowing us to use the HYPERKEY commands for app-switching and whatever else we want to use them for without interference from Microsoft products)
; USE THESE BELOW AS TEMPLATE FOR HOW TO GET AROUND THE MICROSOFT PRODUCTS STEALING THE HYPERKEY COMMANDS BY REMOVING THE {LWin down}{LWin up} PARTS, and just having it be Ctrl+Shift+Alt+Char instead of Ctrl+Shift+Alt+Win+Char (since it's the WIN key that's being recognized by Microsoft products as the trigger for their global shortcuts, so by removing the WIN key from the command, it should hopefully stop triggering those stupid global shortcuts while still allowing us to use the HYPERKEY commands for app-switching and whatever else we want to use them for without interference from Microsoft products)
r:: Send "{Ctrl down}{Shift down}{Alt down}r{Alt up}{Shift up}{Ctrl up}"    ; hyper-r
s:: Send "{Ctrl down}{Shift down}{Alt down}s{Alt up}{Shift up}{Ctrl up}"    ; hyper-s
l:: Send "{Ctrl down}{Shift down}{Alt down}l{Alt up}{Shift up}{Ctrl up}"    ; hyper-l
n:: Send "{Ctrl down}{Shift down}{Alt down}n{Alt up}{Shift up}{Ctrl up}"    ; hyper-n
`:: Send "{Ctrl down}{Shift down}{Alt down}{``}{Alt up}{Shift up}{Ctrl up}" ; hyper-` (backtick/tilde key)
d:: Send "{Ctrl down}{Shift down}{Alt down}d{Alt up}{Shift up}{Ctrl up}"  ; hyper-d
h:: Send "{Ctrl down}{Shift down}{Alt down}h{Alt up}{Shift up}{Ctrl up}"  ; hyper-h
w:: Send "{Ctrl down}{Alt down}{Shift down}w{Shift up}{Alt up}{Ctrl up}"  ; hyper-w (keeping this one open for something special since it's the middle key in the home row and thus very easy to reach, so maybe we can use it for something like 'open in vscode' or something like that, since that's a command I use a lot and would be nice to have a super easy shortcut for it)
j:: Send "{Ctrl down}{Alt down}j{Alt up}{Ctrl up}"  ; hyper-j




; b:: Send "{Ctrl down}{Alt down}{Shift down}b{Shift up}{Alt up}{Ctrl up}"  ; his one open for something special since it's the middle key in the home row and thus very easy to reach, so maybe we can use it for something like 'open in vscode' or something like that, since that's a command I use a lot and would be nice to have a super easy shortcut for it)




; ';':: Send "{Ctrl down}{Shift down}{Alt down}';'{Alt up}{Shift up}{Ctrl up}"
; TODO: CANT FIGURE OUT HOW TO GET THE ';' input to work in the above command(mainly the left-side of the command where you do like !#someKey:: action etc)
; TODO: CANT FIGURE OUT HOW TO GET THE ';' input to work in the above command(mainly the left-side of the command where you do like !#someKey:: action etc)
; TODO: CANT FIGURE OUT HOW TO GET THE ';' input to work in the above command(mainly the left-side of the command where you do like !#someKey:: action etc)
; TODO: CANT FIGURE OUT HOW TO GET THE ';' input to work in the above command(mainly the left-side of the command where you do like !#someKey:: action etc)
; TODO: CANT FIGURE OUT HOW TO GET THE ';' input to work in the above command(mainly the left-side of the command where you do like !#someKey:: action etc)
; TODO: CANT FIGURE OUT HOW TO GET THE ';' input to work in the above command(mainly the left-side of the command where you do like !#someKey:: action etc)




; =========================================================
; =========================================================
; =========================================================
; =========================================================
; ALERT: when trying to make a workaround for Copilot, remove the {win down}{LWin up} parts of the below commands, bc it's the WIN key that's triggering the copilot launching BS, 
; =========================================================
; =========================================================
; =========================================================
; =========================================================

q:: Send "{Ctrl down}{Shift down}{Alt down}q{Alt up}{Shift up}{Ctrl up}"    ; hyper-q
u:: Send "{Ctrl down}{Shift down}{Alt down}u{Alt up}{Shift up}{Ctrl up}"    ; hyper-u
i:: Send "{Ctrl down}{Shift down}{Alt down}i{Alt up}{Shift up}{Ctrl up}"    ; hyper-i
a:: Send "{Ctrl down}{Shift down}{Alt down}a{Alt up}{Shift up}{Ctrl up}"    ; hyper-a
; s:: Send "{Ctrl down}{Shift down}{Alt down}s{Alt up}{Shift up}{Ctrl up}"
f:: Send "{Ctrl down}{Shift down}{Alt down}f{Alt up}{Shift up}{Ctrl up}"    ; hyper-f
; k:: Send "{Ctrl down}{Shift down}{Alt down}k{Alt up}{Shift up}{Ctrl up}"
; b:: Send "{Ctrl down}{Shift down}{Alt down}b{Alt up}{Shift up}{Ctrl up}"    ; hyper-b
m:: Send "{Ctrl down}{Shift down}{Alt down}m{Alt up}{Shift up}{Ctrl up}"    ; hyper-m



z:: Send "{Ctrl down}{Shift down}{Alt down}z{Alt up}{Shift up}{Ctrl up}"    ; hyper-z

; 4 arrow key HYPERs...(up down left right, very likely to be used for window management incremental dir moves)
Left:: Send "{Ctrl down}{Alt down}{Shift down}{Left}{Shift up}{Alt up}{Ctrl up}"    ; hyper-left
Right:: Send "{Ctrl down}{Alt down}{Shift down}{Right}{Shift up}{Alt up}{Ctrl up}"    ; hyper-right
; Up::
; {
; Send "{Ctrl down}{Shift down}{Alt down}{LWin down}{Up}{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; msgbox "DEBUG - HYPER-UP key pressed"
; }

Up:: Send "{Ctrl down}{Alt down}{Shift down}{Up}{Shift up}{Alt up}{Ctrl up}"  ; hyper-up

Down:: Send "{Ctrl down}{Alt down}{Shift down}{Down}{Shift up}{Alt up}{Ctrl up}"  ; hyper-down

; Tab:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}{Tab}{LWin up}{Alt up}{Shift up}{Ctrl up}"  ; hyper-tab (for window-switching)
Tab:: Send "{Ctrl down}{Shift down}{Alt down}{Tab}{Alt up}{Shift up}{Ctrl up}"  ; hyper-tab (for window-switching)



; k:: Send "{Ctrl down}{Alt down}{LWin down}k{LWin up}{Alt up}{Ctrl up}"  ; hyper-k (keeping this one open for something special since it's the middle key in the home row and thus very easy to reach, so maybe we can use it for something like 'open in vscode' or something like that, since that's a command I use a lot and would be nice to have a super easy shortcut for it)
k:: Send "{Ctrl down}{Alt down}{Shift down}k{Shift up}{Alt up}{Ctrl up}"  ; hyper-k (keeping this one open for something special since it's the middle key in the home row and thus very easy to reach, so maybe we can use it for something like 'open in vscode' or something like that, since that's a command I use a lot and would be nice to have a super easy shortcut for it)





 


; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; UNIQUE one just for 'open curr file in vscode' (from raycast)
4:: Send "{Ctrl down}{Alt down}{LWin down}{Shift down}4{Shift up}{LWin up}{Alt up}{Ctrl up}"  ; hyper-4
; NOTE ... we could eXTEND this idea, such that the HYPER-number keys correspond to the Fn keys from LogiOptions, only the HYPER means 'open in said app'
; (eg HYPER-5 = open curr file in chrome, HYPER-6 = open curr file in word, etc etc etc)
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
1:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}1{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-1 THIS SHOULD open in FILE-EXPL (bc F1 == jump to file-expl)
2:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}2{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-2 THIS SHOULD open in CMDER (bc F2 == jump to cmder)
3:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}3{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-3 THIS SHOULD open in CHROME (bc F3 == jump to chrome)
5:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}5{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-5 THIS SHOULD open in TEAMS (bc F5 == jump to teams)
6:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}6{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-6 THIS SHOULD open in TRELLO (bc F6 == jump to trello)
7:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}7{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-7 THIS SHOULD open in EXCEL (bc F7 == jump to excel)
8:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}8{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-8 etc
9:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}9{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-9 etc
0:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}0{LWin up}{Alt up}{Shift up}{Ctrl up}" ; hyper-0 OPEN-IN-VSCODE...(rayc-ext)
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++


; ------------------------------------------
; HYPER + NUMPAD KEYS (cannot use SHIFT or WIN key for these bc of various idiosyncracies with how NUMPAD keys work, so just using CTRL + ALT + NUMPAD for these)
; ------------------------------------------
Numpad1:: Send "{Ctrl down}{Alt down}{Numpad1}{Alt up}{Ctrl up}"
Numpad2:: Send "{Ctrl down}{Alt down}{Numpad2}{Alt up}{Ctrl up}"
Numpad3:: Send "{Ctrl down}{Alt down}{Numpad3}{Alt up}{Ctrl up}"
Numpad4:: Send "{Ctrl down}{Alt down}{Numpad4}{Alt up}{Ctrl up}"
Numpad5:: Send "{Ctrl down}{Alt down}{Numpad5}{Alt up}{Ctrl up}"
Numpad6:: Send "{Ctrl down}{Alt down}{Numpad6}{Alt up}{Ctrl up}"
Numpad7:: Send "{Ctrl down}{Alt down}{Numpad7}{Alt up}{Ctrl up}"
Numpad8:: Send "{Ctrl down}{Alt down}{Numpad8}{Alt up}{Ctrl up}"
Numpad9:: Send "{Ctrl down}{Alt down}{Numpad9}{Alt up}{Ctrl up}"
Numpad0:: Send "{Ctrl down}{Alt down}{Numpad0}{Alt up}{Ctrl up}"


; ; STUPID WORD one that needs to be altered around >:/
; w:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}w{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ;ANOTHER!!! STUPID COPILOT one that needs to be altered around >:/
; e:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}e{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID TEAMS one that needs to be altered around >:/
; t:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}t{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID AI-MICROSOFT page one that needs to be altered around >:/
; y:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}y{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID OUTLOOK one that needs to be altered around >:/
; o:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}o{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID POWERPOINT one that needs to be altered around >:/
; p:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}p{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID ONEDRIVE one that needs to be altered around >:/w
; d:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}d{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID LINKEDIN one that needs to be altered around >:/w
; l:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}l{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID EXCEL one that needs to be altered around >:/
; x:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}x{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID COPILOT one that needs to be altered around >:/
; c:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}c{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; ANOTHER STUPID COPILOT one that needs to be altered around >:/
; v:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}v{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID ONENOTE one that needs to be altered around >:/
; n:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}n{LWin up}{Alt up}{Shift up}{Ctrl up}"

; BACKUP OF THE ABOVE KEYS 'IN-ORDER' BEFORE I SEPARATED ALL THE DUMB built-in MICROSOFT ONES THAT NEED TO BE ALTERED AROUND
; q:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}q{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID WORD one that needs to be altered around >:/
; w:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}w{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ;ANOTHER!!! STUPID COPILOT one that needs to be altered around >:/
; e:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}e{LWin up}{Alt up}{Shift up}{Ctrl up}"
; r:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}r{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID TEAMS one that needs to be altered around >:/
; t:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}t{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID AI-MICROSOFT page one that needs to be altered around >:/
; y:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}y{LWin up}{Alt up}{Shift up}{Ctrl up}"
; u:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}u{LWin up}{Alt up}{Shift up}{Ctrl up}"
; i:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}i{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID OUTLOOK one that needs to be altered around >:/
; o:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}o{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID POWERPOINT one that needs to be altered around >:/
; p:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}p{LWin up}{Alt up}{Shift up}{Ctrl up}"

; a:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}a{LWin up}{Alt up}{Shift up}{Ctrl up}"
; s:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}s{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID ONEDRIVE one that needs to be altered around >:/w
; d:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}d{LWin up}{Alt up}{Shift up}{Ctrl up}"
; f:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}f{LWin up}{Alt up}{Shift up}{Ctrl up}"
; g:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}g{LWin up}{Alt up}{Shift up}{Ctrl up}"
; h:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}h{LWin up}{Alt up}{Shift up}{Ctrl up}"
; j:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}j{LWin up}{Alt up}{Shift up}{Ctrl up}"
; k:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}k{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID LINKEDIN one that needs to be altered around >:/w
; l:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}l{LWin up}{Alt up}{Shift up}{Ctrl up}"

; z:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}z{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID EXCEL one that needs to be altered around >:/
; x:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}x{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID COPILOT one that needs to be altered around >:/
; c:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}c{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; ANOTHER STUPID COPILOT one that needs to be altered around >:/
; v:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}v{LWin up}{Alt up}{Shift up}{Ctrl up}"
; b:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}b{LWin up}{Alt up}{Shift up}{Ctrl up}"
; ; STUPID ONENOTE one that needs to be altered around >:/
; n:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}n{LWin up}{Alt up}{Shift up}{Ctrl up}"
; m:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}m{LWin up}{Alt up}{Shift up}{Ctrl up}"

; q:: MsgBox "You pressed CapsLock + q" ; example of hyperkey shortcut syntax for this context
; ^w:: MsgBox "You pressed CapsLock + Control + w"

; Define paths
pythonPath := "C:\Python39\python.exe"
scriptPath := "C:\Users\YourUser\Documents\my_script.py"
scriptDir := "C:\Users\YourUser\Documents"
; "C:\alex_scripts\open_my_screenshots_amk.py"

; s::
; {
;     Run "C:\alex_scripts\open_my_screenshots_amk.py"
; }

; F3::
; {
;     Run "%pythonPath%" "%scriptPath%", scriptDir
; }

; Numpad1::
; {
;     MsgBox "hyperkey worked"
;     return
; }

; i::
; {
;     MsgBox "hyperkey worked"
;     return
; }

#HotIf
; -----------------------------------
; ---- end of hyperkey shortcuts ----
; -----------------------------------

; Capslock:: (DOESNT WORK so using above more complicated CAPLOCK-hyper which DOES WORK)
; {
;     Send '^+!#' ; This sends Ctrl+Shift+Alt+Win
;     ; MsgBox "it worked, I think..."
;     Return
; }

;  ^!#x ==> Ctrl + Alt + WinKey + x
; !^+#z::
; "{Ctrl down}{Alt down}{LWin down}x{LWin up}{Alt up}{Ctrl up}"

; #####################################################################
; ######## open the durMeetings tab in ref_sheet excel doc ############
; #####################################################################
; !^#x::
^+!x::
{
    ; !!!TODO!!! STILL NEED TO CREATE THE MACRO INSIDE THE EXCEL DOC TO JUMP TO THE DURMEETINGS TAB and then use the SEND() keys to
    ; to trigger that macros AFTER switching to the excel doc itself (just like zzshorts-super-opt)

    ; SetTitleMatchMode 1
    SetTitleMatchMode 2
    ; SetTitleMatchMode 3
    ; MsgBox "triggered ahk thing..."
    winTitle_excel_gen := "ahk_exe EXCEL.EXE"

    ; if !WinExist("ref_sheet2025.xlsx - Excel") {

    if !WinExist(ref_sheet2025) {
        ; Run("C:\Users\aking\quick_ref\ref_sheet2025.xlsx - Excel")
        Run(RUN_REF_SHEET2025)
        WinWait(ref_sheet2025)
    }

    ; SOL3
    WinActivate(ref_sheet2025)

    return

}

; #####################################################################
; open the quick_ref directory in file explorer ############
; #####################################################################
!+^r::
{

    ; %%%%%%%%%%%%%%%%%%%%%%
    ; UPDATE! bc of odd hotkey bug on raycast, I'm going to use AHK for any dirs which I want to open via HOTKEY, and then the other dirs can still be via RAYCAST QUICKLINKS since the quicklinks work perfectly as long as you trigger them via typing out the command (instead of hotkey trigger)
    ; RAYCAST QUICKLINKS since the quicklinks work perfectly as long as you trigger them via typing out the command (instead of hotkey trigger)
    ; CAUTION ==> we STILL want these DIRs to have a quicklink with raycast as well, it's just that the HOTKEY trigger for opening the DIRs need to be defined HERE in AHK to avoid the dumb bug
    ; LAST NOTE: this is still the BETA-version of Raycast this bug could be fixed very soon anyway and then we can have everything DIR related defined through raycast lke I want)
    ; %%%%%%%%%%%%%%%%%%%%%%
    SetTitleMatchMode 2

    ; open this dir in file explorer: C:\Users\aking\quick_ref
    ; Run("explorer.exe C:\Users\aking\quick_ref")
    ; Run "explorer.exe C:\Users\aking\quick_ref",,, &PID
    ; MsgBox "DEBUG - about to run explorer.exe for quick_ref dir"
    Run "explorer.exe C:\Users\aking\amk\notes\quick_ref",,, &PID
    
    ; ATTEMPT 1..........................................
    ; Wait for the new window to exist, using the PID to be specific
    ; WinWait "ahk_pid " PID
    
    ; Move and resize the window
    ; Format: WinMove(X, Y, Width, Height, WinTitle)
    ; WinMove 100, 100, 600, 600, "ahk_pid " PID

    ; ; ATTEMPT 2..........................................
    ; ; WinWait("ahk_pid " PID)
    ; Sleep(1000) ; wait a moment to ensure the window is fully loaded
    ; WinGetPos(, , &Width, &Height, 'A')
    ; WinMove(A_ScreenWidth - Width - (leftAndRightMargin), A_ScreenHeight - Height - (bottomMargin), , , 'A')

    ; ATTEMPT 3..........................................
    Sleep(800) ; wait a moment to ensure the window is fully loaded
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos , , &Width, &Height, "A"
    WinMove , , (A_ScreenWidth * (10 / 20)), (A_ScreenHeight * (5 / 10)), "A"

    ; ; SECOND: center the window (same as numpad5 code above)
    ; WinGetPos , , &Width, &Height, "A"
    ; WinMove (A_ScreenWidth / 2) - (Width / 2), (((A_ScreenHeight / 2) - (Height / 2)) - A_ScreenHeight / 200), , , "A"

    return
}







; (say for TOOLS dir for exmaple)
; #####################################################################
; ######## TODO: create another Hotkey for opening Dir at specific location (since raycasts hotkey is bugging rn) ############
; #####################################################################
; (say for TOOLS dir for exmaple)













; (say for NICHE dir for exmaple)
; #####################################################################
; ######## TODO: create another Hotkey for opening Dir at specific location (since raycasts hotkey is bugging rn) ############
; #####################################################################
; (say for NICHE dir for exmaple)

















; #####################################################################
; ######## open the screenshots directory in file explorer ############
; #####################################################################
; these are SCREENSHOTS so we want this window to open in larger than typical expl windows bc we want to see the thumbnails better, so we'll use the same code as above for resizing/moving the window, just with different dimensions for the WinMove command in ATTEMPT 3
!+^b::
!+^`::
{
    ; %%%%%%%%%%%%%%%%%%%%%%
    ; UPDATE! bc of odd hotkey bug on raycast, I'm going to use AHK for any dirs which I want to open via HOTKEY, and then the other dirs can still be via RAYCAST QUICKLINKS since the quicklinks work perfectly as long as you trigger them via typing out the command (instead of hotkey trigger)
    ; RAYCAST QUICKLINKS since the quicklinks work perfectly as long as you trigger them via typing out the command (instead of hotkey trigger)
    ; CAUTION ==> we STILL want these DIRs to have a quicklink with raycast as well, it's just that the HOTKEY trigger for opening the DIRs need to be defined HERE in AHK to avoid the dumb bug
    ; LAST NOTE: this is still the BETA-version of Raycast this bug could be fixed very soon anyway and then we can have everything DIR related defined through raycast lke I want)
    ; %%%%%%%%%%%%%%%%%%%%%%
    SetTitleMatchMode 2
    ; open this dir in file explorer: C:\Users\aking\OneDrive - Emerson\Pictures\Screenshots
    Run("explorer.exe C:\Users\aking\OneDrive - Emerson\Pictures\Screenshots")

    ; NEITHER OF THESE WINWAIT() ARE WORKING ... :/ 
    ; WinWait(winTitle_file_expl) ; SOL1 TO FIX STICKY-KEY ISSUE
    ; WinWait("Explorer") ; SOL1 TO FIX STICKY-KEY ISSUE

    ; ATTEMPT 3..........................................
    Sleep(800) ; wait a moment to ensure the window is fully loaded
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos , , &Width, &Height, "A"
    WinMove , , (A_ScreenWidth * (10 / 20)), (A_ScreenHeight * (8 / 10)), "A"

    ; ; SECOND: center the window (same as numpad5 code above)
    ; WinGetPos , , &Width, &Height, "A"
    ; WinMove (A_ScreenWidth / 2) - (Width / 2), (((A_ScreenHeight / 2) - (Height / 2)) - A_ScreenHeight / 200), , , "A"


    ; if WinActive(winTitle_file_expl) {
    ; WinActivate(zzshortcuts)
    ; WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
    ; ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
    ; ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
    ; Send '^{x}'
    ; return

    return
}

; UPDATE: disabled this bc PowerToys now has a built-in 'always on top' shortcut (which I set to ALT-F) <no longer want ALT-B for PIN/FLOATING window (unless I run into some issue thatmakes ALT-F bidning a problem)
; #####################################################
; ######## the 'Float-window-on-top' shortcut #########
; #####################################################
; !b::
; {
;     Send '^#{t}'
;     return
; }

; #####################################################
; ######## the 'LAUNCH ALL MAIN-APPS' shortcut ########
; #####################################################
; AHK FIRST run as admin: ===>
; "C:\Program Files\AutoHotkey\UX\king_app_switcher1.ahk"

; glazewm,Cmder, chrome, vscode?, trello, excel-ref, excel-zzshorts, github-desktopm glaze/auto-tiling-script
!+l::
{
    ; ; ================================================================================
    ; ; ==== TODO: surround both these first two run()'s in a similar !WinExist() check so can spam this launch-all command without worrying about re-launching already running processes and this glaze-stuff is the last 2 ones I need to couch in if()
    ; ; ================================================================================
    ; Run("C:\Program Files\glzr.io\GlazeWM\glazewm.exe")
    ; Sleep(1000)
    ; ; Run("C:\alex_scripts\main_glaze_autotiling.py")
    ; Sleep(1000)
    ; ; ================================================================================
    ; ; ==== TODO: above
    ; ; ================================================================================

    ; this CLI command kills the script we want:
    ; 'kill C:\Windows\py.exe'


    ; ; TEMP DISABLING THIS GLAZEWM ... (retry this when I have more patience)
    ; if !ProcessExist("GlazeWM") {
    ;     Run("C:\Program Files\glzr.io\GlazeWM\glazewm.exe")
    ;     Sleep(1000)
    ; }

    if !WinExist(winTitle_cmder) {
        ; Run(cmder), WinWait(winTitle_cmder)
        Send '#{2}'
        Sleep(1000)
    }

    SetTitleMatchMode 1
    if !WinExist(winTitle_chrome) {
        Run(chrome), WinWait(winTitle_chrome)
    }

    SetTitleMatchMode 2
    if !WinExist(winTitle_vs_code) {
        Run(vs_code), WinWait(winTitle_vs_code)
    }

    SetTitleMatchMode 1
    if !WinExist(winTitle_trello) {
        ; Run(trello)
        Send '#{6}'
        ; WinWait(winTitle_trello)
    }

    SetTitleMatchMode 2
    if !WinExist("ref_sheet2025.xlsx - Excel") {
        ; Run("C:\Users\aking\quick_ref\ref_sheet2025.xlsx - Excel")
        Run(RUN_REF_SHEET2025)
        WinWait("ref_sheet2025.xlsx - Excel")
    }

    if !WinExist("zzshortcuts.xlsm - Excel") {
        ; Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")
        Run(RUN_ZZSHORTCUTS)
        WinWait("zzshortcuts.xlsm - Excel")
    }

    SetTitleMatchMode 2
    if !WinExist(winTitle_github_desktop) {
        Run(github_desktop), WinWait(winTitle_github_desktop)
    }


    ; C:\Program Files\WindowsApps\Microsoft.OutlookForWindows_1.2026.310.300_x64__8wekyb3d8bbwe\olk.exe
    ; SetTitleMatchMode 2
    ; if !WinExist(winTitle_outlook) {
    ;     Run(outlook)
    ;     WinWait(winTitle_outlook)
    ; }

    SetTitleMatchMode 1
    ; SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    if !WinExist('ahk_exe olk.exe') {
        Run('olk.exe')
        Sleep(300) ; trying to fix error when switching to outlook when it's not already running.
        WinWait('ahk_exe olk.exe')
    }
    ; SOL3
    WinWait('ahk_exe olk.exe')
    WinActivate('ahk_exe olk.exe')
    WinWaitActive('ahk_exe olk.exe')

    ; *** LAST STEP: *** switch to terminal
    Send '#{2}'
    return
}



; TRYING TO fix the hyper-k so it switches to chrome as it opens the html file...
!+^k::
{

    ; DetectHiddenWindows(1)
    ; global current_chrome_index
    ; SetTitleMatchMode 2
    
    ; ; Get list of all Chrome windows
    ; ; chrome_class_string := "ahk_class Chrome_WidgetWin_1" ; Chrome window identifier
    ; ; chrome_windows := WinGetList(chrome_class_string)
    ; ; chrome_windows := WinGetList("Google", , chrome_class_string)
    ; chrome_windows := WinGetList("Google", , chrome_class_string) ; THIS ONE WORKS FOR CHROME!

    ; ; chrome_windows := WinGetList("Chrome", chrome_class_string)

    ; ; ; print how many chrome windows were found (this should help sus out if it's detecting 'invisible' windows)
    ; ; ; MsgBox(chrome_windows.Length . " Chrome windows found.")
    ; ; numWindows := chrome_windows.Length
    ; ; windowsList := ""
    ; ; for index, win in chrome_windows {
    ; ;     windowsList .= "Window " . index . ": " . win . "`n"
    ; ; }

    ; ; ; print full list of chrome windows and total number of windows for debugging to see what these hidden windows are (if any)
    ; ; MsgBox("List of Chrome windows:`n" . windowsList . "`nTotal: " . numWindows)

    ; ; for index, win in chrome_windows {
    ; ;     MsgBox("Chrome window " . index . ": " . win)
    ; ; }

    
    ; ; If no Chrome windows exist, launch a new one
    ; if (chrome_windows.Length = 0) {
    ;     ; MsgBox("No Chrome window open. Launching a new one.")
    ;     Run("chrome.exe")
    ;     WinWait(chrome_class_string)
    ;     current_chrome_index := 0
    ;     return
    ; }
    
    ; ; If only one Chrome window exists, just activate it
    ; if (chrome_windows.Length = 1) {
    ;     ; MsgBox("Only one Chrome window open. Activating it.")
    ;     WinActivate(chrome_windows[1])
    ;     current_chrome_index := 0
    ;     return
    ; }
    
    ; ; Multiple Chrome windows exist - cycle through them
    ; ; Get the currently active window to ensure we switch to a different one
    ; current_active := WinGetID("A")
    
    ; current_chrome_index++

    ; ; MsgBox(chrome_windows.Length . " Chrome windows found. Current index: " . current_chrome_index)
    
    ; ; Reset index if we've gone past the last window
    ; if (current_chrome_index > chrome_windows.Length) {
    ;     current_chrome_index := 1
    ;     ; MsgBox("Resetting Chrome window index to 1.")
    ; }
    
    ; ; If the window we're about to activate is already active, move to the next one
    ; if (chrome_windows[current_chrome_index] = current_active) {
    ;     current_chrome_index++
    ;     if (current_chrome_index > chrome_windows.Length) {
    ;         current_chrome_index := 1
    ;     }
    ; }

    ; ; Activate the current window in the cycle
    ; try {
    ;     WinActivate(chrome_windows[current_chrome_index])

    ; } catch {
    ;     ; If window no longer exists, reset and try first window
    ;     MsgBox("Chrome window no longer exists. Resetting to first window.")
    ;     current_chrome_index := 1
    ;     if (chrome_windows.Length > 0) {
    ;         WinActivate(chrome_windows[current_chrome_index])
    ;     }
    ; }

    ; ; Send '#{3}' ; Note the original F1 code (which wasn't working well) is saved in the king_app_switcher1_SANDBOX.ahk file if we end up needing it to ref at some pt
    ; ; return

    ; ; Send alt-opt-b to trigger the chrome-related logic
    ; ; Send('!#b') ; THIS WASNT WORKIN...
    ; ; wait a little bit before sending 'alt-shift-ctrl-k' to trigger the hyper-k keyboard viz html...
    ; Sleep(300)
    ; ; MsgBox "DONE" 
    
    ; Send('!+^{k}') ; PLACHOLDER TMP SHORTCUT TO TAKE TO YOUR

    Run "C:\Program Files\Google\Chrome\Application\chrome.exe file:///D:/git/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
}









; #####################################################
; ##### the 'fix file-expl BACK/FORWARD' shortcut #####
; #####################################################
; ----------------------------
; TODO UPDATE: getting odd error where it spams 171 keys in 1 millisecond when I do Ctrl+] when NOT in file-expl window, so COMMENTING-OUT this section for now----------------------------
; ----------------------------
; TODO MAYBE FIND BETTER WAY TO DO THIS OTHER THAN THE AHK-REDIRECT which slows the action down slightly, and this action needs to be fast as possible.
; ----------------------------
; FIXING FileExplorer's 'BACK/FORWARD' shortcut to the standard (Ctrl + [ ) and ( Ctrl + ] ) shortcuts
; ^[::
; {
;     SetTitleMatchMode 2
;     If WinActive(winTitle_file_expl)
;     {
;         Send '!{left}'
;     }
;     else
;         Send('^{[}')
;     return
; }
; ^]::
; {
;     SetTitleMatchMode 2
;     If WinActive(winTitle_file_expl)
;     {
;         Send '!{right}'
;     }
;     else
;         Send('^{]}')
;     return
; }

;#8   -zz-etc
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*# SECTION 8: EVERYTHING-ELSE: COMMANDS/IDEAS-STILL-IN-THE-WORKS/ CHERRY-ON-TOP-CATEGORY
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################
;*####################################################################################################

; TODO: Try this out for a while and see how it goes. I haven't figured out a way around the DOWNSIDE of doing this which is the INFINITE-RECURSIVE-COMMAND error, and not being able to use any of the NATIVE Ctrl- psacebvar commands for any apps (WHY? bc in order to access that command, id have to send ctrl-spacebvar to that app, which obvi recursively calls this AHK command and we get the cycle repeating forever.
; TODO: However maybe this bug isn't actually that common in which case this is agood solution bvc i get an entire new APP SPECIFIC KEY and it's one of the BEST-REALIESTAElocations for any command so super easy to launch all the imte
; TODO:     >> IF...on the other hand I can find some AHK-setting or flag or clever solution to this issue of not being able to access any of apps internal ctrl-spacebar commands
; TODO then i can IGNORE all the above and cement this IDEA as gold standard
; -----------------------------------------------------
; ------- the (Ctrl + Spacebar) keyshortcut for APP-SPECIFIC things ----------
; Bc I noticed how rarely apps have any command tied to (Ctrl + Spacebar) AND bc it's one of the quickest/best-placed keyboard shortcut out there ...
;   ... bc of all that I thought it would make sense to use AHK to convert this shortcut into its OWN APP-SPECIFIC one where it's action is diff dep on which application you are in when you run it
;       ...which is JUST LIKE the ULTA_OPTIMAEEXED-zzSHROTCUTS I just SUCCESFUULLY setup :D
; -----------------------------------------------------
; --------------------------------------------------------------------
; *EXP idea of configuring (Ctrl + Spacebar) as it's own APP-SPECIFIC key
; --------------------------------------------------------------------
; for each of these apps below, we choose 1 of that apps internal keyboard shortcuts that we want to set to (ctrl + spacebar)
; (say that internal keyb biding is Ctrl-Shift-M),.. then those are the KEYS we want in our SEND() function
; EDGE CASE: no matches: in the event we call this Ctrl Spacebar command from an app NOT in this below if() catches...
;   ... then we may have to just return and send no KEYS to the app.
;          ... we CANNOT just send the same keys generically bc then it will recall the same action (since it's simiulating you pressing that command in the app, so if we just send (ctrl -spacebar) again, then it will FIRE this AHK action AGAIN, which will end up with us sending the generic ctrl-spacebar command AGAIN and this will repeat over and over)
; ()    <===>   FileExpl/Gen        <===>   ; TODO (what command do we want for this app??)
; ()    <===>   Cmder/iTerm2        <===>   ; TODO (what command do we want for this app??)
; ()    <===>   Chrome/Jira         <===>   ; TODO (what command do we want for this app??)
; ()    <===>   VsCode/ VStudio     <===>   ; TODO (what command do we want for this app??)
; ()    <===>   Teams               <===>   ; TODO (what command do we want for this app??)
; ()    <===>   Trello              <===>   ; TODO (what command do we want for this app??)
; (F2)  <===>   excel               <===>   (F2) edit selected cell
; ()    <===>   GitHub-Desktop      <===>   ; TODO (what command do we want for this app??)
; ()    <===>   (free spot)         <===>   ; TODO (what command do we want for this app??)
; ()    <===>   (free spot)         <===>   ; TODO (what command do we want for this app??)
; NOTE: for the few apps that actually DO have a good internal command for (ctrl spacebar), we can still keep this
; functionality working by simply sending the same keys in that apps IF()
; This is a way we can ensure we dont have to 'return' from 'no matches' WAY less often
;! TMP DISABLED THIS Ctrl-spacebar COMMAND BC TO TEST THE fzf COMMANDS (which needs Ctrl-spacebar binding)
; ^Space::
!+^Space::
{

    SetTitleMatchMode 2
    if WinActive(winTitle_file_expl) {
        Send '{F2}'
        return
    }

    if WinActive(winTitle_cmder) {
        Send '^{t}'
        return
    }

    if WinActive(winTitle_chrome) {
        Send '^{t}'
        return
    }

    if WinActive(winTitle_vs_code) {
        Send '^{t}'
        return
    }

    ; TODO this TEAMS one is broken (likely due to same TEAMS-only issue of not being able to detect TEANS is already open)

    if WinActive(winTitle_teams) {
        Send '^{g}'
        return
    }

    if WinActive(winTitle_trello) {
        Send '{n}'
        return
    }

    if WinActive(winTitle_excel_gen) {
        Send '{F2}'
        return
    }

    if WinActive(winTitle_github_desktop) {
        Send '^{b}'
        return
    }

    MsgBox " NO MATCHES FOUND!!! returning with no-keys-sent-to-this-application"
    ; ; TODO create an excel sheet for Notepad++ here (along with the custom excel macro like all the other sheets have tailored
    ; If WinActive(winTitle_notepad_plus_plus)
    ; {
    ;     WinActivate("zzshortcuts.xlsm - Excel")
    ;     Send '^{d}'
    ;     return
    ; }

    ; ; TODO there are THREE-MORE slots avail for their own designated zzshorts sheet
    ; ; TODO (Ctrl + n) and (ctrl + n) and (ctrl + a)  are the THREE AVAIL bindings we have left within excel internal macros
    ; If WinActive(winTitle_???TBD???)
    ; {
    ;     WinActivate("zzshortcuts.xlsm - Excel")
    ;     Send '^{h}'
    ;     return
    ; }

    ; If WinActive(winTitle_???TBD???)
    ; {
    ;     WinActivate("zzshortcuts.xlsm - Excel")
    ;     Send '^{n}'
    ;     return
    ; }

    ; If WinActive(winTitle_???TBD???)
    ; {
    ;     WinActivate("zzshortcuts.xlsm - Excel")
    ;     Send '^{a}'
    ;     return
    ; }

    return
}

; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; **************UPDATE ON THIS ONE:******************
; it's prob not worth it until we can either...
; 1. reset the tab-location so it always starts in same spot b4 sequence of tabs start
; OR more ideally...
; 2. We fig out how/if to jump to specific HTML elements on the page
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; TESTING FOR the TAB-TAB-TAB x-number of times (based on specific web page active)
; EXPERIMENTAL IDEA OF being able to 'tab' to useful spots on webpages, BASED on the active webpage.
; so jira-SWRs send 26 'tab' keys to get to the useful 'overview' tab
; ^!F8::
; ^!+F8::
; ^!+x::
; {
;     SetTitleMatchMode 1 ; using the STARTS-WITH matching for this experimental tab idea stuff
;     ; SetTitleMatchMode 2
;     ; SetTitleMatchMode 3

;     ; OTHER WEBPAGES / APPS we may want to include in this commands string of if's below
;     ; 1) My Work webpage
;     ; 2) Code Reviews assigned to you GITHUB page
;     ; 3)
;     ; 4)
;     ; ****THE SMALL PROBLEM W THIS COMMAND: ****
;     ; it requires the tab spot to be specific spot before
;     ; exec the command, otherwise the 20+ tabs will be off-by certain number of tabs
;     ; ****THE SOLUTION: ****
;     ; we need some 'reset'-like key combination to send BEFORE all the tabs so
;     ; that the location of the 'tab' can be reset to the same place it was initially.
;     ; this way we know our consecutive tabs will always bring us to the desired location on
;     ; the page, regardless of where the current 'tab' spot is on the page when we exec this command
;     ; NOTE i tried to 'esc' key but that doesn't seem to 'reset' the tab spot like I thought it might
;     ; ****ALTERNATIVE STRATEGY:****
;     ; jumping to specific HTML elements w/i page itself (via inspect)
;     ; https://www.google.com/search?q=autohotkey+jump+to+specific+element+in+webpage&rlz=1C1GCEB_enUS1061US1061&oq=autohotkey+jump+to+specific+element+in+webpage&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQIRigATIHCAIQIRigATIHCAMQIRigATIHCAQQIRigATIHCAUQIRigATIHCAYQIRifBdIBCTE2MjAyajBqMagCALACAA&sourceid=chrome&ie=UTF-8
;     ; if possible, this sol would likely be VASTLY superior to my hacky 'tab-x-times' approach
;     if WinActive("[SWR") {
;         ; this is a JIRA ISSUE page, so we want to tab 26 times to get to the submenu we want
;         ; ==================================================================
;         ; JUMPS TO 'Overview' tab on Chrome-Jira-SWR webpage (26 total tabs)
;         ; ==================================================================
;         Send(
;             "{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}"
;         )
;     }
;     else if WinActive("Your work") {
;         ; this is the 'Your Work' jira page (needs 35 tabs to get to useful spot)
;         Send(
;             "{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}"
;         )
;     }
;     else if WinActive("SWR") or WinActive("WPS") {
;         ; this must be a GITHUB-PR webpage, so we want to tab tot of 21 times to get to submenu we want
;         ;==================================================================
;         ; JUMPS TO 'Conversation' tab on Chrome-Github-PR webpage (21 total tabs)
;         ;==================================================================
;         Send(
;             "{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}"
;         )
;     }
;     else if WinActive("Pull requests") {
;         ; this is the List of CODE REVIEWS assigned to me webpage (needs 20 tot tabs)
;         Send("{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}")
;     }

;     return
; }

; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; EXPERIMENTAL IDEA OF being able to 'tab' to useful spots on webpages, BASED on the active webpage.
; so jira-SWRs send 26 'tab' keys to get to the useful 'overview' tab
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================
; ==================================================================

; =================================================
; TODO: fix this OUTLOOK launching if() below...
; =================================================
; SetTitleMatchMode 2
; If !WinExist(winTitle_outlook)
; {
;     Run(outlook), WinWait(winTitle_outlook)
; }

; Inbox - alex.king@aspentech.com - Outlook
; ahk_class rctrl_renwnd32
; ahk_exe OUTLOOK.EXE
; ahk_pid 13044
; ahk_id 135382

; ; ====== TEMPORARILY for TESTING OUT the 'OUTLOOK' functionality ========
; ^Numpad6::
; {
;     ; SetTitleMatchMode 1
;     SetTitleMatchMode 2
;     ; SetTitleMatchMode 3
;     If !WinExist(winTitle_outlook)
;     {
;         MsgBox " about to run outlook"
;         Run(outlook)
;         WinWait(winTitle_outlook)
;         MsgBox "done with initial winwait"
;     }

;     ; ; SOL3
;     ; WinWait(winTitle_outlook)
;     ; MsgBox "checkpt 1"
;     ; WinActivate(winTitle_outlook)
;     ; MsgBox "checkpt 2"
;     ; WinWaitActive("Inbox - alex.king@aspentech.com - Outlook", winTitle_outlook, 5)
;     ; MsgBox "checkpt 3"
;     return
; }

; ==================================================================
; COMMANDS/IDEAS still in the works
; ==================================================================
; 1. tab to useful spot on webpage, based on spec webpage
; 2. jump to spec html element on webpage, based on spec webpage
; 3. implement my original 'ideal' zzshort idea:
; THE IDEA: i can press the keyb-shortcut and it will bring up the shortcuts for the specific app I was in when
;  I pressed the shortcut. So if I'm in Chrome, then itll bring up the CHROME SHORTCUTS FILE, but if i was in say
; TEAMS app and pressed the same shortcut, it would bring up the TEAMS SHORTCUTS FILE instead.
; HOWTO:
; similar to my send(TABS) action with numpad8, I can use if()Ss to det which app is the active one,
; then the body will just be the specific shortcuts file for that app
; this way the same key can bring up the exact shortcuts I want
; and I can have the trailing ELSE be just bring up a generic shortcuts file that has ALL of the shrotcuts
; across all apps (aka just bring up zzshortcuts excel doc I have now basically)
; 4. Remapping the Opt/Control key that's on the RIGHT side (aka never used) to be the ARROW-RIGHT key, so I can
; can access the common 'RIGHT ARROW' key easier (similar to how easy it was on MX MINI keyb layout) and no longer
; have to reach right hand all the way over to where the upside-down-T arrow area and have to completely take hand off
; of HOMEROW keys
; ALTERNATIVE SOL:
; remap the CAPSLOCK key to be the RIGHT ARROW key, so can still easily access the super-common RIGHT-ARROW key
; without having to reach awkwardly (CAPSLOCK is even more easy than the remapping the right-side opt/ctrl key but
; but it's a bit less intuitibe being on the LEFT SIDE when I'm so used to the RIGHT ARROW action being on the RIGHT)
; 5.
; x. (NOT NEEDED, Alt + F4 is universal enough, at least on Win) universal 'kill window' (see num0 command for expl)

; --------------------------------------------------------------------
; FEATURES TO ADD ON AFTER BASELINE FUNCTIONALITY REACHED (like Chrome Tabs iter)
; --------------------------------------------------------------------
; For Chrome, be able to iter through either Mult instances or tabs when hitting the key while already in the app
; Similar to Chrome tab, we do the same for Cmder, where we iter through any tabs if hit the shortcut while in the app already

;*-------------------------------------------------------------------------
;*# quick jump to section using Ctrl+F with these zzkeywords:
;# TIP: search for 'zz-' or '-zz' and then can quickly jump to each section even if dont have full keyword for the section I want'
;*-------------------------------------------------------------------------
;#   zz-                1. INITIAL GLOBAL VARIABLES/PATHS        (plus USEFUL REF STUFF (like LEGEND))
;#   zz-fn              2. Fn ROW COMMANDS for app-switching     (most imp obvi)
;#   zz-altz            3. Alt + Z COMMAND (zzshortcuts)         [designated SPECIAL as it's own group section here]
;#   zz-altnumpad       4. Alt + Numpad COMMANDS & (ALT + QWER)  (GLOBAL moving windows 3x3)
;#   zz-altshiftnumpad  5. Alt + Shift + Numpad COMMANDS         (GLOBAL-MISC commands (like VolUp/EmojiPanel etc)
;#   zz-ctrlnumpad      6. Ctrl + Numpad COMMANDS                (app-specific 9 commands) ;![***NOT CREATED YET***] MAY ACTUALLY MOVE THIS ONE AND INSTEAD HAVE IT BE ONE OF THE groups of commands within the MISC SECTION
;#   zz-other           7. Other/Misc COMMANDS (like Alt + Char or Alt + Shift + char)
;#   zz-etc             8. EVERYTHING-ELSE: COMMANDS/IDEAS-STILL-IN-THE-WORKS/ CHERRY-ON-TOP-CATEGORY
