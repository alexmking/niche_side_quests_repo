#!/usr/bin/env python3

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Edit KeybVis TEST USING PYTHON
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📝
# @raycast.description Open keyboard visualization file in VS Code for quick edits
# @raycast.packageName Developer Utils

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

import os
import subprocess
import sys

FILE = "/Users/alexking/local_docs/GIT_STUFF/niche_side_quests_repo/_universal/keyboard-shortcuts.html"

if not os.path.isfile(FILE):
    print(f"File not found: {FILE}")
    sys.exit(1)

subprocess.run(["code", FILE])

