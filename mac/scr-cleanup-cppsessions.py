#!/usr/bin/env python3
"""Delete every cppsession<N>.cpp in the localcpp dir except cppsession1.cpp.

Files that don't match the exact cppsession<N>.cpp pattern are left alone.
Use --dry-run to preview without deleting.
"""

import re
import sys
from pathlib import Path

# Directory that holds all the cppsession files
LOCALCPP_DIR = Path("/Users/alexking/amk/tools/localcpp")

# The one session file that must never be deleted
KEEP = "cppsession1.cpp"

# Matches "cppsession" + a number (no leading zero) + ".cpp", e.g. cppsession12.cpp.
# Used with fullmatch() so names like "cppsession2.cpp.bak", "my_cppsession2.cpp",
# "cppsession2" (compiled binary) or "cppsession_x.cpp" do NOT match.
PATTERN = re.compile(r"cppsession[1-9]\d*\.cpp")


def main() -> int:
    # Preview mode: report what would be deleted without touching any files
    dry_run = "--dry-run" in sys.argv[1:]

    # Bail out early (non-zero exit code) if the directory is missing
    if not LOCALCPP_DIR.is_dir():
        print(f"Directory not found: {LOCALCPP_DIR}", file=sys.stderr)
        return 1

    # Collect the files to delete: regular files whose name follows the
    # cppsession<N>.cpp convention, excluding the one we want to keep.
    # They're sorted by the number in the name (2, 3, ..., 10) rather than
    # alphabetically (which would put 10 before 2) so output reads in order.
    targets = sorted(
        (
            p
            for p in LOCALCPP_DIR.iterdir()
            if p.is_file() and PATTERN.fullmatch(p.name) and p.name != KEEP
        ),
        # Strip the "cppsession" prefix and ".cpp" suffix, leaving just the number
        key=lambda p: int(p.name[len("cppsession"):-len(".cpp")]),
    )

    if not targets:
        print("Nothing to delete.")
        return 0

    for p in targets:
        if dry_run:
            print(f"Would delete: {p.name}")
        else:
            # Permanently deletes the file (it does NOT go to the Trash)
            p.unlink()
            print(f"Deleted: {p.name}")

    # Final summary line, worded to match whether anything was actually deleted
    verb = "Would delete" if dry_run else "Deleted"
    print(f"{verb} {len(targets)} file(s); kept {KEEP}.")
    return 0


# Only run when executed directly (not when imported); pass main()'s return
# value to the shell as the exit code
if __name__ == "__main__":
    sys.exit(main())
