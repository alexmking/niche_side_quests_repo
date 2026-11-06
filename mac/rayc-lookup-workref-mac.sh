#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Lookup-WorkRef
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup-WorkRef..." }
# @raycast.description lookup ssot-workref doc
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ref-official-conventions-&-guidelines.txt"
FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/win/ssot-workref.txt"


QUERY="$1"

if [ -z "$QUERY" ]; then
  head -n 15 "$FILE"
  exit 0
fi

PRIMARY=$(rg -i -n --color=always "^$QUERY\b" "$FILE")

if [ -n "$PRIMARY" ]; then
  echo "━━━ Exact match ━━━"
  echo "$PRIMARY"
  exit 0
fi

# echo "━━━ Results for: $QUERY ━━━"
# rg -i -n --color=always "$QUERY" "$FILE" | head -n 20
# rg -i -n -A 3 --color=always "$QUERY" "$FILE" | head -n 40




TOTAL=$(rg -i -n -A 3 --color=always "$QUERY" "$FILE" | head -n 40)
rg -i -n -A 3 --color=always "$QUERY" "$FILE" | head -n 40
echo "━━━ Results for: $QUERY ($TOTAL matches) ━━━"