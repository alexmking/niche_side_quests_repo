# !/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Lookup KeybVis
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup KeybVis..." }
# @raycast.description Lookup KeybVis config
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
# FILE="C:\Users\aking\Downloads\cmder\config\user_aliases.cmd"
FILE="D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html"
FILE2="D:\git\niche_side_quests_repo\_universal\vscode-shortcuts.html"

QUERY="$1"

search_file() {
  local file="$1"
  local label
  label=$(basename "${file//\\//}")
  local results
  results=$(rg -i --no-filename "^$QUERY\b" "$file")
  if [ -z "$results" ]; then
    results=$(rg -i --no-filename "$QUERY" "$file" | head -n 20)
  fi

  echo "===== $label ====="
  if [ -n "$results" ]; then
    echo "$results"
  else
    echo "(no matches)"
  fi
  echo
}

if [ -z "$QUERY" ]; then
  for f in "$FILE" "$FILE2"; do
    echo "===== $(basename "${f//\\//}") ====="
    head -n 15 "$f"
    echo
  done
  exit 0
fi

search_file "$FILE"
search_file "$FILE2"
