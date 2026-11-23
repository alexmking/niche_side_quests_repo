"""Open ssot-workref.txt in VS Code at the first line containing ',.durMeetings'."""

import shutil
import subprocess

# File to open, and the text that marks the section we want to jump to
FILE = r"D:\git\niche_side_quests_repo\win\ssot-workref.txt"
MARKER = ",.durMeetings"


def find_line(path: str, marker: str) -> int | None:
    """Return the 1-based number of the first line containing marker, or None if absent."""
    # errors="replace" keeps odd characters from crashing the scan
    with open(path, encoding="utf-8", errors="replace") as f:
        for number, line in enumerate(f, start=1):
            if marker in line:
                return number
    return None


def main() -> None:
    line = find_line(FILE, MARKER)
    if line is None:
        # Still open the file so the script is useful even if the section was renamed/removed
        print(f"'{MARKER}' not found in {FILE}; opening at top.")
        line = 1

    # Locate the VS Code command-line launcher on PATH
    code = shutil.which("code")
    if code is None:
        raise SystemExit("VS Code 'code' command not found on PATH")

    # --goto file:line opens the file with the cursor on that line
    subprocess.run([code, "--goto", f"{FILE}:{line}"], check=True)
    print(f"Opened {FILE} at line {line}")


if __name__ == "__main__":
    main()
