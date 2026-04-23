#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Path keybvis
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📍
# @raycast.packageName Develop Utils

# Documentation:
# @raycast.description pastes the path of the said file (whatever path I set in the 'path_to_paste' variable in this script)
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

import subprocess
import sys

#### JUST COMMENT OUT WHICHEVER PATH YOU WANT THIS SCRIPT TO CAPTURE...
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/aerospace.toml"
# path_to_paste = "/Users/alexking/Desktop/DESKTOP_SHELF/2024_and_prior/TEMPORARY_FOLDER_TO_CLEAR_DESKTOP_UNTIL_INTERNSHIP_SEARCHDONE/zzmadden06playbook_21.txt"
# path_to_paste = "/Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm"
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac/.p10k.zsh"
# path_to_paste = "/Users/alexking/.zprofile"
# path_to_paste = "/Users/alexking/.oh-my-zsh/"
# path_to_paste = "/usr/local/Cellar/fzf/0.67.0/shell/key-bindings.zsh"
# path_to_paste = "/Users/alexking/Library/Mobile Documents/com~apple~CloudDocs/Screenshot Sorter 2.0"
# path_to_paste = "/Users/alexking/amk/notes/quick_ref"
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo"
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/mac"
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal"
# path_to_paste = "/Users/alexking/amk/"
# path_to_paste = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/scr-leet_morning_random.py


# Copy path to clipboard
subprocess.run(["pbcopy"], input=path_to_paste.encode())

# Spawn a detached subprocess that waits for Raycast to close, then pastes
paste_script = """
import ctypes, time


# wait for Raycast to dismiss and previous window to regain focus
# time.sleep(0.5)
# time.sleep(0.2)
# time.sleep(0.1)
# time.sleep(0.05)  
# time.sleep(0.02)  # MAY NEED TO INCREASE THIS IF PASTING HAPPENS BEFORE RAYCAST DISMISSES (so it pastes into raycast search bar instead of the intended window)

#----------------------------------------------------------------------------------------------------
# NOTE: the sleep/wait above seems to no longer be needed now that we're using 'silent' mode, but 
# be aware we may need to reintroduce it if pasting issues occur
#----------------------------------------------------------------------------------------------------

CG = ctypes.cdll.LoadLibrary("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics")
CG.CGEventCreateKeyboardEvent.restype = ctypes.c_void_p
CG.CGEventCreateKeyboardEvent.argtypes = [ctypes.c_void_p, ctypes.c_uint16, ctypes.c_bool]
CG.CGEventSetFlags.argtypes = [ctypes.c_void_p, ctypes.c_uint64]
CG.CGEventPost.argtypes = [ctypes.c_uint32, ctypes.c_void_p]
CG.CFRelease.argtypes = [ctypes.c_void_p]

kCGHIDEventTap = 0
kCGEventFlagMaskCommand = 0x100000
v_keycode = 9  # 'v'

for is_down in (True, False):
    event = CG.CGEventCreateKeyboardEvent(None, v_keycode, is_down)
    CG.CGEventSetFlags(event, kCGEventFlagMaskCommand)
    CG.CGEventPost(kCGHIDEventTap, event)
    CG.CFRelease(event)
"""

subprocess.Popen(
    [sys.executable, "-c", paste_script],
    start_new_session=True,
    stdout=subprocess.DEVNULL,
    stderr=subprocess.DEVNULL,
)
# Main script exits here → Raycast (silent mode) dismisses → previous window regains focus → subprocess pastes

# /Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm

# /Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm

# time.sleep(0.5)  # wait for Raycast to dismiss and previous window to regain focus

# time.sleep(0.5)  # wait for Raycast to dismiss and previous window to regain focus
# /Users/alexking/amk/notes/quick_ref/zzshortcuts.xlsm

