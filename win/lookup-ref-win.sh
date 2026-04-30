# !/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Lookup Ref
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Lookup Ref..." }
# @raycast.description Lookup ssot-ref.md 
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
FILE="D:\git\niche_side_quests_repo\win\ALL_PATHS.txt"

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

# Search for exact matches at the beginning of lines
PRIMARY=$(rg -i "^$QUERY\b" "$FILE")

if [ -n "$PRIMARY" ]; then
  print_header "EXACT MATCH FOUND (exact meaning it's at the start of a line)"
  echo ""
  # Highlight the term first, then add checkmarks
  HIGHLIGHTED=$(highlight_term "$PRIMARY" "$QUERY")
  add_checkmarks "$HIGHLIGHTED"
  echo ""
  
  # Also show related/similar entries
  RELATED=$(rg -i "$QUERY" "$FILE" | grep -v "^$QUERY\b" | head -n 5)
  if [ -n "$RELATED" ]; then
    print_header "MATCHES FOUND not at the start of a line"
    echo ""
    add_yellow_circles "$(highlight_term "$RELATED" "$QUERY")"
    echo ""
  fi
  exit 0
fi

# If no exact match, search for partial matches
RESULTS=$(rg -i "$QUERY" "$FILE" | head -n 20)

if [ -n "$RESULTS" ]; then
  print_header "🔍 SEARCH RESULTS for '$QUERY'"
  echo ""
  add_yellow_circles "$(highlight_term "$RESULTS" "$QUERY")"
  echo ""
  echo "💡 Tip: Try a more specific search term for exact matches"
else
  print_header "❌ NO RESULTS FOUND"
  echo ""
  echo "No entries found for: '$QUERY'"
  echo ""
  echo "💡 SUGGESTIONS:"
  echo "   • Try different keywords or abbreviations"
  echo "   • Check spelling"
  echo "   • Use partial terms (e.g., 'docker' instead of 'dockerfile')"
  echo ""
fi











