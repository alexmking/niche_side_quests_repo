import FzfSearch from "./lib/FzfSearch";
import { ALL_FILES } from "./files";

export default function Command() {
  return <FzfSearch files={ALL_FILES} placeholder="Search all files..." />;
}
