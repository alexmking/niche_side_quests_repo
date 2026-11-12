# fzf-def-search.ps1
# Interactive fzf lookup of DEF- entries in ssot-workref.txt.
# The "DEF-" prefix is prepended to your query automatically —
# just type the term (e.g. "LPMD") and it searches for "DEF-LPMD".
#
# Usage:  .\fzf-def-search.ps1
# Requires: fzf in PATH

param([switch]$Filter)

$file = "D:\git\niche_side_quests_repo\win\ssot-workref.txt"

if ($Filter) {
    # --- Filter mode: called by fzf on every keystroke ---
    # Query is passed as positional arg(s); empty when the input box is blank
    $query      = $args -join " "
    $searchTerm = "DEF-$query"
    Get-Content $file |
        Select-String -SimpleMatch $searchTerm |
        ForEach-Object { $_.Line }
    return
}

# --- Interactive mode: launch fzf ---
# Path has no spaces so no quoting needed in the reload command
$reloadCmd = "powershell -NoProfile -File $PSCommandPath -Filter {q}"

fzf --phony `
    --bind "start:reload($reloadCmd)" `
    --bind "change:reload($reloadCmd)" `
    --prompt "DEF-" `
    --header "Type term to find  |  DEF- prefix is added automatically  |  Enter to select, Esc to quit" `
    --no-sort
