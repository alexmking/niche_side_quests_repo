# !/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Lookup WorkRef
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup Ref..." }
# @raycast.description Lookup workref-ssot.md 
# @raycast.packageName Developer Utils
# @raycast.icon 👀


# MISC ICONS I MAY WANT TO USE WITH THIS DOWN THE ROAD: 📌🎯🔎📍⭐👀✨🧙‍♂️🪄"


# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
# FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"
# FILE="/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/mac/.zshrc"
# FILE="D:\git\niche_side_quests_repo\_universal\ssot-refs.md"
# FILE="D:\git\niche_side_quests_repo\win\ALL_PATHS.txt"
# FILE="D:\git\niche_side_quests_repo\win\workRef-ssot.txt"
FILE="D:\git\niche_side_quests_repo\win\ssot-workref.txt"
FILE2="D:\git\niche_side_quests_repo\_universal\ssot-ref.txt"


QUERY="$1"

# Alternative: Focus on excellent visual formatting without relying on colors
# This approach uses Unicode symbols and smart formatting

# Function to add visual separators
print_separator() {
  echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
}

# Function to print section headers with enhanced formatting
print_header() {
  echo ""
  echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
  echo "┃  $1"
  echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
}

# Function to create result boxes
print_result_box() {
  local content="$1"
  echo "╭─────────────────────────────────────╮"
  echo "│ $content"
  echo "╰─────────────────────────────────────╯"
}

# Function to highlight search terms
highlight_term() {
  local text="$1"
  local term="$2"
  if [ -n "$term" ]; then
    # Use a simpler approach to avoid sed multibyte issues
    echo "$text" | awk -v term="$term" 'BEGIN{IGNORECASE=1} {gsub(term, "🎯" term ""); print}'
  else
    echo "$text"
  fi
}

# Function to add checkmark emojis to each match line
add_checkmarks() {
  local text="$1"
  if [ -n "$text" ]; then
    echo "$text" | while IFS= read -r line; do
      if [ -n "$line" ]; then
        echo " $line"
      fi
    done
  fi
}

# Function to add yellow circle emojis for non-exact matches
add_yellow_circles() {
  local text="$1"
  if [ -n "$text" ]; then
    echo "$text" | while IFS= read -r line; do
      if [ -n "$line" ]; then
        echo "🟢 $line"
      fi
    done
  fi
}

if [ -z "$QUERY" ]; then
  print_header "REFERENCE FILE PREVIEW (First 15 lines)"
  echo ""
  head -n 15 "$FILE"
  echo ""
  echo "💡 Usage: Enter a search term to look up specific references"
  echo ""
  exit 0
fi

# Searches the given file and prints results. Returns 1 if nothing matched.
search_file() {
  local file="$1"

  # Search for exact matches at the beginning of lines
  local primary
  primary=$(rg -i "^$QUERY\b" "$file")

  if [ -n "$primary" ]; then
    print_header "EXACT MATCH FOUND in $file (exact meaning it's at the start of a line)"
    echo ""
    # Highlight the term first, then add checkmarks
    add_checkmarks "$(highlight_term "$primary" "$QUERY")"
    echo ""

    # Also show related/similar entries
    local related
    related=$(rg -i "$QUERY" "$file" | grep -v "^$QUERY\b" | head -n 5)
    if [ -n "$related" ]; then
      print_header "MATCHES FOUND not at the start of a line"
      echo ""
      add_yellow_circles "$(highlight_term "$related" "$QUERY")"
      echo ""
    fi
    return 0
  fi

  # If no exact match, search for partial matches
  local results
  results=$(rg -i "$QUERY" "$file" | head -n 20)

  if [ -n "$results" ]; then
    print_header "🔍 SEARCH RESULTS for '$QUERY' in $file"
    echo ""
    add_yellow_circles "$(highlight_term "$results" "$QUERY")"
    echo ""
    echo "💡 Tip: Try a more specific search term for exact matches"
    return 0
  fi

  return 1
}

if search_file "$FILE"; then
  exit 0
fi

# No matches in FILE, so fall back to FILE2
print_header "⚠️ NO MATCHES in $FILE"
echo ""
echo "No entries found for '$QUERY' in $FILE"
echo "Searching $FILE2 instead..."
echo ""

if ! search_file "$FILE2"; then
  print_header "❌ NO RESULTS FOUND IN EITHER FILE"
  echo ""
  echo "No entries found for '$QUERY' in either file:"
  echo "   • $FILE"
  echo "   • $FILE2"
  echo ""
  echo "💡 SUGGESTIONS:"
  echo "   • Try different keywords or abbreviations"
  echo "   • Check spelling"
  echo "   • Use partial terms (e.g., 'docker' instead of 'dockerfile')"
  echo ""
fi















