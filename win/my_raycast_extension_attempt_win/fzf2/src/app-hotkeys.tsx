import {
  Action,
  ActionPanel,
  getFrontmostApplication,
  Icon,
  List,
} from "@raycast/api";
import { existsSync, readFileSync } from "fs";
import { basename } from "path";
import { useEffect, useMemo, useState } from "react";
import { APP_HOTKEY_RULES, DEFAULT_APP_HOTKEYS_FILE } from "./config";

const DEFAULT_VALUE = "__default__";

function resolveFile(
  appName: string,
  appPath: string,
): { file: string; label: string } {
  const haystack = `${appName} ${appPath}`.toLowerCase();
  const rule = APP_HOTKEY_RULES.find((r) =>
    r.match.some((m) => haystack.includes(m.toLowerCase())),
  );
  return rule
    ? { file: rule.file, label: rule.label }
    : { file: DEFAULT_APP_HOTKEYS_FILE, label: "Default" };
}

export default function Command() {
  const [app, setApp] = useState<
    { name: string; path: string } | null | undefined
  >(undefined);
  const [override, setOverride] = useState<string | null>(null);

  useEffect(() => {
    getFrontmostApplication()
      .then((a) => setApp({ name: a.name, path: a.path }))
      .catch(() => setApp(null));
  }, []);

  const detected =
    app === undefined
      ? undefined
      : resolveFile(app?.name ?? "", app?.path ?? "");
  const file = override ?? detected?.file;

  const lines = useMemo(() => {
    if (!file || !existsSync(file)) return [];
    return readFileSync(file, "utf8")
      .split(/\r?\n/)
      .map((text, i) => ({ id: `${i}`, text: text.trim() }))
      .filter((l) => l.text);
  }, [file]);

  const appDesc = app ? `${app.name}` : "unknown app";

  return (
    <List
      isLoading={app === undefined}
      searchBarPlaceholder={
        file
          ? `fzf ${basename(file)} (from ${appDesc}): search lines...`
          : "Detecting app..."
      }
      searchBarAccessory={
        <List.Dropdown
          tooltip="Hotkeys file"
          value={override ?? DEFAULT_VALUE}
          onChange={(v) => setOverride(v === DEFAULT_VALUE ? null : v)}
        >
          <List.Dropdown.Item
            value={DEFAULT_VALUE}
            title={detected ? `Auto: ${detected.label} (${appDesc})` : "Auto"}
          />
          {APP_HOTKEY_RULES.map((r) => (
            <List.Dropdown.Item key={r.file} value={r.file} title={r.label} />
          ))}
        </List.Dropdown>
      }
    >
      {app !== undefined && lines.length === 0 && (
        <List.EmptyView
          icon={Icon.Warning}
          title="Nothing to search"
          description={
            file && !existsSync(file)
              ? `File not found: ${file}`
              : "The hotkeys file is empty."
          }
        />
      )}
      {file &&
        lines.map((it) => (
          <List.Item
            key={it.id}
            title={it.text}
            accessories={[{ text: basename(file) }]}
            actions={
              <ActionPanel>
                <Action.CopyToClipboard content={it.text} />
                <Action.Open title="Open File" target={file} />
                <Action.ShowInFinder path={file} />
              </ActionPanel>
            }
          />
        ))}
    </List>
  );
}
