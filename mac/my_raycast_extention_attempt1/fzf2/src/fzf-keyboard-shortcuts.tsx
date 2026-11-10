import FzfSearch from "./lib/FzfSearch";
import { FILES } from "./files";

export default function Command() {
  return <FzfSearch files={FILES.keyboardShortcuts} placeholder="Search keyboard shortcuts..." />;
}
