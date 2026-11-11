import { ActionPanel, Action, Icon, List } from "@raycast/api";
import { existsSync, readFileSync } from "fs";
import { basename } from "path";
import { useMemo } from "react";
import { SEARCHES } from "./config";

export default function FileSearch({ id }: { id: keyof typeof SEARCHES }) {
  const { title, files } = SEARCHES[id];

  const { items, missing } = useMemo(() => {
    const missing = files.filter((f) => !existsSync(f));
    const items = files.filter(existsSync).flatMap((file) =>
      readFileSync(file, "utf8")
        .split(/\r?\n/)
        .map((text, i) => ({ id: `${file}:${i}`, text: text.trim(), file }))
        .filter((l) => l.text),
    );
    return { items, missing };
  }, [id]);

  return (
    <List searchBarPlaceholder={`${title}: search lines...`}>
      {items.length === 0 && (
        <List.EmptyView
          icon={Icon.Warning}
          title="Nothing to search"
          description={
            missing.length
              ? `File not found: ${missing.join(", ")}\nEdit src/config.ts`
              : "The configured file(s) are empty."
          }
        />
      )}
      {items.map((it) => (
        <List.Item
          key={it.id}
          title={it.text}
          accessories={[{ text: basename(it.file) }]}
          actions={
            <ActionPanel>
              <Action.CopyToClipboard content={it.text} />
              <Action.Open title="Open File" target={it.file} />
              <Action.ShowInFinder path={it.file} />
            </ActionPanel>
          }
        />
      ))}
    </List>
  );
}
