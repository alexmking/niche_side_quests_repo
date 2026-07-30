#!/usr/bin/env python3
"""Add a DEF entry to the DEF section of ssot-workref.txt.

Usage:
    python add_term_to_defs.py TERM "Definition text"

Example:
    python add_term_to_defs.py DGM "DGM is our flagship product"
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


DEF_SECTION_START_TOKEN = ",.DEF MAPPINGS"
DEF_SECTION_END_TOKEN = ",.DELETEwhenDONE"
DEF_LINE_RE = re.compile(r"^(?P<prefix>\s*)DEF-(?P<term>[^\s]+)\s+----\s+.*$")


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Add a new DEF-term line to the DEF section of ssot-workref.txt"
    )
    parser.add_argument("term", help="Term/acronym to add, e.g. DGM")
    parser.add_argument(
        "definition",
        nargs="+",
        help='Definition text, e.g. "DGM is our flagship product"',
    )
    return parser.parse_args()


def read_text_with_fallback(path: Path) -> tuple[str, str]:
    try:
        return path.read_text(encoding="utf-8"), "utf-8"
    except UnicodeDecodeError:
        return path.read_text(encoding="cp1252"), "cp1252"


def detect_newline(text: str) -> str:
    if "\r\n" in text:
        return "\r\n"
    return "\n"


def find_section_bounds(lines: list[str]) -> tuple[int, int]:
    start = -1
    end = -1

    for idx, line in enumerate(lines):
        if DEF_SECTION_START_TOKEN in line:
            start = idx
            break

    if start == -1:
        raise ValueError(f"Could not find DEF section start token: {DEF_SECTION_START_TOKEN}")

    for idx in range(start + 1, len(lines)):
        if DEF_SECTION_END_TOKEN in lines[idx]:
            end = idx
            break

    if end == -1:
        raise ValueError(f"Could not find DEF section end token: {DEF_SECTION_END_TOKEN}")

    return start, end


def main() -> int:
    args = parse_args()
    term = args.term.strip()
    definition = " ".join(args.definition).strip()

    if not term:
        print("Error: term cannot be empty.", file=sys.stderr)
        return 1
    if not definition:
        print("Error: definition cannot be empty.", file=sys.stderr)
        return 1

    script_dir = Path(__file__).resolve().parent
    workref_path = script_dir / "ssot-workref.txt"

    if not workref_path.exists():
        print(f"Error: file not found: {workref_path}", file=sys.stderr)
        return 1

    text, encoding_used = read_text_with_fallback(workref_path)
    newline = detect_newline(text)
    lines = text.splitlines()

    try:
        section_start, section_end = find_section_bounds(lines)
    except ValueError as exc:
        print(f"Error: {exc}", file=sys.stderr)
        return 1

    existing_term_idx = None
    last_def_idx = None

    for idx in range(section_start + 1, section_end):
        match = DEF_LINE_RE.match(lines[idx])
        if not match:
            continue

        existing_term = match.group("term")
        if existing_term.lower() == term.lower():
            existing_term_idx = idx
            break
        last_def_idx = idx

    if existing_term_idx is not None:
        print(
            f"Skipped: DEF-{term} already exists at line {existing_term_idx + 1} in {workref_path.name}."
        )
        return 0

    if last_def_idx is None:
        print("Error: no DEF entries were found in the DEF section.", file=sys.stderr)
        return 1

    new_line = f"DEF-{term} ---- {definition}"
    lines.insert(last_def_idx + 1, new_line)

    updated_text = newline.join(lines)
    if text.endswith(("\n", "\r\n")):
        updated_text += newline

    workref_path.write_text(updated_text, encoding=encoding_used)
    print(f"Added: {new_line}")
    print(f"Updated file: {workref_path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
