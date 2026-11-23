"""Delete cppsessionN.cpp files (N >= 2) from a directory, keeping cppsession1.cpp.

Files not matching the exact cppsession<number>.cpp pattern are ignored.

Usage:
    python scr-cleanup-cppsessions.py            # dry run
    python scr-cleanup-cppsessions.py --delete   # actually delete
"""

import argparse
import re
from pathlib import Path

DEFAULT_DIR = Path(r"C:\Users\aking\amk\tools\localcpp")
PATTERN = re.compile(r"^cppsession(\d+)\.cpp$", re.IGNORECASE)
KEEP = 1


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("directory", nargs="?", type=Path, default=DEFAULT_DIR)
    parser.add_argument("--delete", action="store_true",
                        help="actually delete files (default is a dry run)")
    args = parser.parse_args()

    if not args.directory.is_dir():
        raise SystemExit(f"Directory not found: {args.directory}")

    count = 0
    for path in sorted(args.directory.iterdir()):
        match = PATTERN.match(path.name)
        if not path.is_file() or not match or int(match.group(1)) == KEEP:
            continue
        count += 1
        if args.delete:
            path.unlink()
            print(f"Deleted: {path.name}")
        else:
            print(f"Would delete: {path.name}")

    action = "Deleted" if args.delete else "Would delete"
    print(f"{action} {count} file(s).")
    if not args.delete and count:
        print("Re-run with --delete to remove them.")


if __name__ == "__main__":
    main()
