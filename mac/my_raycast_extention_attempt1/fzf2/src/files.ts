// Edit the paths here. Each key maps to one Raycast command (see src/fzf-*.tsx).
const ROOT = "/Users/alexking/amk/tools/GIT_STUFF/niche_side_quests_repo";

export const FILES = {
  aliases: [`${ROOT}/mac/.zshrc`], // placeholder
  ref: [`${ROOT}/_universal/ssot-ref.txt`],
  workref: [`${ROOT}/win/ssot-workref.txt`],
  keyboardShortcuts: [`${ROOT}/_universal/keyboard-shortcuts.html`], // placeholder
  vscodeShortcuts: [`${ROOT}/_universal/vscode-shortcuts.html`], // placeholder
};

// Used by the "fzf all" command. Add/remove entries to change what it searches
// (use FILES.<key> for an existing file, or a literal path string for a new one).
export const ALL_FILES: string[] = [
  ...FILES.aliases,
  ...FILES.ref,
  ...FILES.workref,
  ...FILES.keyboardShortcuts,
  ...FILES.vscodeShortcuts,
];

// Used by the "fzf by app" command: the frontmost app's bundle ID picks the files to search.
// Find a bundle ID with: osascript -e 'id of app "App Name"'
export const APP_FILES: Record<string, { name: string; files: string[] }> = {
  "com.apple.finder": { name: "Finder", files: [`${ROOT}/_universal/app_specific_hotkeys/hotkeys_finder_and_fileExpl_and_general.txt`] }, // placeholder
  "com.googlecode.iterm2": { name: "iTerm", files: [`${ROOT}/_universal/app_specific_hotkeys/hotkeys_iterm_and_cmder.txt`] }, // placeholder
  "com.google.Chrome": { name: "Chrome", files: [`${ROOT}/_universal/app_specific_hotkeys/hotkeys_chrome_jira_github.txt`] }, // placeholder
  "com.microsoft.VSCode": { name: "VS Code", files: [`${ROOT}/_universal/app_specific_hotkeys/hotkeys_vscode.txt`] }, // placeholder
  "com.atlassian.trello": { name: "Trello", files: [`${ROOT}/_universal/app_specific_hotkeys/hotkeys_trello.txt`] }, // placeholder
  "com.microsoft.Excel": { name: "Excel", files: [`${ROOT}/_universal/app_specific_hotkeys/hotkeys_excel.txt`] }, // placeholder
};

// Used when the frontmost app isn't listed above.
export const DEFAULT_APP_FILES = FILES.ref;
