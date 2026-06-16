#Requires AutoHotkey v2.0

;*##############################
;*# THE SECTIONS OF THIS DOC: search for '   zz-   ' 
;*##############################
;#      1. INITIAL GLOBAL VARIABLES/PATHS        (plus USEFUL REF STUFF (like LEGEND))
;#      2. Fn ROW COMMANDS for app-switching     (most imp obvi)
;#      3. Alt + Z COMMAND (zzshortcuts)         [designated SPECIAL as it's own group section here]
;#      4. Alt + Numpad COMMANDS & (ALT + QWER)  (GLOBAL moving windows 3x3)
;#      5. Alt + Shift + Numpad COMMANDS         (GLOBAL-MISC commands (like VolUp/EmojiPanel etc)
;#      6. Ctrl + Numpad COMMANDS                (app-specific 9 commands) ;![***NOT CREATED YET***] MAY ACTUALLY MOVE THIS ONE AND INSTEAD HAVE IT BE ONE OF THE groups of commands within the MISC SECTION
;#      7. Other/Misc COMMANDS (like Alt + Char or Alt + Shift + char)
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












































; zz- 
;*####################################################################################################
;*####################################################################################################
;*# SECTION 1: INITIAL GLOBAL VARIABLES/PATHS:
;*####################################################################################################
;*####################################################################################################
DetectHiddenWindows(1)

bottomMargin := A_ScreenHeight/24
topMargin := A_ScreenHeight/30
leftAndRightMargin := A_ScreenWidth/160

file_expl := 'explorer.exe' 
cmder := 'C:\Users\aking\Downloads\cmder\vendor\conemu-maximus5\ConEmu64.exe'
chrome := 'chrome.exe'
; vs_code := "C:\Program Files\Microsoft VS Code\Code.exe"
vs_code := "C:\Users\aking\AppData\Local\Programs\Microsoft VS Code\Code.exe"
visual_studio_17 := "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\IDE\devenv.exe"
visual_studio_22 := "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
trello := 'Trello.exe'
; trello_full_path := 'C:\Program Files\WindowsApps\45273LiamForsyth.PawsforTrello_2.15.7.0_x64__7pb5ddty8z1pa\app\Trello.exe'
trello_full_path := 'C:\Program Files\WindowsApps\45273LiamForsyth.PawsforTrello_2.15.13.0_x64__7pb5ddty8z1pa\app\Trello.exe'
excel_gen := 'EXCEL.EXE'
; TEAMS path broken so this is just placeholder for now
; teams := 'C:\Program Files\WindowsApps\MSTeams_25072.1611.3570.1995_x64__8wekyb3d8bbwe\ms-teams.exe'
teams :=  "C:\Program Files\WindowsApps\MSTeams_25255.703.3978.7153_x64__8wekyb3d8bbwe\ms-teams.exe"
github_desktop := "C:\Users\aking\AppData\Local\GitHubDesktop\app-3.4.19\GitHubDesktop.exe"
notepad_plus_plus := "C:\Program Files (x86)\Notepad++\notepad++.exe"
outlook := "OUTLOOK.EXE"

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

; ==================
; ==== LEGEND: =====
; ==================
;=      ^ means Ctrl    
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
SetTitleMatchMode 2

; If WinActive("ahk_exe ConEmu64.exe")
; If WinActive("ahk_exe cmd (Admin)")
; If WinActive("ahk_exe C:\Users\aking\Downloads\cmder\vendor\conemu-maximus5\ConEmu64.exe")
#HotIf WinActive(winTitle_cmder)
{

    ; workaround so that Ctrl + D == fzfDir command in cmder...
    ^d::
    {
        ; Send("!!c")
        Send("!c")
        ; Send("b")
        ; MsgBox "in cmder"
    }

    ; workaround so that Alt+Shift+C == copydir command/alias in cmder...(and that we keep the same Alt+Shift+c command for all copy-path commands across all apps, like vscode,finder,chrome,VisualStudio etc))
    !+c::
    {
        ; Send("!!c")
        ; Send("c")
        ; Send("b")
        ; MsgBox "in cmder"

        ; send c, then enter
        ; Send("c{Enter}")
        Send("copieddir{Enter}")
        ; id := WinActive('A')
        ; MsgBox(id)
    }


}
#HotIf










#HotIf WinActive(winTitle_file_expl)
{
    ; --- AHK v2 ---
    ; alt+Shift+c => Copy selected file(s) full path(s) in fileExplorer. If no selection, copy current directory path
    !+c::{
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
























; zz-fn
;*####################################################################################################
;*####################################################################################################
;*# SECTION 2: Fn ROW COMMANDS for app-switching:
;*####################################################################################################
;*####################################################################################################
; REMINDER: of how the "Send #{1}" type of commands kill TWO-BIRDS with ONE-STONE, so don't need any IF( ) checks and can simply put (Win+1) 
; FOR FILE EXPL
; currently using roundabout approach where I use AHK to send the (WinKey+1) command instead of simply having the LogiOptions itself be the (Winkey+1)
^!F1::
^!+F1::
{
    ; we want to (send WinKey + 1) command (to simulate the same thing my Logioptions is doing for F1)
    Send '#{1}' ; Note the original F1 code (which wasn't working well) is saved in the king_app_switcher1_SANDBOX.ahk file if we end up needing it to ref at some pt
    return
}

; FOR CMDER
; currently using roundabout approach where I use AHK to send the (WinKey+1) command instead of simply having the LogiOptions itself be the (Winkey+1)
^!F2::
^!+F2::
{
    ; we want to (send WinKey + 2) command (to simulate the same thing my Logioptions is doing for F2)
    Send '#{2}'
    ; Note the original F1 code (which wasn't working well) is saved in the king_app_switcher1_SANDBOX.ahk file if we end up needing it to ref at some pt
    return
}

; FOR CHROME
^!F3::
^!+F3::
{
    SetTitleMatchMode 1
    ; SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    If !WinExist(winTitle_chrome)
    {
        Run(chrome)
		Sleep(300) ; trying to fix error when switching to chrome when it's not already running.
		WinWait(winTitle_chrome)
    }
    
    ; ---------------------------------------
    ; TODO: ADD MORE FUNCTIONALITY HERE
    ; ---------------------------------------

    ; SOL3 
    WinWait(winTitle_chrome)
    WinActivate(winTitle_chrome)
    WinWaitActive(winTitle_chrome)

    return
}

; VS_CODE || VISUALSTUDIO-17/22
; CURRENT BUG WHERE the VisualStudio2017/22 Functionalitt ONLY works if it's in the same WORKSPACE as VSCODE...
; So this may MEAN it's a TIMING issue? I need to give it more time to find the window instance across worksapces? IDK
^!F4::
^!+F4::
{

    ; SetTitleMatchMode 1
    SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    ; if(1 == 1)
    ; {
    ;     ; UPDATE: was NOT able to get any of these to SWITCH to VisualStudio 17 or 22 when in vscode window
    ;     ; UPDATE2: Even when NOT already in vs code, I cant get any switching to work for VS17/22
    ;     ;! Maybe just needs a comp restart or something in windows 11 powertoys is messing this up
    ;     WinWait(winTitle_visual_studio_17)
    ;     Sleep(1000)

    ;     WinActivate(winTitle_visual_studio_17)
    ;     Sleep(1000)

    ;     WinWaitActive(winTitle_visual_studio_17)
    ;     Sleep(1000)

    ;     WinWait(winTitle_visual_studio_22)
    ;     Sleep(1000)

    ;     WinActivate(winTitle_visual_studio_22)
    ;     Sleep(1000)
        
    ;     WinWaitActive(winTitle_visual_studio_22)
    ;     Sleep(2000)
    ;     MsgBox "DEBUG: reading as if in the F4 hotkey"
    ;     return
    ; }

    ; TOTAL of FOUR DIFFERENT CASES TO HANDLE:
    ; CASE1: vs_code is not running, so launch it, then done
    If !WinExist(winTitle_vs_code)
    {
        Run(vs_code)
        WinWait(winTitle_vs_code)
        return
    }

    ;! THIS FEAT NOW WORKS AFTER WINDOWS 11 UPDATE :D  [at least for VisualStudio2022]
    ;! So now I can swap back and forth between VisualStudio and VSCode windows with the same single F4 key that is for go-to-VSCODE
    ; ; TESTING TO SEE IF THIS CAN EVEN SWITCH to VisualStudio at all...
    ; WinWait(winTitle_visual_studio_17)
    ; WinActivate(winTitle_visual_studio_17)
    ; WinWaitActive(winTitle_visual_studio_17)
    ; ; RESULT ==> YES THIS DID WORK and succesffuly switch to visualstudio2017, SO the issue must be something else? 

    ; CASE2: handling the MOST COMMON use-case where we're NOT already on vs-code and want to switch to it
    If !WinActive(winTitle_vs_code)
    {
        ; SOL3 attemtping to switch to the vs_code window...
        WinWait(winTitle_vs_code)
        WinActivate(winTitle_vs_code)
        WinWaitActive(winTitle_vs_code)
        return
    }
    
    ; CASE3: we're ALREADY on vs-code window, so we want to switch to any VisualStudio2017 instance if any exist
    If WinActive(winTitle_vs_code) && WinExist(winTitle_visual_studio_17)
    {
        ; MsgBox "DEBUG: reading as if in the F4 hotkey and already on VSCode window"
        ; were already on vs-code window AND there's a visualStudio window that exists,
        ; so try and switch to that window now... 
        ; BUG ALERT: only is working when vscode is in same worksapce as VisualStudio....
        Sleep(1000)
        WinWait(winTitle_visual_studio_17)
        Sleep(1000)
        WinActivate(winTitle_visual_studio_17)
        Sleep(1000)
        WinWaitActive(winTitle_visual_studio_17)
        Sleep(1000)

        msgBox "DEBUG: finished trying to switch to VisualStudio2017 window"
        ; return
    }
    ; CASE4: we're ALREADY on vs-code window, so we want to switch to any VisualStudio2017 instance if any exist
    else If WinActive(winTitle_vs_code) && WinExist(winTitle_visual_studio_22)
    {
        ; were already on vs-code window AND there's a visualStudio window that exists,
        ; so try and switch to that window now... 
        ; BUG ALERT: only is working when vscode is in same worksapce as VisualStudio....
        WinWait(winTitle_visual_studio_22)
        ; Sleep(1000)

        WinActivate(winTitle_visual_studio_22)
        ; Sleep(1000)

        WinWaitActive(winTitle_visual_studio_22)
        ; Sleep(1000)
        ; msgBox "DEBUG: finished trying to switch to VisualStudio2022 window"


    }

    ; MsgBox "reading already in vsC"
    return
}

; TEAMS
; UPDATE: went back to LogiOption straight key-shortcut instead of going through AHK bc this was buggy (like it not being able to switch if youre currently in VisualStudio 2017)
; currently using roundabout approach where I use AHK to send the (WinKey+1) command instead of simply having the LogiOptions itself be the (Winkey+1)
; BUGFIX is LIKELY JUST NEED TO ADD SOME 'WAIT' and or 'PAUSE' commands around the SEND() but idk...
^!F5::
^!+F5::
{
    ; we want to (send WinKey + 5) command (to simulate the same thing my Logioptions is doing for F5)
    Send '#{5}' ; Note the original F1 code (which wasn't working well) is saved in the king_app_switcher1_SANDBOX.ahk file if we end up needing it to ref at some pt
    return
}

; TRELLO
; NOTE I'm removing the 'SHIFT' from this hotjey to avoid the dumb M365-CoPilot launch action that's for some reason designated to the ^!+F6 giant-ass hotkey
; NOTE2: I had to FURTHER devolve this down to ALT-F6 just bc stupid COPILOT is now overridding my (Alt + Ctrl + F6) command which was ALREADY meant to be avoiding the FIRST TIME COPILOT stole the global shrotcut
!F6::
^!F6::
^!+F6::
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

; EXCEL-ref_sheet2025-speciic file
^!F7::
^!+F7::
{
    ; SetTitleMatchMode 1
    SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    winTitle_excel_gen := "ahk_exe EXCEL.EXE"

    If !WinExist("ref_sheet2025.xlsx - Excel")
    {
        Run("C:\Users\aking\quick_ref\ref_sheet2025.xlsx - Excel")
        WinWait("ref_sheet2025.xlsx - Excel")
    }

    ; SOL3 
    WinActivate("ref_sheet2025.xlsx - Excel")

    return
}

; EXCEL-zzshortcuts-speciic file
^!F8::
^!+F8::
{
    ; SetTitleMatchMode 1
    SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    winTitle_excel_gen := "ahk_exe EXCEL.EXE"

    If !WinExist("zzshortcuts.xlsm - Excel")
    {
        Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")
        WinWait("zzshortcuts.xlsm - Excel")
    }

    ; SOL3 
    WinActivate("zzshortcuts.xlsm - Excel")
    return
}



;#3   zz-altz            
;*####################################################################################################
;*####################################################################################################
;*# SECTION 3: (ALT-Z) zzshortcuts:
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
!z::
!+z::
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
    If !WinExist(zzshortcuts)
    {
        MsgBox "RUT ROH!!! it's reading as if NO EXCEL zzshorts is running atm"
        Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")
        WinWait(zzshortcuts)
    }

    If WinActive(winTitle_file_expl)
    {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{x}'
        return
    }

    If WinActive(winTitle_cmder)
    {
        MsgBox winTitle_cmder
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{t}'
        return
    }

    If WinActive(winTitle_chrome)
    {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{g}'
        return
    }

    ; jumps to VS sheet either of the 3 (vscode, studio17, studio22) ;! BROKEN for the Studio17 and Studio22 window det (VSCODE window det DOES work)
    If WinActive(winTitle_vs_code || winTitle_visual_studio_17 || winTitle_visual_studio_22 || "ahk_exe devenv.exe")
    {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{j}'
        return
    }

    ; TODO this TEAMS one is broken (likely due to same TEAMS-only issue of not being able to detect TEANS is already open)
    If WinActive(winTitle_teams)
    {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{k}'
        return
    }


    If WinActive(winTitle_trello)
    {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{l}'
        return
    }


    If WinActive(winTitle_excel_gen)
    {
        WinActivate(zzshortcuts)
        WinWait(zzshortcuts) ; SOL1 TO FIX STICKY-KEY ISSUE
        ; Sleep(100) ; SOL2 TO FIX STICKY-KEY ISSUE [uncomment if SOL1 doesn't work]
        ; SOL3 last resort: increase the SLEEP time until it works, otherwise we know it's not a time issue
        Send '^{e}'
        return
    }


    If WinActive(winTitle_github_desktop)
    {
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




























































;#4   zz-altnumpad       
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
    WinGetPos(,, &Width, &Height, 'A')
    WinMove(leftAndRightMargin,A_ScreenHeight-Height-(bottomMargin),,,'A')
    ; WinMove(0,A_ScreenHeight-Height-(A_ScreenHeight/24),,,'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    ; MsgBox A_ScreenHeight ; 1440 height for DELL MONITOR, laptop height ??? ____ ??? FIXME
    ; MsgBox A_ScreenWidth ; 1440 height for DELL MONITOR, laptop height ??? ____ ??? FIXME
    return
}
; move-window-BOTTOM-RIGHT (NO-resizing, only moving)
!Numpad3::
{
    WinGetPos(,, &Width, &Height, 'A')
    WinMove(A_ScreenWidth-Width-(leftAndRightMargin),A_ScreenHeight-Height-(bottomMargin),,,'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
; move-window-TOP-LEFT (NO-resizing, only moving)
!Numpad7::
{
    WinMove(leftAndRightMargin,topMargin,,, 'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case

    return 
}
; move-window-TOP-RIGHT (NO-resizing, only moving)
!Numpad9::
{
    WinGetPos(,, &Width, &Height, 'A')
    WinMove(A_ScreenWidth-Width-(leftAndRightMargin),topMargin,,,'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
; move-window-CENTER (NO-resizing, only moving)
!Numpad5::
{
    WinGetPos ,, &Width, &Height, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
    return
}

; ---------------------------
; remaining Numpad-2,4,6,8 (the less imp ones)
; ---------------------------
!Numpad2::
{
    WinGetPos(,, &Width, &Height, 'A')
    WinMove((A_ScreenWidth/2)-(Width/2),A_ScreenHeight-Height-(bottomMargin),,,'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}

!Numpad4::
{
    WinGetPos(,, &Width, &Height, 'A')
    WinMove(leftAndRightMargin,(A_ScreenHeight/2)-(Height/2),,,'A')
    ; Sleep(100) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
!Numpad6::
{
    WinGetPos(,, &Width, &Height, 'A')
    WinMove(A_ScreenWidth-Width-(leftAndRightMargin),(A_ScreenHeight/2)-(Height/2),,,'A')
    ; Sleep(100) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
!Numpad8::
{
    WinGetPos(,, &Width, &Height, 'A')
    WinMove((A_ScreenWidth/2)-(Width/2),topMargin,,,'A')
    ; Sleep(500) ; this sleep can be deleted (99% sure) but keeping for now just in case
    return
}
!Numpad0::
{
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos ,, &Width, &Height, "A"
    WinMove ,,(A_ScreenWidth*(19/20)),(A_ScreenHeight*(9/10)), "A"

    ; SECOND: center the window (same as numpad5 code above)
    WinGetPos ,, &Width, &Height, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (((A_ScreenHeight/2)-(Height/2)) - A_ScreenHeight/200),,, "A"
    return
}

; ---------------------------------------------------------------------------------------------------------------------
; ------- ALT-QWER resize-window (enhanced to adjust based on screensize instead of hardcoded pixels like glazeWM has rn) ----------
; ---------------------------------------------------------------------------------------------------------------------
; move-window-CENTER (NO-resizing, only moving)
!q::
{
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos ,, &Width, &Height, "A"
    WinMove ,,(A_ScreenWidth*(3/10)),(A_ScreenHeight*(3/10)), "A"
    ; SECOND: center the window (same as numpad5 code)
    WinGetPos ,, &Width, &Height, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
    return
}

!w::
{
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos ,, &Width, &Height, "A"
    WinMove ,,(A_ScreenWidth*(2/5)),(A_ScreenHeight*(2/5)), "A"
    ; SECOND: center the window (same as numpad5 code)
    WinGetPos ,, &Width, &Height, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
    return
}

!e::
{
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos ,, &Width, &Height, "A"
    WinMove ,,(A_ScreenWidth*(1/2)),(A_ScreenHeight*(1/2)), "A"
    ; SECOND: center the window (same as numpad5 code)
    WinGetPos ,, &Width, &Height, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
    return
}

!r::
{
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos ,, &Width, &Height, "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(4/12))), "A"
    ; WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5) + (A_ScreenHeight*(1/12))), "A"
    WinMove ,,(A_ScreenWidth*(3/5)),(A_ScreenHeight*(3/5)), "A"
    ; SECOND: center the window (same as numpad5 code)
    WinGetPos ,, &Width, &Height, "A"
    ; WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)-(A_ScreenHeight/10),,, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
    return
}

;! EXPERIMENTAL alt-Y resize just for TRELLO (tall-skinny)
!y::
!+y::
!h::
{
    ; MsgBox "debug - this is the experimental alt-y resize just for trello (tall-skinny)"
    ; FIRST RESIZE WINDOW to almost full screen...
    WinGetPos ,, &Width, &Height, "A"
    WinMove ,,(A_ScreenWidth*(1/5)),(A_ScreenHeight*(4/5)), "A"
    ; SECOND: center the window (same as numpad5 code)
    WinGetPos ,, &Width, &Height, "A"
    WinMove (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2),,, "A"
    return
}



   
;#5   zz-altshiftnumpad  
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
    If !WinExist("env_optimizations.xlsx - Excel")
    {
        Run("C:\Users\aking\quick_ref\env_optimizations.xlsx - Excel")
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
    MsgBox "6"
    ; C:\Users\aking\quick_ref\env_optimizations.xlsx
    SetTitleMatchMode 2
    If !WinExist("AutoHotkey Dash")
    {
        Run("C:\Users\aking\AppData\Local\Programs\AutoHotkey\UX\AutoHotkeyUX.exe")
        WinWait("AutoHotkey Dash")
    }
    ; SOL3 
    WinActivate("AutoHotkey Dash")
    return
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
    If !WinExist("Microsoft 365 Copilot")
    {
        ; MsgBox "RUT ROH!!! it's reading as if NO M365 Copilot is running atm"
        Run("C:\Program Files\WindowsApps\Microsoft.MicrosoftOfficeHub_19.2507.39131.0_x64__8wekyb3d8bbwe\WebViewHost.exe")
        WinWait("Microsoft 365 Copilot")
    }
    else
    {
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

    If !WinExist(winTitle_github_desktop)
    {
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



















;#6   zz-ctrlnumpad      
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

















































































;#7   zz-other           
;*####################################################################################################
;*####################################################################################################
;*# SECTION 7: Other/Misc COMMANDS (like Alt + Char or Alt + Shift + char)
;*####################################################################################################
;*####################################################################################################


















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
w:: Send "{Ctrl down}{Alt down}{LWin down}w{LWin up}{Alt up}{Ctrl up}"
;ANOTHER!!! STUPID COPILOT one that needs to be altered around >:/
e:: Send "{Ctrl down}{Alt down}{LWin down}e{LWin up}{Alt up}{Ctrl up}"
; STUPID TEAMS one that needs to be altered around >:/ 
t:: Send "{Ctrl down}{Alt down}{LWin down}t{LWin up}{Alt up}{Ctrl up}"
; STUPID AI-MICROSOFT page one that needs to be altered around >:/
y:: Send "{Ctrl down}{Alt down}{LWin down}y{LWin up}{Alt up}{Ctrl up}"
; STUPID OUTLOOK one that needs to be altered around >:/
o:: Send "{Ctrl down}{Alt down}{LWin down}o{LWin up}{Alt up}{Ctrl up}"
; STUPID POWERPOINT one that needs to be altered around >:/
p:: Send "{Ctrl down}{Alt down}{LWin down}p{LWin up}{Alt up}{Ctrl up}"    
; STUPID ONEDRIVE one that needs to be altered around >:/w
d:: Send "{Ctrl down}{Alt down}{LWin down}d{LWin up}{Alt up}{Ctrl up}"
; STUPID LINKEDIN one that needs to be altered around >:/w
l:: Send "{Ctrl down}{Alt down}{LWin down}l{LWin up}{Alt up}{Ctrl up}"
; STUPID EXCEL one that needs to be altered around >:/
x:: Send "{Ctrl down}{Alt down}{LWin down}x{LWin up}{Alt up}{Ctrl up}"
; STUPID COPILOT one that needs to be altered around >:/
c:: Send "{Ctrl down}{Alt down}{LWin down}c{LWin up}{Alt up}{Ctrl up}"
; ANOTHER STUPID COPILOT one that needs to be altered around >:/
v:: Send "{Ctrl down}{Alt down}{LWin down}v{LWin up}{Alt up}{Ctrl up}"
; STUPID ONENOTE one that needs to be altered around >:/
n:: Send "{Ctrl down}{Alt down}{LWin down}n{LWin up}{Alt up}{Ctrl up}"

q:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}q{LWin up}{Alt up}{Shift up}{Ctrl up}"
r:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}r{LWin up}{Alt up}{Shift up}{Ctrl up}"
u:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}u{LWin up}{Alt up}{Shift up}{Ctrl up}"
i:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}i{LWin up}{Alt up}{Shift up}{Ctrl up}"
a:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}a{LWin up}{Alt up}{Shift up}{Ctrl up}"
s:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}s{LWin up}{Alt up}{Shift up}{Ctrl up}"
f:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}f{LWin up}{Alt up}{Shift up}{Ctrl up}"
g:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}g{LWin up}{Alt up}{Shift up}{Ctrl up}"
h:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}h{LWin up}{Alt up}{Shift up}{Ctrl up}"
j:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}j{LWin up}{Alt up}{Shift up}{Ctrl up}"
k:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}k{LWin up}{Alt up}{Shift up}{Ctrl up}"
b:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}b{LWin up}{Alt up}{Shift up}{Ctrl up}"
m:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}m{LWin up}{Alt up}{Shift up}{Ctrl up}"
z:: Send "{Ctrl down}{Shift down}{Alt down}{LWin down}z{LWin up}{Alt up}{Shift up}{Ctrl up}"



; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; +++++++++++++++++++++ CLEVER IDEA WORTH PLAYING AROUND W ITH +++++++++++++++++++++++
; UNIQUE one just for 'open curr file in vscode' (from raycast)
4::Send "{Ctrl down}{Alt down}{LWin down}4{LWin up}{Alt up}{Ctrl up}"
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
1::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}1{LWin up}{Alt up}{Shift up}{Ctrl up}" ; THIS SHOULD open in FILE-EXPL (bc F1 == jump to file-expl)
2::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}2{LWin up}{Alt up}{Shift up}{Ctrl up}" ; THIS SHOULD open in CMDER (bc F2 == jump to cmder)
3::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}3{LWin up}{Alt up}{Shift up}{Ctrl up}" ; THIS SHOULD open in CHROME (bc F3 == jump to chrome)
5::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}5{LWin up}{Alt up}{Shift up}{Ctrl up}" ; THIS SHOULD open in TEAMS (bc F5 == jump to teams)
6::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}6{LWin up}{Alt up}{Shift up}{Ctrl up}" ; THIS SHOULD open in TRELLO (bc F6 == jump to trello)
7::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}7{LWin up}{Alt up}{Shift up}{Ctrl up}" ; THIS SHOULD open in EXCEL (bc F7 == jump to excel)
8::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}8{LWin up}{Alt up}{Shift up}{Ctrl up}" ; etc 
9::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}9{LWin up}{Alt up}{Shift up}{Ctrl up}" ; etc
0::Send "{Ctrl down}{Shift down}{Alt down}{LWin down}0{LWin up}{Alt up}{Shift up}{Ctrl up}" ; etc
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






































; #####################################################
; ######## the 'Float-window-on-top' shortcut #########
; #####################################################
!b::
{
    Send '^#{t}'
    return
}

; #####################################################
; ######## the 'LAUNCH ALL MAIN-APPS' shortcut ########
; #####################################################
; Cmder, chrome, vscode?, trello, excel-ref, excel-zzshorts, github-desktopm glaze/auto-tiling-script
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

    If !ProcessExist("GlazeWM")
    {
        Run("C:\Program Files\glzr.io\GlazeWM\glazewm.exe")
        Sleep(1000)
    }

    If !WinExist(winTitle_cmder)
    {
        ; Run(cmder), WinWait(winTitle_cmder)
        Send '#{2}'
    }

    SetTitleMatchMode 1
    If !WinExist(winTitle_chrome)
    {
        Run(chrome), WinWait(winTitle_chrome)
    }

    SetTitleMatchMode 2
    If !WinExist(winTitle_vs_code)
    {
        Run(vs_code), WinWait(winTitle_vs_code)
    }
        
    SetTitleMatchMode 1
    If !WinExist(winTitle_trello)
    {
        ; Run(trello)
        Send '#{6}'
        ; WinWait(winTitle_trello)
    }
    
    SetTitleMatchMode 2
    If !WinExist("ref_sheet2025.xlsx - Excel")
    {
        Run("C:\Users\aking\quick_ref\ref_sheet2025.xlsx - Excel")
        WinWait("ref_sheet2025.xlsx - Excel")
    }

    If !WinExist("zzshortcuts.xlsm - Excel")
    {
        Run("C:\Users\aking\quick_ref\zzshortcuts.xlsm - Excel")
        WinWait("zzshortcuts.xlsm - Excel")
    }

    SetTitleMatchMode 2
    If !WinExist(winTitle_github_desktop)
    {
        Run(github_desktop), WinWait(winTitle_github_desktop)
    }

    SetTitleMatchMode 2
    If !WinExist(winTitle_outlook)
    {
        Run(outlook)
        WinWait(winTitle_outlook)
    }

    ; *** LAST STEP: *** switch to terminal
    Send '#{2}'
    return
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
















































































;#8   zz-etc
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
    If WinActive(winTitle_file_expl)
    {
        Send '{F2}'
        return
    }

    If WinActive(winTitle_cmder)
    {
        Send '^{t}'
        return
    }


    If WinActive(winTitle_chrome)
    {
        Send '^{t}'
        return
    } 


    If WinActive(winTitle_vs_code)
    {
        Send '^{t}'
        return
    }

    ; TODO this TEAMS one is broken (likely due to same TEAMS-only issue of not being able to detect TEANS is already open)

    If WinActive(winTitle_teams)
    {
        Send '^{g}'
        return
    }


    If WinActive(winTitle_trello)
    {
        Send '{n}'
        return
    }


    If WinActive(winTitle_excel_gen)
    {
        Send '{F2}'
        return
    }

    If WinActive(winTitle_github_desktop)
    {
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
^!+x::
{
    SetTitleMatchMode 1 ; using the STARTS-WITH matching for this experimental tab idea stuff
    ; SetTitleMatchMode 2
    ; SetTitleMatchMode 3

    ; OTHER WEBPAGES / APPS we may want to include in this commands string of if's below
    ; 1) My Work webpage
    ; 2) Code Reviews assigned to you GITHUB page
    ; 3) 
    ; 4)
    ; ****THE SMALL PROBLEM W THIS COMMAND: ****
        ; it requires the tab spot to be specific spot before 
        ; exec the command, otherwise the 20+ tabs will be off-by certain number of tabs
    ; ****THE SOLUTION: ****
        ; we need some 'reset'-like key combination to send BEFORE all the tabs so
        ; that the location of the 'tab' can be reset to the same place it was initially.
        ; this way we know our consecutive tabs will always bring us to the desired location on
        ; the page, regardless of where the current 'tab' spot is on the page when we exec this command
        ; NOTE i tried to 'esc' key but that doesn't seem to 'reset' the tab spot like I thought it might
    ; ****ALTERNATIVE STRATEGY:****
        ; jumping to specific HTML elements w/i page itself (via inspect)
        ; https://www.google.com/search?q=autohotkey+jump+to+specific+element+in+webpage&rlz=1C1GCEB_enUS1061US1061&oq=autohotkey+jump+to+specific+element+in+webpage&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIHCAEQIRigATIHCAIQIRigATIHCAMQIRigATIHCAQQIRigATIHCAUQIRigATIHCAYQIRifBdIBCTE2MjAyajBqMagCALACAA&sourceid=chrome&ie=UTF-8
        ; if possible, this sol would likely be VASTLY superior to my hacky 'tab-x-times' approach
    If WinActive("[SWR")
    {
        ; this is a JIRA ISSUE page, so we want to tab 26 times to get to the submenu we want
        ; ==================================================================
        ; JUMPS TO 'Overview' tab on Chrome-Jira-SWR webpage (26 total tabs)
        ; ==================================================================
        Send("{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}")
    }
    else If WinActive("Your work")
    {
        ; this is the 'Your Work' jira page (needs 35 tabs to get to useful spot)
        Send("{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}")
    }
    else If WinActive("SWR") or WinActive("WPS")
    {
        ; this must be a GITHUB-PR webpage, so we want to tab tot of 21 times to get to submenu we want
        ;==================================================================
        ; JUMPS TO 'Conversation' tab on Chrome-Github-PR webpage (21 total tabs)
        ;==================================================================
        Send("{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}")
    }
    else If WinActive("Pull requests")
    {
        ; this is the List of CODE REVIEWS assigned to me webpage (needs 20 tot tabs)
        Send("{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}")
    }

    return
}

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
;# TIP: search for 'zz-' and then can quickly jump to each section even if dont have full keyword for the section I want'
;*-------------------------------------------------------------------------
;#   zz-                1. INITIAL GLOBAL VARIABLES/PATHS        (plus USEFUL REF STUFF (like LEGEND))
;#   zz-fn              2. Fn ROW COMMANDS for app-switching     (most imp obvi)
;#   zz-altz            3. Alt + Z COMMAND (zzshortcuts)         [designated SPECIAL as it's own group section here]
;#   zz-altnumpad       4. Alt + Numpad COMMANDS & (ALT + QWER)  (GLOBAL moving windows 3x3)
;#   zz-altshiftnumpad  5. Alt + Shift + Numpad COMMANDS         (GLOBAL-MISC commands (like VolUp/EmojiPanel etc)
;#   zz-ctrlnumpad      6. Ctrl + Numpad COMMANDS                (app-specific 9 commands) ;![***NOT CREATED YET***] MAY ACTUALLY MOVE THIS ONE AND INSTEAD HAVE IT BE ONE OF THE groups of commands within the MISC SECTION
;#   zz-other           7. Other/Misc COMMANDS (like Alt + Char or Alt + Shift + char)
;#   zz-etc             8. EVERYTHING-ELSE: COMMANDS/IDEAS-STILL-IN-THE-WORKS/ CHERRY-ON-TOP-CATEGORY

























