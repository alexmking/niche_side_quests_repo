@echo off

REM @raycast.schemaVersion 1
REM @raycast.title Edit SSOT Refs TEST - USING BATCH
REM @raycast.mode silent
REM @raycast.description Open ssot-refs.txt in VS Code for quick edits
REM @raycast.packageName Developer Utils
REM @raycast.icon 📝

REM Documentation:
REM @raycast.author alexmking921
REM @raycast.authorURL https://raycast.com/alexmking921

set "FILE=D:\git\niche_side_quests_repo\_universal\ssot-refs.md"

REM Check if file exists
if not exist "%FILE%" (
    echo File not found: %FILE%
    exit /b 1
)

REM Open in VS Code
code "%FILE%"
