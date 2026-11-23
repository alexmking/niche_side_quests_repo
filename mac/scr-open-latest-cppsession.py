#!/usr/bin/env python3
"""Open the cppsession<N>.cpp with the highest N from the localcpp dir in VS Code.

Files that don't match the exact cppsession<N>.cpp pattern are ignored.
Use --dry-run to print the file instead of opening it.
"""

import re
import subprocess
import sys
from pathlib import Path

# Directory that holds all the cppsession files
LOCALCPP_DIR = Path("/Users/alexking/amk/tools/localcpp")

# Matches "cppsession" + a number (no leading zero) + ".cpp", e.g. cppsession12.cpp.
# The parentheses capture the number so we can compare files numerically.
# Used with fullmatch() so names like "cppsession2.cpp.bak", "cppsession2"
# (compiled binary) or "cppsession_x.cpp" do NOT match.
PATTERN = re.compile(r"cppsession([1-9]\d*)\.cpp")


def main() -> int:
    # Preview mode: print which file would be opened without launching VS Code
    dry_run = "--dry-run" in sys.argv[1:]

    # Bail out early (non-zero exit code) if the directory is missing
    if not LOCALCPP_DIR.is_dir():
        print(f"Directory not found: {LOCALCPP_DIR}", file=sys.stderr)
        return 1

    # Build a list of (number, path) pairs for every file that follows the
    # cppsession<N>.cpp convention. The number is converted to an int so that
    # 25 sorts higher than 8 (as strings, "8" would beat "25").
    # `:=` assigns the regex match to `m` so we can both test it and read the number.
    sessions = [
        (int(m.group(1)), p)
        for p in LOCALCPP_DIR.iterdir()
        if p.is_file() and (m := PATTERN.fullmatch(p.name))
    ]

    # Nothing matched, so there is nothing to open
    if not sessions:
        print(f"No cppsession files found in {LOCALCPP_DIR}", file=sys.stderr)
        return 1

    # max() compares tuples element by element, so this picks the entry with the
    # highest number; we only need its path, so the number is discarded
    _, latest = max(sessions)
    print(f"Opening {latest.name}")

    if dry_run:
        return 0

    # `open -a` works even when the `code` CLI isn't on PATH (e.g. under Raycast).
    # The command's exit code is passed back as this script's exit code.
    return subprocess.run(["open", "-a", "Visual Studio Code", str(latest)]).returncode


# Only run when executed directly (not when imported); pass main()'s return
# value to the shell as the exit code
if __name__ == "__main__":
    sys.exit(main())
