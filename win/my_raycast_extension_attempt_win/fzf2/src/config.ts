// EDIT THIS FILE to change what each command searches.
// Each command can search one or more files (every non-empty line becomes a result).
// After editing, `npm run dev` hot-reloads; otherwise run `npm run build`.

// Shift+Enter copies `code --goto "file:line"` to the clipboard and also runs it.
export const VSCODE_COMMAND = "code";

export interface SearchConfig {
  title: string; // shown in the search bar placeholder
  files: string[];
}

export const SEARCHES: Record<string, SearchConfig> = {
  search1: {
    title: "fzf workref",
    files: [
      "D:\\git\\niche_side_quests_repo\\win\\ssot-workref.txt",
      "D:\\git\\niche_side_quests_repo\\_universal\\ssot-ref.txt",
    ],
  },
  search2: {
    title: "fzf ref",
    files: ["D:\\git\\niche_side_quests_repo\\_universal\\ssot-ref.txt"],
  },
  search3: {
    title: "fzf aliases",
    files: ["C:\\Users\\aking\\Downloads\\cmder\\config\\user_aliases.cmd"],
  },
  search4: {
    title: "fzf keyboard-shortcuts",
    files: [
      "D:\\git\\niche_side_quests_repo\\_universal\\keyboard-shortcuts.html",
    ],
  },
  search5: {
    title: "fzf vscode keyb shortcuts",
    files: [
      "D:\\git\\niche_side_quests_repo\\_universal\\vscode-shortcuts.html",
    ],
  },
};

// ---- Per-app hotkeys command (app-hotkeys.tsx) ----
// The frontmost app when the command is triggered picks the file.
// `match` entries are case-insensitive substrings tested against the app's name AND path
// (e.g. "Code.exe" paths, "chrome", "excel"). First rule that matches wins.
// The command shows the detected app name/path, so tune `match` from what it displays.
const HOTKEYS_DIR =
  "D:\\git\\niche_side_quests_repo\\_universal\\app_specific_hotkeys";

export interface AppHotkeyRule {
  label: string;
  match: string[];
  file: string;
}

export const APP_HOTKEY_RULES: AppHotkeyRule[] = [
  {
    label: "VS Code",
    match: ["code.exe", "visual studio code", "cursor"],
    file: `${HOTKEYS_DIR}\\hotkeys_vscode.txt`,
  },
  {
    label: "Chrome / Jira / GitHub",
    match: ["chrome", "msedge", "firefox"],
    file: `${HOTKEYS_DIR}\\hotkeys_chrome_jira_github.txt`,
  },
  {
    label: "Excel",
    match: ["excel"],
    file: `${HOTKEYS_DIR}\\hotkeys_excel.txt`,
  },
  {
    label: "Trello",
    match: ["trello"],
    file: `${HOTKEYS_DIR}\\hotkeys_trello.txt`,
  },
  {
    label: "Terminal (cmder)",
    match: ["cmder", "conemu", "windowsterminal", "windows terminal", "iterm"],
    file: `${HOTKEYS_DIR}\\hotkeys_iterm_and_cmder.txt`,
  },
  {
    label: "File Explorer",
    match: ["explorer.exe", "file explorer"],
    file: `${HOTKEYS_DIR}\\hotkeys_finder_and_fileExpl_and_general.txt`,
  },
  {
    label: "Teams",
    match: ["teams"],
    file: `${HOTKEYS_DIR}\\win_only\\hotkeys_teams.txt`,
  },
  {
    label: "GitHub Desktop",
    match: ["github desktop", "githubdesktop"],
    file: `${HOTKEYS_DIR}\\win_only\\hotkeys_github_desktop.txt`,
  },
];

// Used when no rule matches the frontmost app.
export const DEFAULT_APP_HOTKEYS_FILE = `${HOTKEYS_DIR}\\hotkeys_finder_and_fileExpl_and_general.txt`;

// fzf over
// ssot-ref.txt
// ssot-workref.txt
// aliases
// keyboard-shortcuts.html
// vscode keyb shortucts .html

// D:\git\niche_side_quests_repo\_universal\ssot-ref.txt
// D:\git\niche_side_quests_repo\win\ssot-workref.txt
// C:\Users\aking\Downloads\cmder\config\user_aliases.cmd
// D:\git\niche_side_quests_repo\_universal\keyboard-shortcuts.html
// D:\git\niche_side_quests_repo\_universal\vscode-shortcuts.html
// // C:\Program Files\AutoHotkey\UX\king_app_switcher1.ahk
