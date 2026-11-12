#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Close All Finder Wind
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🪓
# @raycast.packageName Developer Utils 

# Documentation:
# @raycast.description Close all finder windows currently open, across all desktops
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

tell application "Finder" to close windows