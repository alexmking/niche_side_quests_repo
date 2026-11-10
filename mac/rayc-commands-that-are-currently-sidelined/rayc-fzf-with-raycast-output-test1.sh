#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title fzf with raycast output test
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup-Ref..." }
# @raycast.description trying to get an fzf-like interactive search of file CONTENTS to work with raycast 
# @raycast.packageName Developer Utils
# @raycast.icon 👀

# FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-refs.md"
FILE="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/ssot-ref.txt"
FILE2="/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo/win/ssot-workref.txt"


QUERY="$1"

if [ -z "$QUERY" ]; then
  head -n 15 "$FILE"
  exit 0
fi

search_file() {
  local file="$1"

  local primary
  primary=$(rg -i -n --color=always "^$QUERY\b" "$file")
  if [ -n "$primary" ]; then
    echo "━━━ ✅ Exact match/matches found ($(basename "$file")) ━━━"
    echo "$primary"
    return 0
  fi

  local results count
  results=$(rg -i -n -A 3 --color=always "$QUERY" "$file" | head -n 40)
  if [ -n "$results" ]; then
    count=$(rg -i -c "$QUERY" "$file")
    echo "$results"
    echo "━━━ Results for: $QUERY ($count matches in $(basename "$file")) ━━━"
    return 0
  fi

  return 1
}

# Only fall back to FILE2 when FILE has no matches
if search_file "$FILE"; then
  exit 0
fi

echo "━━━ ❌ No results in $(basename "$FILE"); so now trying to search $(basename "$FILE2")... ━━━"
echo ""
search_file "$FILE2" && exit 0

echo "❌ No results in either $(basename "$FILE") or $(basename "$FILE2") for: $QUERY"
