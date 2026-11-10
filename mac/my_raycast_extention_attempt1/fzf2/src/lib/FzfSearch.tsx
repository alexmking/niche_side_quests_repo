import { Action, ActionPanel, getPreferenceValues, Icon, List } from "@raycast/api";
import { existsSync, readFileSync } from "fs";
import { Fzf, byLengthAsc, extendedMatch } from "fzf";
import { basename } from "path";
import { useMemo, useState } from "react";

type Line = { text: string; file: string; n: number };

function loadLines(files: string[]): Line[] {
  return files
    .filter((file) => existsSync(file))
    .flatMap((file) =>
      readFileSync(file, "utf8")
        .split("\n")
        .map((text, i) => ({ text, file, n: i + 1 }))
        .filter((l) => l.text.trim() !== ""),
    );
}

const MARKDOWN_SPECIAL = /[\\`*_{}[\]<>()#+\-.!|~&]/g;
const escapeMd = (s: string) => s.replace(MARKDOWN_SPECIAL, "\\$&");

// Bold the matched characters; whitespace is kept outside the ** markers so they still render.
function highlight(text: string, positions: Set<number>): string {
  let out = "";
  let run = "";
  const flush = () => {
    if (run) {
      const [, lead, core, trail] = run.match(/^(\s*)([\s\S]*?)(\s*)$/) ?? [];
      out += core ? `${lead}**${core}**${trail}` : run;
      run = "";
    }
  };
  Array.from(text).forEach((ch, i) => {
    if (positions.has(i)) run += escapeMd(ch);
    else {
      flush();
      out += escapeMd(ch);
    }
  });
  flush();
  return out;
}

export default function FzfSearch({ files, placeholder }: { files: string[]; placeholder: string }) {
  const prefs = getPreferenceValues<Preferences>();
  const [query, setQuery] = useState("");
  const lines = useMemo(() => loadLines(files), [files]);
  const limit = Math.max(1, parseInt(prefs.maxResults ?? "50", 10) || 50);

  const fzf = useMemo(
    () =>
      new Fzf(lines, {
        selector: (l) => l.text,
        match: extendedMatch, // multi-word AND plus 'exact ^prefix suffix$ !negate a|b
        fuzzy: prefs.fuzzyMatching ? "v2" : false,
        casing: prefs.caseSensitivity ?? "smart-case",
        tiebreakers: prefs.preferShorterLines ? [byLengthAsc] : [],
        limit,
      }),
    [lines, prefs.fuzzyMatching, prefs.caseSensitivity, prefs.preferShorterLines, limit],
  );

  const results = useMemo(() => {
    if (!query.trim()) return lines.slice(0, limit).map((item) => ({ item, positions: new Set<number>() }));
    return fzf.find(query);
  }, [query, lines, fzf, limit]);

  const showDetail = prefs.highlightMatches;

  return (
    <List
      filtering={false}
      isShowingDetail={showDetail}
      onSearchTextChange={setQuery}
      searchBarPlaceholder={placeholder}
    >
      <List.EmptyView
        title={lines.length === 0 ? "No lines loaded" : "No matches"}
        description={lines.length === 0 ? `Check these paths exist:\n${files.join("\n")}` : undefined}
      />
      {results.map(({ item: l, positions }, i) => (
        <List.Item
          key={`${l.file}:${l.n}:${i}`}
          title={l.text}
          accessories={showDetail ? undefined : [{ text: `${basename(l.file)}:${l.n}` }]}
          detail={
            showDetail ? (
              <List.Item.Detail
                markdown={highlight(l.text, positions)}
                metadata={
                  <List.Item.Detail.Metadata>
                    <List.Item.Detail.Metadata.Label title="File" text={basename(l.file)} />
                    <List.Item.Detail.Metadata.Label title="Line" text={String(l.n)} />
                  </List.Item.Detail.Metadata>
                }
              />
            ) : undefined
          }
          actions={
            <ActionPanel>
              <Action.CopyToClipboard title="Copy Line" content={l.text} />
              <Action.Paste title="Paste Line" content={l.text} />
              <Action.Open
                title="Open in VS Code at Line"
                icon={Icon.Code}
                target={`vscode://file${l.file}:${l.n}`}
                shortcut={{ modifiers: ["shift"], key: "enter" }}
              />
              <Action.ShowInFinder path={l.file} />
            </ActionPanel>
          }
        />
      ))}
    </List>
  );
}
