"""Open the cppsession file with the highest trailing number in VS Code.

Only files named exactly cppsession<number>.cpp are considered.

Usage:
    python scr-open-latest-cppsession.py [directory]
"""

import argparse
import re
import shutil
import subprocess
from pathlib import Path

DEFAULT_DIR = Path(r"C:\Users\aking\amk\tools\localcpp")
PATTERN = re.compile(r"^cppsession(\d+)\.cpp$", re.IGNORECASE)


def find_latest(directory: Path) -> Path | None:
    latest, latest_num = None, -1
    for path in directory.iterdir():
        match = PATTERN.match(path.name)
        if path.is_file() and match and int(match.group(1)) > latest_num:
            latest, latest_num = path, int(match.group(1))
    return latest


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("directory", nargs="?", type=Path, default=DEFAULT_DIR)
    args = parser.parse_args()

    if not args.directory.is_dir():
        raise SystemExit(f"Directory not found: {args.directory}")

    latest = find_latest(args.directory)
    if latest is None:
        raise SystemExit(f"No cppsession<number>.cpp files in {args.directory}")

    code = shutil.which("code")
    if code is None:
        raise SystemExit("VS Code 'code' command not found on PATH")

    print(f"Opening {latest}")
    subprocess.run([code, str(latest)], check=True)


if __name__ == "__main__":
    main()
