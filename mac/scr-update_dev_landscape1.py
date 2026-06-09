#!/usr/bin/env python3
"""
scr-update_dev_landscape1.py
----------------------------
Reads taxonomy.json and rules.json from the dev_landscape directory,
then patches the two embedded <script type="application/json"> data blocks
inside index.html in-place.

Usage (from any directory):
    scr-update_dev_landscape1.py
"""

import json
import re
import sys
from pathlib import Path

LANDSCAPE_DIR = Path.home() / "amk/tools/GIT_STUFF/niche_side_quests_repo/_universal/dev_landscape"

def main():
    taxonomy_file = LANDSCAPE_DIR / "taxonomy.json"
    rules_file    = LANDSCAPE_DIR / "rules.json"
    html_file     = LANDSCAPE_DIR / "index.html"

    for f in (taxonomy_file, rules_file, html_file):
        if not f.exists():
            print(f"ERROR: File not found: {f}", file=sys.stderr)
            sys.exit(1)

    taxonomy_json = json.dumps(json.loads(taxonomy_file.read_text()), separators=(",", ":"))
    rules_json    = json.dumps(json.loads(rules_file.read_text()),    separators=(",", ":"))

    src = html_file.read_text()

    src, n1 = re.subn(r'(?<=id="taxonomy-data">)[^<]*', lambda _: taxonomy_json, src)
    src, n2 = re.subn(r'(?<=id="rules-data">)[^<]*',    lambda _: rules_json,    src)

    if n1 != 1 or n2 != 1:
        print(f"ERROR: Expected 1 match each; got taxonomy={n1}, rules={n2}. "
              "Has the HTML structure changed?", file=sys.stderr)
        sys.exit(1)

    html_file.write_text(src)
    print(f"Updated {html_file}")
    print(f"  taxonomy.json  -> {len(taxonomy_json):,} chars")
    print(f"  rules.json     -> {len(rules_json):,} chars")

if __name__ == "__main__":
    main()
