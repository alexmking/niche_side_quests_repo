import { getFrontmostApplication, List } from "@raycast/api";
import { usePromise } from "@raycast/utils";
import FzfSearch from "./lib/FzfSearch";
import { APP_FILES, DEFAULT_APP_FILES } from "./files";

export default function Command() {
  const { data: app, isLoading } = usePromise(getFrontmostApplication);
  if (isLoading || !app) return <List isLoading />;

  const match = app.bundleId ? APP_FILES[app.bundleId] : undefined;
  return (
    <FzfSearch
      files={match?.files ?? DEFAULT_APP_FILES}
      placeholder={match ? `Search ${match.name} refs...` : `Search default refs (${app.name} not mapped)...`}
    />
  );
}
