#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Search Refs
# @raycast.mode fullOutput
# @raycast.argument1 { "type": "text", "placeholder": "Search Refs..." }

# FILE="$HOME/ssot-refs.txt"
# /usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt
FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"

QUERY="$1"

if [ -z "$QUERY" ]; then
  head -n 15 "$FILE"
  exit 0
fi

PRIMARY=$(rg -i "^$QUERY\b" "$FILE")

if [ -n "$PRIMARY" ]; then
  echo "$PRIMARY"
  exit 0
fi

rg -i "$QUERY" "$FILE" | head -n 20