#!/usr/bin/env python3

# @raycast.schemaVersion 1
# @raycast.title Edit SSOT Refs TEST - USING PYTHON
# @raycast.mode silent
# @raycast.description Open ssot-refs.txt in VS Code for quick edits
# @raycast.packageName Developer Utils
# @raycast.icon 📝

# Documentation:
# @raycast.author alexmking921
# @raycast.authorURL https://raycast.com/alexmking921

import os
import subprocess
import sys

# FILE = "D:/git/niche_side_quests_repo/_universal/ssot-refs.md"
FILE = r"D:\git\niche_side_quests_repo\_universal\ssot-refs.md"

# Check if file exists
if not os.path.exists(FILE):
    print(f"File not found: {FILE}")
    sys.exit(1)

# Open in VS Code
subprocess.run(["code", FILE])
