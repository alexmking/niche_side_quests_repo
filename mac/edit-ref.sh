#!/bin/bash

# @raycast.schemaVersion 1
# @raycast.title Edit SSOT Refs
# @raycast.mode compact

# Optional:
# @raycast.icon 📝
# @raycast.description Open ssot-refs.txt in VS Code for quick edits

FILE="/usr/local/bin/alexScripts/raycast_scripts/ssot-refs.txt"

# Check if file exists
if [ ! -f "$FILE" ]; then
  echo "File not found: $FILE"
  exit 1
fi

# Open in VS Code
code "$FILE"

