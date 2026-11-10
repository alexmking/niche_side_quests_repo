import FzfSearch from "./lib/FzfSearch";
import { FILES } from "./files";

export default function Command() {
  return <FzfSearch files={FILES.vscodeShortcuts} placeholder="Search VS Code shortcuts..." />;
}
