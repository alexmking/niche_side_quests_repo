@echo off
setlocal

set "FILE=D:\git\niche_side_quests_repo\win\ssot-workref.txt"
set "SELF=%~dpnx0"

if /I "%~1"=="--filter" goto :filter

:: Interactive mode — launch fzf in phony mode, reload on every keystroke
set "RELOAD=%SELF% --filter {q}"
fzf --phony --bind "start:reload(%RELOAD%)" --bind "change:reload(%RELOAD%)" --prompt "DEF-" --header "Type to search DEF- entries (prefix added automatically)" --no-sort
goto :eof

:filter
:: Filter mode — called internally by fzf on each keystroke
:: %~2 is the user's typed query; empty at startup (shows all DEF- lines)
if "%~2"=="" (
    findstr /I /C:"DEF-" "%FILE%"
) else (
    findstr /I /C:"DEF-%~2" "%FILE%"
)
