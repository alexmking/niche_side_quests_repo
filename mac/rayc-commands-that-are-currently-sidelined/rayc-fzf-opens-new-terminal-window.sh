#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title fzf ref.txt by opening new terminal 
# @raycast.mode silent
# @raycast.icon 👀

osascript <<'APPLESCRIPT'
tell application "Terminal"
  activate
  set t to do script "cat /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-ref.txt /Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/win/ssot-workref.txt | fzf --reverse --no-sort; exit"
  set w to first window whose tabs contains t
  try
    repeat while (processes of t) is not {}
      delay 0.2
    end repeat
    close w saving no
  end try
end tell
APPLESCRIPT
