import {
  ActionPanel,
  Action,
  Clipboard,
  Icon,
  List,
  showToast,
  Toast,
} from "@raycast/api";
import { exec } from "child_process";
import { existsSync, readFileSync } from "fs";
import { basename } from "path";
import { useMemo } from "react";
import { SEARCHES, VSCODE_COMMAND } from "./config";

function vscodeCommand(file: string, line: number) {
  return `${VSCODE_COMMAND} --goto "${file}:${line}"`;
}

function tryVSCode(command: string): Promise<boolean> {
  return new Promise((resolve) => {
    exec(command, { timeout: 10000, windowsHide: true }, (err) =>
      resolve(!err),
    );
  });
}

// WRINKLE WITHIN THIS FUNCTION EXPL: unlike on mac side, windows
// vscode has the pesky 'another vscode instance is running, close it 
// first before can open this file in vscode' bullshit
// which is surprisingly annoying to get around programmatically. So we 
// resort to copying the command to the clipboard and instructing the user 
// to run it manually if VS Code fails to open.
async function openAtLine(file: string, line: number) {
  const command = vscodeCommand(file, line);
  await Clipboard.copy(command);
  if (await tryVSCode(command)) {
    await showToast({
      style: Toast.Style.Success,
      title: "Opened in VS Code",
      message: "Command Code copied to clipboard",
    });
  } else {
    await showToast({
      style: Toast.Style.Failure,
      title: "Couldn't open VS Code",
      message: "Command copied to clipboard - run it in a terminal",
    });
  }
}

export default function FileSearch({ id }: { id: keyof typeof SEARCHES }) {
  const { title, files } = SEARCHES[id];

  const { items, missing } = useMemo(() => {
    const missing = files.filter((f) => !existsSync(f));
    const items = files.filter(existsSync).flatMap((file) =>
      readFileSync(file, "utf8")
        .split(/\r?\n/)
        .map((text, i) => ({
          id: `${file}:${i}`,
          text: text.trim(),
          file,
          line: i + 1,
        }))
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
              <Action
                title="Open in VS Code at Line + Copy Command"
                icon={Icon.Code}
                shortcut={{ modifiers: ["shift"], key: "enter" }}
                onAction={() => openAtLine(it.file, it.line)}
              />
              <Action.Open title="Open File" target={it.file} />
              <Action.ShowInFinder path={it.file} />
            </ActionPanel>
          }
        />
      ))}
    </List>
  );
}
