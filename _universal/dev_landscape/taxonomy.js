#!/usr/bin/env node
'use strict';

const fs   = require('fs');
const path = require('path');

const TAXONOMY_PATH = path.join(__dirname, 'taxonomy.json');

// ── File I/O ──────────────────────────────────────────────────────────────────

function loadTaxonomy() {
  try {
    return JSON.parse(fs.readFileSync(TAXONOMY_PATH, 'utf8'));
  } catch (err) {
    console.error(`Error: could not read taxonomy.json — ${err.message}`);
    process.exit(1);
  }
}

function saveTaxonomy(taxonomy) {
  try {
    fs.writeFileSync(TAXONOMY_PATH, JSON.stringify(taxonomy, null, 2) + '\n', 'utf8');
  } catch (err) {
    console.error(`Error: could not write taxonomy.json — ${err.message}`);
    process.exit(1);
  }
}

// ── CLI argument parsing ──────────────────────────────────────────────────────

// Flags that take no value — their presence alone sets them to true.
const BOOLEAN_FLAGS = new Set([
  'fix',
  'sort-by-size',
  'show-subcategories',
  'clear-aliases', 'clear-tags', 'clear-notes',
  'clear-what-is-it', 'clear-description',
  'clear-used-with', 'clear-built-on', 'clear-built-upon-by',
  'clear-runs-on', 'clear-alternatives', 'clear-part-of',
  'clear-includes', 'clear-examples', 'clear-use-cases',
  'clear-related-concepts',
]);

// Parses --flag value pairs from an argv slice.
// Flags that appear more than once are accumulated into an array.
// Positional arguments (not starting with --) are collected into result._
// Boolean flags (BOOLEAN_FLAGS) require no value.
function parseFlags(argv) {
  const result = { _: [] };

  let i = 0;
  while (i < argv.length) {
    const flag = argv[i];

    if (!flag.startsWith('--')) {
      // Positional argument
      result._.push(flag);
      i++;
      continue;
    }

    const key = flag.slice(2);

    if (BOOLEAN_FLAGS.has(key)) {
      result[key] = true;
      i++;
      continue;
    }

    const value = argv[i + 1];

    if (value === undefined || value.startsWith('--')) {
      console.error(`Error: flag "${flag}" requires a value.`);
      process.exit(1);
    }

    if (key in result) {
      result[key] = [].concat(result[key], value);
    } else {
      result[key] = value;
    }

    i += 2;
  }

  return result;
}

// ── Taxonomy helpers ──────────────────────────────────────────────────────────

// Returns a Set of every term id present anywhere in the taxonomy.
function collectAllIds(taxonomy) {
  const ids = new Set();

  function walk(node) {
    if (Array.isArray(node)) {
      for (const term of node) {
        if (term && typeof term.id === 'string') ids.add(term.id);
      }
    } else if (node !== null && typeof node === 'object') {
      for (const child of Object.values(node)) walk(child);
    }
  }

  walk(taxonomy);
  return ids;
}

// Resolves and returns the term array for the given continent/category/subcategory.
// Exits with an error message if anything along the path does not exist or
// the subcategory presence mismatches the category structure.
function resolveTargetArray(taxonomy, { continent, category, subcategory }) {
  if (!Object.prototype.hasOwnProperty.call(taxonomy, continent)) {
    console.error(`Error: continent "${continent}" not found.`);
    console.error(`Available continents: ${Object.keys(taxonomy).join(', ')}`);
    process.exit(1);
  }
  const continentNode = taxonomy[continent];

  if (!Object.prototype.hasOwnProperty.call(continentNode, category)) {
    console.error(`Error: category "${category}" not found in continent "${continent}".`);
    console.error(`Available categories: ${Object.keys(continentNode).join(', ')}`);
    process.exit(1);
  }
  const categoryNode = continentNode[category];

  if (Array.isArray(categoryNode)) {
    if (subcategory) {
      console.error(`Error: category "${category}" has no subcategories. Remove --subcategory.`);
      process.exit(1);
    }
    return categoryNode;
  }

  if (categoryNode !== null && typeof categoryNode === 'object') {
    if (!subcategory) {
      console.error(`Error: category "${category}" has subcategories. You must provide --subcategory.`);
      console.error(`Available subcategories: ${Object.keys(categoryNode).join(', ')}`);
      process.exit(1);
    }
    if (!Object.prototype.hasOwnProperty.call(categoryNode, subcategory)) {
      console.error(`Error: subcategory "${subcategory}" not found in category "${category}".`);
      console.error(`Available subcategories: ${Object.keys(categoryNode).join(', ')}`);
      process.exit(1);
    }
    const sub = categoryNode[subcategory];
    if (!Array.isArray(sub)) {
      console.error(`Error: subcategory "${subcategory}" is not a term array.`);
      process.exit(1);
    }
    return sub;
  }

  console.error(`Error: unexpected structure at category "${category}".`);
  process.exit(1);
}

// ── Term schema ───────────────────────────────────────────────────────────────

// Required fields and their expected types in the universal schema.
const SCHEMA_STRINGS = ['id', 'name', 'continent', 'category', 'subcategory',
                        'notes', 'whatIsIt', 'description'];
const SCHEMA_ARRAYS  = ['aliases', 'tags', 'usedWith', 'builtOn', 'builtUponBy',
                        'runsOn', 'alternatives', 'partOf', 'includes', 'examples',
                        'useCases', 'relatedConcepts'];

// Canonical display order for print-schema.
// Add new fields here when extending the schema so they appear in the right place.
const SCHEMA_FIELD_ORDER = [
  'id', 'name',
  'continent', 'category', 'subcategory',
  'aliases', 'notes', 'tags',
  'whatIsIt', 'description',
  'usedWith', 'builtOn', 'builtUponBy', 'runsOn', 'alternatives',
  'partOf', 'includes', 'examples', 'useCases', 'relatedConcepts',
];

// Optional per-field annotations shown next to each entry in print-schema.
// Only add entries here when you want to convey extra context beyond the type.
const SCHEMA_FIELD_ANNOTATIONS = {
  id:          'required · unique · no spaces',
  name:        'required · display name',
  continent:   'required',
  category:    'required',
  subcategory: 'optional — empty string if none',
};

function validateTermSchema(term) {
  const bad = [
    ...SCHEMA_STRINGS.filter(f => typeof term[f] !== 'string'),
    ...SCHEMA_ARRAYS.filter(f => !Array.isArray(term[f])),
  ];
  if (bad.length > 0) {
    console.error(`Internal error: term "${term.id ?? '?'}" has invalid/missing fields: ${bad.join(', ')}`);
    process.exit(1);
  }
}

// Parse "Continent > Category" or "Continent > Category > Subcategory" into parts.
function parsePath(pathStr) {
  const parts = pathStr.split('>').map(s => s.trim()).filter(Boolean);
  if (parts.length === 2) return { continent: parts[0], category: parts[1], subcategory: '' };
  if (parts.length === 3) return { continent: parts[0], category: parts[1], subcategory: parts[2] };
  console.error('Error: --path must have 2 or 3 segments separated by ">", e.g. "Development > Languages > Programming Languages"');
  process.exit(1);
}

// ── Commands ──────────────────────────────────────────────────────────────────

function cmdAddTerm(flags) {
  // Accept --path as a shorthand for --continent/--category/--subcategory
  let continent, category, subcategory;
  if (flags.path) {
    ({ continent, category, subcategory } = parsePath(flags.path));
  } else {
    continent   = flags.continent   ?? '';
    category    = flags.category    ?? '';
    subcategory = flags.subcategory ?? '';
  }

  const missing = [];
  if (!continent)  missing.push('--continent (or use --path)');
  if (!category)   missing.push('--category (or use --path)');
  if (!flags.id)   missing.push('--id');
  if (!flags.name) missing.push('--name');

  if (missing.length > 0) {
    console.error(`Error: missing required argument(s): ${missing.join(', ')}`);
    process.exit(1);
  }

  const { id, name } = flags;
  const taxonomy = loadTaxonomy();

  if (collectAllIds(taxonomy).has(id)) {
    console.error(`Error: term id "${id}" already exists in taxonomy.json.`);
    process.exit(1);
  }

  const targetArray = resolveTargetArray(taxonomy, { continent, category, subcategory });

  const term = {
    id,
    name,
    continent,
    category,
    subcategory,
    aliases:         flags.alias               ? [].concat(flags.alias)               : [],
    notes:           flags.note                ?? '',
    tags:            flags.tag                 ? [].concat(flags.tag)                 : [],
    whatIsIt:        flags['what-is-it']        ?? '',
    description:     flags.description         ?? '',
    usedWith:        flags['used-with']         ? [].concat(flags['used-with'])         : [],
    builtOn:         flags['built-on']          ? [].concat(flags['built-on'])          : [],
    builtUponBy:     flags['built-upon-by']     ? [].concat(flags['built-upon-by'])     : [],
    runsOn:          flags['runs-on']           ? [].concat(flags['runs-on'])           : [],
    alternatives:    flags.alternative          ? [].concat(flags.alternative)          : [],
    partOf:          flags['part-of']           ? [].concat(flags['part-of'])           : [],
    includes:        flags.include              ? [].concat(flags.include)              : [],
    examples:        flags.example              ? [].concat(flags.example)              : [],
    useCases:        flags['use-case']          ? [].concat(flags['use-case'])          : [],
    relatedConcepts: flags['related-concept']   ? [].concat(flags['related-concept'])   : [],
  };

  validateTermSchema(term);
  targetArray.push(term);
  saveTaxonomy(taxonomy);

  const location = [continent, category, subcategory].filter(Boolean).join(' → ');
  console.log(`Added "${name}" (id: "${id}") to ${location}.`);
}

function cmdRemoveTerm(flags) {
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }

  const { id } = flags;
  const taxonomy = loadTaxonomy();
  let removed      = null;
  let removedPath  = null;

  function walk(node, breadcrumb) {
    if (removed) return;

    if (Array.isArray(node)) {
      const idx = node.findIndex(t => t?.id === id);
      if (idx !== -1) {
        removed     = node[idx];
        removedPath = breadcrumb;
        node.splice(idx, 1);
      }
    } else if (node !== null && typeof node === 'object') {
      for (const [key, child] of Object.entries(node)) {
        walk(child, [...breadcrumb, key]);
      }
    }
  }

  walk(taxonomy, []);

  if (!removed) {
    console.error(`Error: term id "${id}" not found in taxonomy.json.`);
    process.exit(1);
  }

  saveTaxonomy(taxonomy);
  console.log(`Removed "${removed.name}" (id: "${id}") from ${removedPath.join(' → ')}.`);
}

function cmdMoveTerm(flags) {
  const missing = ['id', 'continent', 'category'].filter(k => !flags[k]);
  if (missing.length > 0) {
    console.error(`Error: missing required argument(s): ${missing.map(k => `--${k}`).join(', ')}`);
    process.exit(1);
  }

  const { id, continent, category, subcategory } = flags;
  const taxonomy = loadTaxonomy();

  // Find and extract the term from its current location (without saving yet)
  let term        = null;
  let sourcePath  = null;
  let sourceArray = null;

  function findTerm(node, breadcrumb) {
    if (term) return;

    if (Array.isArray(node)) {
      const idx = node.findIndex(t => t?.id === id);
      if (idx !== -1) {
        term        = node[idx];
        sourcePath  = breadcrumb;
        sourceArray = node;
      }
    } else if (node !== null && typeof node === 'object') {
      for (const [key, child] of Object.entries(node)) {
        findTerm(child, [...breadcrumb, key]);
      }
    }
  }

  findTerm(taxonomy, []);

  if (!term) {
    console.error(`Error: term id "${id}" not found in taxonomy.json.`);
    process.exit(1);
  }

  // Resolve destination — resolveTargetArray handles existence/subcategory checks
  const destArray = resolveTargetArray(taxonomy, { continent, category, subcategory });

  // Check: already in the destination
  const destPath = [continent, category, subcategory].filter(Boolean).join(' → ');
  const sourcePathStr = sourcePath.join(' → ');

  if (sourcePathStr === destPath) {
    console.error(`Error: "${term.name}" (id: "${id}") is already in ${destPath}.`);
    process.exit(1);
  }

  // Check: duplicate id in destination (shouldn't be possible via normal use, but guard anyway)
  if (destArray.some(t => t?.id === id)) {
    console.error(`Error: term id "${id}" already exists in ${destPath}.`);
    process.exit(1);
  }

  // Remove from source and add to destination
  sourceArray.splice(sourceArray.indexOf(term), 1);
  destArray.push(term);

  // Sync the location fields stored on the term itself
  term.continent   = continent;
  term.category    = category;
  term.subcategory = subcategory ?? '';

  saveTaxonomy(taxonomy);
  console.log(`Moved "${term.name}" (id: "${id}") from ${sourcePathStr} → ${destPath}.`);
}

function cmdUpdateTerm(flags) {
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }

  const UPDATABLE_FLAGS = [
    'name',
    'note', 'what-is-it', 'description',
    'alias', 'tag', 'used-with', 'built-on', 'built-upon-by', 'runs-on',
    'alternative', 'part-of', 'include', 'example', 'use-case', 'related-concept',
  ];
  const CLEAR_FLAGS = [...BOOLEAN_FLAGS];

  const hasUpdate = UPDATABLE_FLAGS.some(k => k in flags);
  const hasClear  = CLEAR_FLAGS.some(k => flags[k] === true);

  if (!hasUpdate && !hasClear) {
    console.error('Error: no fields to update. Provide at least one update or --clear-* flag.');
    process.exit(1);
  }

  const { id } = flags;
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, id);

  const changes = [];

  // ── String fields ─────────────────────────────────────────────
  if ('name' in flags) {
    const old = term.name;
    term.name = flags.name;
    changes.push(`name: "${old}" → "${flags.name}"`);
  }

  function updateStr(field, flagKey, clearFlag) {
    const clearing = flags[clearFlag] === true;
    const hasVal   = flagKey in flags;
    if (clearing || hasVal) {
      const newVal = hasVal ? flags[flagKey] : '';
      term[field] = newVal;
      changes.push(clearing && !hasVal
        ? `${field}: cleared`
        : `${field}: "${newVal}"`);
    }
  }

  updateStr('notes',       'note',        'clear-notes');
  updateStr('whatIsIt',    'what-is-it',  'clear-what-is-it');
  updateStr('description', 'description', 'clear-description');

  // ── Array fields (append by default; --clear-* empties first) ─
  function updateArr(field, flagKey, clearFlag) {
    const clearing  = flags[clearFlag] === true;
    const newValues = flagKey in flags ? [].concat(flags[flagKey]) : [];
    if (clearing) {
      term[field] = [...newValues];
      changes.push(newValues.length > 0
        ? `${field}: cleared and set to [${newValues.map(v => `"${v}"`).join(', ')}]`
        : `${field}: cleared`);
    } else if (newValues.length > 0) {
      term[field] = [...(term[field] ?? []), ...newValues];
      changes.push(`${field}: appended [${newValues.map(v => `"${v}"`).join(', ')}]`);
    }
  }

  updateArr('aliases',        'alias',           'clear-aliases');
  updateArr('tags',           'tag',             'clear-tags');
  updateArr('usedWith',       'used-with',       'clear-used-with');
  updateArr('builtOn',        'built-on',        'clear-built-on');
  updateArr('builtUponBy',    'built-upon-by',   'clear-built-upon-by');
  updateArr('runsOn',         'runs-on',         'clear-runs-on');
  updateArr('alternatives',   'alternative',     'clear-alternatives');
  updateArr('partOf',         'part-of',         'clear-part-of');
  updateArr('includes',       'include',         'clear-includes');
  updateArr('examples',       'example',         'clear-examples');
  updateArr('useCases',       'use-case',        'clear-use-cases');
  updateArr('relatedConcepts','related-concept', 'clear-related-concepts');

  if (changes.length === 0) {
    console.log(`No changes made to "${term.name}" (id: "${id}").`);
    return;
  }

  validateTermSchema(term);
  saveTaxonomy(taxonomy);
  console.log(`Updated "${term.name}" (id: "${id}") in ${termPath.join(' → ')}:`);
  for (const change of changes) console.log(`  ${change}`);
}

// Shared helper: find a term by id, exit with an error if not found.
// Returns { term, termPath }.
function findTermById(taxonomy, id) {
  let term     = null;
  let termPath = null;

  function walk(node, breadcrumb) {
    if (term) return;
    if (Array.isArray(node)) {
      const found = node.find(t => t?.id === id);
      if (found) { term = found; termPath = breadcrumb; }
    } else if (node !== null && typeof node === 'object') {
      for (const [key, child] of Object.entries(node)) walk(child, [...breadcrumb, key]);
    }
  }

  walk(taxonomy, []);

  if (!term) {
    console.error(`Error: term id "${id}" not found in taxonomy.json.`);
    process.exit(1);
  }

  return { term, termPath };
}

function cmdAddAlias(flags) {
  // Positional mode: add-alias <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags.alias && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --alias (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags.alias ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(a => term.aliases.includes(a));
  const toAdd      = incoming.filter(a => !term.aliases.includes(a));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: alias "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided aliases already exist.');
    process.exit(1);
  }

  term.aliases.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added alias${toAdd.length > 1 ? 'es' : ''} [${toAdd.map(a => `"${a}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddTag(flags) {
  // Positional mode: add-tag <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags.tag && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --tag (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags.tag ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(t => term.tags.includes(t));
  const toAdd      = incoming.filter(t => !term.tags.includes(t));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: tag "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided tags already exist.');
    process.exit(1);
  }

  term.tags.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added tag${toAdd.length > 1 ? 's' : ''} [${toAdd.map(t => `"${t}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddUsedWith(flags) {
  // Positional mode: add-used-with <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags['used-with'] && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --used-with (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags['used-with'] ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.usedWith.includes(v));
  const toAdd      = incoming.filter(v => !term.usedWith.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: used-with entry "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided used-with entries already exist.');
    process.exit(1);
  }

  term.usedWith.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added used-with entr${toAdd.length > 1 ? 'ies' : 'y'} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddBuiltOn(flags) {
  // Positional mode: add-built-on <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags['built-on'] && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --built-on (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags['built-on'] ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.builtOn.includes(v));
  const toAdd      = incoming.filter(v => !term.builtOn.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: built-on entry "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided built-on entries already exist.');
    process.exit(1);
  }

  term.builtOn.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added built-on entr${toAdd.length > 1 ? 'ies' : 'y'} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddBuiltUponBy(flags) {
  // Positional mode: add-built-upon-by <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags['built-upon-by'] && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --built-upon-by (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags['built-upon-by'] ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.builtUponBy.includes(v));
  const toAdd      = incoming.filter(v => !term.builtUponBy.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: built-upon-by entry "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided built-upon-by entries already exist.');
    process.exit(1);
  }

  term.builtUponBy.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added built-upon-by entr${toAdd.length > 1 ? 'ies' : 'y'} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddRunsOn(flags) {
  // Positional mode: add-runs-on <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags['runs-on'] && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --runs-on (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags['runs-on'] ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.runsOn.includes(v));
  const toAdd      = incoming.filter(v => !term.runsOn.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: runs-on entry "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided runs-on entries already exist.');
    process.exit(1);
  }

  term.runsOn.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added runs-on entr${toAdd.length > 1 ? 'ies' : 'y'} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddAlternative(flags) {
  // Positional mode: add-alternative <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags.alternative && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --alternative (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags.alternative ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.alternatives.includes(v));
  const toAdd      = incoming.filter(v => !term.alternatives.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: alternative "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided alternatives already exist.');
    process.exit(1);
  }

  term.alternatives.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added alternative${toAdd.length > 1 ? 's' : ''} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddPartOf(flags) {
  // Positional mode: add-part-of <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags['part-of'] && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --part-of (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags['part-of'] ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.partOf.includes(v));
  const toAdd      = incoming.filter(v => !term.partOf.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: part-of entry "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided part-of entries already exist.');
    process.exit(1);
  }

  term.partOf.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added part-of entr${toAdd.length > 1 ? 'ies' : 'y'} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddInclude(flags) {
  // Positional mode: add-include <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags.include && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --include (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags.include ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.includes.includes(v));
  const toAdd      = incoming.filter(v => !term.includes.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: include "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided includes already exist.');
    process.exit(1);
  }

  term.includes.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added include${toAdd.length > 1 ? 's' : ''} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddExample(flags) {
  // Positional mode: add-example <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags.example && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --example (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags.example ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.examples.includes(v));
  const toAdd      = incoming.filter(v => !term.examples.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: example "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided examples already exist.');
    process.exit(1);
  }

  term.examples.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added example${toAdd.length > 1 ? 's' : ''} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddUseCase(flags) {
  // Positional mode: add-use-case <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags['use-case'] && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --use-case (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags['use-case'] ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.useCases.includes(v));
  const toAdd      = incoming.filter(v => !term.useCases.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: use case "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided use cases already exist.');
    process.exit(1);
  }

  term.useCases.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added use case${toAdd.length > 1 ? 's' : ''} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdAddRelatedConcept(flags) {
  // Positional mode: add-related-concept <id> val1 val2 ...
  if (!flags.id && flags._ && flags._.length >= 2) { flags.id = flags._[0]; flags._ = flags._.slice(1); }
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags['related-concept'] && !(flags._ && flags._.length > 0)) {
    console.error('Error: missing required argument: --related-concept (or provide values as positional arguments)');
    process.exit(1);
  }

  const incoming = [...[].concat(flags['related-concept'] ?? []), ...(flags._ ?? [])];
  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, flags.id);

  const duplicates = incoming.filter(v => term.relatedConcepts.includes(v));
  const toAdd      = incoming.filter(v => !term.relatedConcepts.includes(v));

  if (duplicates.length > 0) {
    for (const d of duplicates) {
      console.error(`Skipped: related concept "${d}" already exists on "${term.name}".`);
    }
  }

  if (toAdd.length === 0) {
    console.error('Nothing added — all provided related concepts already exist.');
    process.exit(1);
  }

  term.relatedConcepts.push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Added related concept${toAdd.length > 1 ? 's' : ''} [${toAdd.map(v => `"${v}"`).join(', ')}] to "${term.name}" (id: "${flags.id}") in ${termPath.join(' → ')}.`);
}

function cmdWhichAreDups(flags) {
  // Positional args are treated as comma-separated name lists
  const positionalNames = flags._.flatMap(arg =>
    arg.split(',').map(s => s.trim()).filter(s => s.length > 0)
  );

  const hasNames = 'name' in flags || positionalNames.length > 0;
  const hasIds   = 'id'   in flags;

  if (!hasNames && !hasIds) {
    console.error('Error: provide at least one name (positional or --name) or --id to check.');
    process.exit(1);
  }

  const namesToCheck = [...positionalNames, ...(flags.name ? [].concat(flags.name) : [])];
  const idsToCheck   = hasIds ? [].concat(flags.id) : [];

  const taxonomy = loadTaxonomy();

  // Build a flat list of all terms with their location path
  const allTerms = [];

  function walk(node, breadcrumb) {
    if (Array.isArray(node)) {
      for (const term of node) {
        if (term && typeof term.id === 'string') {
          allTerms.push({ term, path: breadcrumb });
        }
      }
    } else if (node !== null && typeof node === 'object') {
      for (const [key, child] of Object.entries(node)) walk(child, [...breadcrumb, key]);
    }
  }

  walk(taxonomy, []);

  // Check each candidate and classify as duplicate or new
  const results = [];

  for (const candidate of namesToCheck) {
    const lower = candidate.toLowerCase();
    const match = allTerms.find(({ term }) =>
      term.name.toLowerCase() === lower ||
      (term.aliases ?? []).some(a => a.toLowerCase() === lower)
    );
    results.push({ input: candidate, type: 'name', match: match ?? null });
  }

  for (const candidate of idsToCheck) {
    const lower = candidate.toLowerCase();
    const match = allTerms.find(({ term }) => term.id.toLowerCase() === lower);
    results.push({ input: candidate, type: 'id', match: match ?? null });
  }

  const duplicates = results.filter(r => r.match);
  const newTerms   = results.filter(r => !r.match);

  if (duplicates.length > 0) {
    console.log(`Already in taxonomy (${duplicates.length}):`);
    for (const { input, type, match } of duplicates) {
      const via = type === 'name' && match.term.name.toLowerCase() !== input.toLowerCase()
        ? ` (matched alias of "${match.term.name}")`
        : '';
      console.log(`  [DUP] "${input}"${via} — id: "${match.term.id}" in ${match.path.join(' → ')}`);
    }
  }

  if (newTerms.length > 0) {
    if (duplicates.length > 0) console.log('');
    console.log(`Not found — safe to add (${newTerms.length}):`);
    for (const { input } of newTerms) {
      console.log(`  [NEW] "${input}"`);
    }
    console.log('');
    console.log(newTerms.map(r => r.input).join(', '));
  }
}

function cmdPrintLandscapeOverview() {
  const taxonomy = loadTaxonomy();

  const counts = { continents: 0, categories: 0, subcategories: 0, terms: 0 };

  // Count terms in an array and add to total
  function countTerms(arr) {
    counts.terms += arr.length;
    return arr.length;
  }

  const lines = [];

  for (const [continentName, continentData] of Object.entries(taxonomy)) {
    counts.continents++;
    lines.push(`\n${continentName.toUpperCase()}`);

    for (const [catName, catValue] of Object.entries(continentData)) {
      counts.categories++;

      if (Array.isArray(catValue)) {
        // Flat category — terms directly
        const n = countTerms(catValue);
        lines.push(`  ${catName}  (${n} term${n !== 1 ? 's' : ''})`);
      } else if (catValue !== null && typeof catValue === 'object') {
        // Category with subcategories
        const subNames = Object.keys(catValue);
        const catTotal = subNames.reduce((sum, s) => sum + (Array.isArray(catValue[s]) ? catValue[s].length : 0), 0);
        lines.push(`  ${catName}  (${catTotal} term${catTotal !== 1 ? 's' : ''})`);

        for (const [subName, terms] of Object.entries(catValue)) {
          counts.subcategories++;
          const n = Array.isArray(terms) ? terms.length : 0;
          countTerms(Array.isArray(terms) ? terms : []);
          lines.push(`    ↳ ${subName}  (${n} term${n !== 1 ? 's' : ''})`);
        }
      }
    }
  }

  console.log(lines.join('\n'));
  console.log([
    '',
    '─'.repeat(40),
    `  Continents:    ${counts.continents}`,
    `  Categories:    ${counts.categories}`,
    `  Subcategories: ${counts.subcategories}`,
    `  Terms:         ${counts.terms}`,
  ].join('\n'));
}

function cmdPrintTerms(flags = {}) {
  const taxonomy = loadTaxonomy();
  const sortBySize = !!flags['sort-by-size'];

  // Helper: sum all array-field lengths for a term
  function listSize(term) {
    return ARRAY_FIELDS.reduce((sum, f) =>
      sum + (Array.isArray(term[f]) ? term[f].length : 0), 0);
  }

  // Collect term rows per continent: { label, size }
  const byContinent = {};
  for (const [continentName, continentData] of Object.entries(taxonomy)) {
    const group = [];
    for (const [catName, catValue] of Object.entries(continentData)) {
      if (Array.isArray(catValue)) {
        for (const term of catValue) {
          group.push({ label: `${term.name}  —  ${continentName} > ${catName}`, size: listSize(term) });
        }
      } else if (catValue !== null && typeof catValue === 'object') {
        for (const [subName, terms] of Object.entries(catValue)) {
          if (Array.isArray(terms)) {
            for (const term of terms) {
              group.push({ label: `${term.name}  —  ${continentName} > ${catName} > ${subName}`, size: listSize(term) });
            }
          }
        }
      }
    }
    if (sortBySize) {
      group.sort((a, b) => b.size - a.size || a.label.localeCompare(b.label));
    } else {
      group.sort((a, b) => a.label.localeCompare(b.label));
    }
    byContinent[continentName] = group;
  }

  let total = 0;
  let totalListItems = 0;
  const continentNames = Object.keys(byContinent);
  continentNames.forEach((continentName, i) => {
    const group = byContinent[continentName];
    const divider = '─'.repeat(50);
    console.log(`${divider}\n  ${continentName.toUpperCase()}  (${group.length} term${group.length !== 1 ? 's' : ''})\n${divider}`);
    const labelCol = Math.max(...group.map(r => r.label.length)) + 2;
    group.forEach(r => console.log(`${r.label.padEnd(labelCol)}  ${r.size} list items`));
    total += group.length;
    totalListItems += group.reduce((sum, r) => sum + r.size, 0);
    if (i < continentNames.length - 1) console.log('');
  });

  console.log(`\n${'─'.repeat(50)}\n${total} term${total !== 1 ? 's' : ''} total  |  ${totalListItems} list items total`);
}

function cmdPrintTermsByCategory(flags) {
  const showSubcategories = !!flags['show-subcategories'];
  const taxonomy = loadTaxonomy();

  // Collect data: continent → category → (subcategory → term[]) or flat term[]
  const continents = [];
  for (const [continentName, continentData] of Object.entries(taxonomy)) {
    const categories = [];
    for (const [catName, catValue] of Object.entries(continentData)) {
      if (Array.isArray(catValue)) {
        // No subcategories
        categories.push({ name: catName, subcats: null, terms: catValue });
      } else if (catValue !== null && typeof catValue === 'object') {
        // Has subcategories
        const subcats = [];
        const allTerms = [];
        for (const [subName, terms] of Object.entries(catValue)) {
          if (Array.isArray(terms)) {
            subcats.push({ name: subName, terms });
            allTerms.push(...terms);
          }
        }
        categories.push({ name: catName, subcats, terms: allTerms });
      }
    }
    continents.push({ name: continentName, categories });
  }

  const totalTerms = continents.reduce((s, c) =>
    s + c.categories.reduce((cs, cat) => cs + cat.terms.length, 0), 0);

  const divH = '═'.repeat(52);
  const divC = '─'.repeat(52);

  continents.forEach((continent, ci) => {
    const contTotal = continent.categories.reduce((s, cat) => s + cat.terms.length, 0);
    console.log(`\n${divH}`);
    console.log(`  ${continent.name.toUpperCase()}  (${contTotal} term${contTotal !== 1 ? 's' : ''})`);
    console.log(divH);

    continent.categories.forEach((cat, cati) => {
      if (cati > 0) console.log('');
      console.log(`  ${cat.name}  (${cat.terms.length})`);

      if (showSubcategories && cat.subcats && cat.subcats.length > 0) {
        // Show each subcategory with its terms indented
        cat.subcats.forEach(sub => {
          const subNames = sub.terms.map(t => t.name).sort((a, b) => a.localeCompare(b));
          console.log(`    ┄ ${sub.name}  (${sub.terms.length})`);
          subNames.forEach(n => console.log(`        ${n}`));
        });
      } else {
        // Flat list — sort all terms together
        const names = cat.terms.map(t => t.name).sort((a, b) => a.localeCompare(b));
        names.forEach(n => console.log(`      ${n}`));
      }
    });
  });

  console.log(`\n${divC}`);
  console.log(`${totalTerms} term${totalTerms !== 1 ? 's' : ''} total`);
}

function cmdPrintIds() {
  const taxonomy = loadTaxonomy();

  const rows = [];
  for (const [continentName, continentData] of Object.entries(taxonomy)) {
    for (const [catName, catValue] of Object.entries(continentData)) {
      if (Array.isArray(catValue)) {
        for (const term of catValue) {
          rows.push({ id: term.id, name: term.name });
        }
      } else if (catValue !== null && typeof catValue === 'object') {
        for (const terms of Object.values(catValue)) {
          if (Array.isArray(terms)) {
            for (const term of terms) {
              rows.push({ id: term.id, name: term.name });
            }
          }
        }
      }
    }
  }

  rows.sort((a, b) => a.id.localeCompare(b.id));

  const idCol = Math.max(...rows.map(r => r.id.length)) + 2;
  for (const { id, name } of rows) {
    console.log(`${id.padEnd(idCol)}${name}`);
  }

  console.log(`\n${rows.length} term${rows.length !== 1 ? 's' : ''} total`);
}

function cmdPrintSchema() {
  const strSet = new Set(SCHEMA_STRINGS);
  const arrSet = new Set(SCHEMA_ARRAYS);

  // Start with the canonical order, then append any fields not yet listed there.
  const ordered = [...SCHEMA_FIELD_ORDER];
  for (const f of [...SCHEMA_STRINGS, ...SCHEMA_ARRAYS]) {
    if (!ordered.includes(f)) ordered.push(f);
  }

  const lines = ['{'];
  ordered.forEach((field, i) => {
    const isArr      = arrSet.has(field);
    const defaultVal = isArr ? '[]' : '""';
    const typeLabel  = isArr ? 'string[]' : 'string';
    const extra      = SCHEMA_FIELD_ANNOTATIONS[field];
    const annotation = extra ? `${typeLabel}  (${extra})` : typeLabel;
    const comma      = i < ordered.length - 1 ? ',' : '';
    lines.push(`  "${field}": ${defaultVal}${comma}   // ${annotation}`);
  });
  lines.push('}');

  console.log(lines.join('\n'));
  console.log(`\n${ordered.length} fields  (${SCHEMA_STRINGS.length} string, ${SCHEMA_ARRAYS.length} array)`);
}

function cmdAppend(rawArgs) {
  // Maps user-supplied field name (any case/form) → actual JSON array field name.
  const FIELD_MAP = {
    'alias': 'aliases',              'aliases': 'aliases',
    'tag': 'tags',                   'tags': 'tags',
    'used-with': 'usedWith',         'usedwith': 'usedWith',
    'built-on': 'builtOn',           'builton': 'builtOn',
    'built-upon-by': 'builtUponBy',  'builtuponby': 'builtUponBy',
    'runs-on': 'runsOn',             'runson': 'runsOn',
    'alternative': 'alternatives',   'alternatives': 'alternatives',
    'part-of': 'partOf',             'partof': 'partOf',
    'include': 'includes',           'includes': 'includes',
    'example': 'examples',           'examples': 'examples',
    'use-case': 'useCases',          'usecase': 'useCases',
    'use-cases': 'useCases',         'usecases': 'useCases',
    'related-concept': 'relatedConcepts',  'relatedconcept': 'relatedConcepts',
    'related-concepts': 'relatedConcepts', 'relatedconcepts': 'relatedConcepts',
  };

  const VALID_FIELDS = [
    'aliases', 'tags', 'used-with', 'built-on', 'built-upon-by', 'runs-on',
    'alternatives', 'part-of', 'includes', 'examples', 'use-cases', 'related-concepts',
  ];

  if (rawArgs.length === 0) {
    console.error('Error: append requires a field name, an id, and at least one value.');
    console.error(`Valid fields: ${VALID_FIELDS.join(', ')}`);
    process.exit(1);
  }

  let fieldKey, id, values;

  if (!rawArgs[0].startsWith('--')) {
    // Flagless positional mode: append <field> <id> <val1> [val2 ...]
    fieldKey = rawArgs[0].toLowerCase();
    id       = rawArgs[1];
    values   = rawArgs.slice(2);
    if (!id) {
      console.error('Error: append <field> requires an id as the second positional argument.');
      process.exit(1);
    }
  } else {
    // Flag mode:
    //   append --<field> --id <id> --<field> val1 --<field> val2  (per-value flags)
    //   append --<field> --id <id> val1 val2                       (positional values)
    fieldKey = rawArgs[0].slice(2).toLowerCase();

    const idIdx = rawArgs.indexOf('--id');
    if (idIdx === -1 || !rawArgs[idIdx + 1] || rawArgs[idIdx + 1].startsWith('--')) {
      console.error('Error: append requires --id <term-id>.');
      process.exit(1);
    }
    id = rawArgs[idIdx + 1];

    values = [];
    let i = 0;
    while (i < rawArgs.length) {
      const arg  = rawArgs[i];
      const next = rawArgs[i + 1];
      if (arg === '--id') {
        i += 2; // skip --id and its value
      } else if (arg.startsWith('--')) {
        const key = arg.slice(2).toLowerCase();
        if (key === fieldKey && next && !next.startsWith('--')) {
          // --<field> value  pair
          values.push(next);
          i += 2;
        } else {
          i += 1; // leading field flag (before --id) or unrecognised — skip
        }
      } else {
        values.push(arg); // bare positional value
        i += 1;
      }
    }
  }

  const field = FIELD_MAP[fieldKey];
  if (!field) {
    console.error(`Error: unknown field "${fieldKey}".`);
    console.error(`Valid fields: ${VALID_FIELDS.join(', ')}`);
    process.exit(1);
  }

  if (values.length === 0) {
    console.error('Error: append requires at least one value.');
    process.exit(1);
  }

  const taxonomy = loadTaxonomy();
  const { term, termPath } = findTermById(taxonomy, id);

  if (!Array.isArray(term[field])) {
    console.error(`Error: field "${field}" on term "${id}" is not an array.`);
    process.exit(1);
  }

  const duplicates = values.filter(v => term[field].includes(v));
  const toAdd      = values.filter(v => !term[field].includes(v));

  if (duplicates.length > 0) {
    console.warn(`Warning: already present, skipping: ${duplicates.map(v => `"${v}"`).join(', ')}`);
  }

  if (toAdd.length === 0) {
    console.log('Nothing new to add — all values already present.');
    return;
  }

  term[field].push(...toAdd);
  saveTaxonomy(taxonomy);
  console.log(`Appended ${toAdd.length} value${toAdd.length !== 1 ? 's' : ''} to "${field}" on "${term.name}" (id: "${id}") in ${termPath.join(' → ')}:`);
  for (const v of toAdd) console.log(`  + ${v}`);
}

// ── Validators ───────────────────────────────────────────────────────────────
//
// Each validator is a function with the signature:
//   validator(taxonomy, opts) -> { issues: Issue[], fixes: FixFn[] }
//
// An Issue is:
//   { termId, termName, continent, category, subcategory, field, duplicates, pathStr }
//
// A FixFn is a zero-argument function that mutates the taxonomy in-place.

const ARRAY_FIELDS = [
  'aliases', 'tags', 'usedWith', 'builtOn', 'builtUponBy',
  'runsOn', 'alternatives', 'partOf', 'includes', 'examples',
  'useCases', 'relatedConcepts',
];

// Walk every term in the taxonomy, calling cb(term, continent, category, subcategory).
function walkTerms(taxonomy, cb) {
  for (const [continentName, continentData] of Object.entries(taxonomy)) {
    if (continentData === null || typeof continentData !== 'object') continue;
    for (const [catName, catValue] of Object.entries(continentData)) {
      if (Array.isArray(catValue)) {
        for (const term of catValue) {
          if (term && typeof term === 'object') cb(term, continentName, catName, '');
        }
      } else if (catValue !== null && typeof catValue === 'object') {
        for (const [subName, subValue] of Object.entries(catValue)) {
          if (Array.isArray(subValue)) {
            for (const term of subValue) {
              if (term && typeof term === 'object') cb(term, continentName, catName, subName);
            }
          }
        }
      }
    }
  }
}

// Returns a flat list of { term, parentArray, continent, category, subcategory }
// for every term in the taxonomy. Useful for validators that need parent refs.
function collectTermEntries(taxonomy) {
  const entries = [];
  for (const [continentName, continentData] of Object.entries(taxonomy)) {
    if (!continentData || typeof continentData !== 'object') continue;
    for (const [catName, catValue] of Object.entries(continentData)) {
      if (Array.isArray(catValue)) {
        for (const term of catValue) {
          if (term && typeof term === 'object')
            entries.push({ term, parentArray: catValue, continent: continentName, category: catName, subcategory: '' });
        }
      } else if (catValue && typeof catValue === 'object') {
        for (const [subName, subValue] of Object.entries(catValue)) {
          if (Array.isArray(subValue)) {
            for (const term of subValue) {
              if (term && typeof term === 'object')
                entries.push({ term, parentArray: subValue, continent: continentName, category: catName, subcategory: subName });
            }
          }
        }
      }
    }
  }
  return entries;
}

/**
 * Validator: find duplicate values inside each term's array fields.
 * Comparison is case-insensitive and whitespace-trimmed.
 * Returns issues and corresponding fix functions (mutate in-place).
 */
function validateFieldDuplicates(taxonomy) {
  const issues = [];
  const fixes   = [];

  walkTerms(taxonomy, (term, continent, category, subcategory) => {
    const termId   = term.id   ?? '?';
    const termName = term.name ?? '?';
    const pathStr  = subcategory
      ? `${continent} > ${category} > ${subcategory}`
      : `${continent} > ${category}`;

    for (const field of ARRAY_FIELDS) {
      const arr = term[field];
      if (!Array.isArray(arr) || arr.length < 2) continue;

      const seen    = new Map(); // normalised -> first index
      const dupVals = [];       // original values that are duplicates

      for (let i = 0; i < arr.length; i++) {
        if (typeof arr[i] !== 'string') continue;
        const norm = arr[i].trim().toLowerCase();
        if (seen.has(norm)) {
          dupVals.push(arr[i]);
        } else {
          seen.set(norm, i);
        }
      }

      if (dupVals.length > 0) {
        issues.push({ termId, termName, continent, category, subcategory, field, duplicates: dupVals, pathStr });

        // Capture references for the fix closure
        const capturedField = field;
        const capturedTerm  = term;
        fixes.push(() => {
          const seenNorm = new Set();
          capturedTerm[capturedField] = capturedTerm[capturedField].filter(v => {
            if (typeof v !== 'string') return true;
            const n = v.trim().toLowerCase();
            if (seenNorm.has(n)) return false;
            seenNorm.add(n);
            return true;
          });
        });
      }
    }
  });

  return { issues, fixes };
}

/**
 * Validator: find terms that share the same id or name (fixable),
 * and terms whose name matches another term's alias (warn-only, not fixable).
 */
function validateTermDuplicates(taxonomy) {
  const issues = [];
  const fixes  = [];

  const entries = collectTermEntries(taxonomy);

  // Build first-seen maps keyed on normalised value
  const byId    = new Map(); // normId    → entry
  const byName  = new Map(); // normName  → entry
  const byAlias = new Map(); // normAlias → entry (for name-matches-alias check)

  for (const e of entries) {
    const normId   = (e.term.id   ?? '').trim().toLowerCase();
    const normName = (e.term.name ?? '').trim().toLowerCase();
    if (normId   && !byId.has(normId))     byId.set(normId, e);
    if (normName && !byName.has(normName)) byName.set(normName, e);
    if (Array.isArray(e.term.aliases)) {
      for (const alias of e.term.aliases) {
        if (typeof alias === 'string') {
          const n = alias.trim().toLowerCase();
          if (n && !byAlias.has(n)) byAlias.set(n, e);
        }
      }
    }
  }

  const pathOf = e => e.subcategory
    ? `${e.continent} > ${e.category} > ${e.subcategory}`
    : `${e.continent} > ${e.category}`;

  for (const e of entries) {
    const { term } = e;
    const normId   = (term.id   ?? '').trim().toLowerCase();
    const normName = (term.name ?? '').trim().toLowerCase();
    const termPath = pathOf(e);

    // Duplicate ID (fixable — remove second occurrence)
    const firstById = byId.get(normId);
    if (firstById && firstById.term !== term) {
      issues.push({
        type: 'duplicate-id', fixable: true,
        termA: { id: firstById.term.id, name: firstById.term.name, pathStr: pathOf(firstById) },
        termB: { id: term.id, name: term.name, pathStr: termPath },
      });
      const arr = e.parentArray, t = term;
      fixes.push(() => { const i = arr.indexOf(t); if (i !== -1) arr.splice(i, 1); });
    }

    // Duplicate name (fixable — remove second occurrence)
    const firstByName = byName.get(normName);
    if (firstByName && firstByName.term !== term) {
      issues.push({
        type: 'duplicate-name', fixable: true,
        termA: { id: firstByName.term.id, name: firstByName.term.name, pathStr: pathOf(firstByName) },
        termB: { id: term.id, name: term.name, pathStr: termPath },
      });
      const arr = e.parentArray, t = term;
      fixes.push(() => { const i = arr.indexOf(t); if (i !== -1) arr.splice(i, 1); });
    }

    // Name matches another term's alias (warn-only, not fixable)
    const aliasEntry = byAlias.get(normName);
    if (aliasEntry && aliasEntry.term !== term) {
      issues.push({
        type: 'name-matches-alias', fixable: false,
        termA: { id: aliasEntry.term.id, name: aliasEntry.term.name, pathStr: pathOf(aliasEntry) },
        termB: { id: term.id, name: term.name, pathStr: termPath },
        aliasValue: term.name,
      });
    }
  }

  return { issues, fixes };
}

// ── Validate commands ─────────────────────────────────────────────────────────

function cmdValidateFieldDuplicates(flags) {
  const fixMode  = flags.fix === true;
  const taxonomy = loadTaxonomy();

  let termsScanned  = 0;
  let fieldsScanned = 0;
  let totalListItems = 0;
  walkTerms(taxonomy, (term) => {
    termsScanned++;
    fieldsScanned += ARRAY_FIELDS.length;
    totalListItems += ARRAY_FIELDS.reduce((sum, f) =>
      sum + (Array.isArray(term[f]) ? term[f].length : 0), 0);
  });

  const { issues, fixes } = validateFieldDuplicates(taxonomy);

  if (issues.length === 0) {
    console.log('No duplicate field values found.');
  } else {
    for (const iss of issues) {
      const sub = iss.subcategory ? ` > ${iss.subcategory}` : '';
      console.log([
        '',
        'Duplicate found:',
        '',
        `  Path:       ${iss.pathStr}`,
        `  Term:       ${iss.termId} (${iss.termName})`,
        `  Field:      ${iss.field}`,
        `  Duplicates: ${iss.duplicates.join(', ')}`,
      ].join('\n'));
    }
  }

  const totalDups = issues.reduce((n, iss) => n + iss.duplicates.length, 0);
  let removed = 0;

  if (fixMode && issues.length > 0) {
    fixes.forEach(fn => fn());
    removed = totalDups;
    saveTaxonomy(taxonomy);
    console.log('\ntaxonomy.json updated.');
  }

  console.log([
    '',
    '─'.repeat(40),
    `  Terms scanned:             ${termsScanned}`,
    `  Fields scanned:            ${fieldsScanned}`,
    `  Total list items:          ${totalListItems}`,
    `  Duplicate entries found:   ${totalDups}`,
    `  Expected entries after:   ${totalListItems - totalDups}`,
    `  Duplicate entries removed: ${removed}`,
  ].join('\n'));

  // Per-term duplicate count summary (only terms that have duplicates)
  if (issues.length > 0) {
    // Build per-term totals: duplicate count + total list-field item count
    const byTerm = new Map(); // termId -> { termName, count, totalItems }
    for (const iss of issues) {
      if (!byTerm.has(iss.termId)) {
        byTerm.set(iss.termId, { termName: iss.termName, count: 0, totalItems: 0 });
      }
      byTerm.get(iss.termId).count += iss.duplicates.length;
    }

    // Second pass: sum all list-field lengths for each affected term
    walkTerms(taxonomy, (term) => {
      if (!byTerm.has(term.id)) return;
      const entry = byTerm.get(term.id);
      entry.totalItems = ARRAY_FIELDS.reduce((sum, f) =>
        sum + (Array.isArray(term[f]) ? term[f].length : 0), 0);
    });

    const rows = [...byTerm.entries()]
      .sort((a, b) => b[1].count - a[1].count || a[0].localeCompare(b[0]));

    const labelCol = Math.max(...rows.map(([id]) => id.length)) + 2;
    console.log('\n' + '─'.repeat(40));
    console.log('  Terms with duplicates:\n');
    for (const [id, { termName, count, totalItems }] of rows) {
      const label    = `${id} (${termName})`;
      const dupPart  = `${count} duplicate${count !== 1 ? 's' : ''}`;
      const outOf    = totalItems > 0 ? ` (out of ${totalItems} list items)` : '';
      console.log(`  ${label.padEnd(labelCol)}  ${dupPart}${outOf}`);
    }
  }

  if (!fixMode && issues.length > 0) {
    console.log('\nRun with --fix to remove duplicates.');
  }
}

function cmdValidateTermDuplicates(flags) {
  const fixMode  = flags.fix === true;
  const taxonomy = loadTaxonomy();

  let termsScanned = 0;
  walkTerms(taxonomy, () => { termsScanned++; });

  const { issues, fixes } = validateTermDuplicates(taxonomy);

  const fixable  = issues.filter(i =>  i.fixable);
  const warnOnly = issues.filter(i => !i.fixable);

  if (issues.length === 0) {
    console.log('No term-level duplicates found.');
  } else {
    for (const iss of fixable) {
      const typeLabel = iss.type === 'duplicate-id' ? 'Duplicate ID' : 'Duplicate name';
      console.log([
        '',
        `${typeLabel}:`,
        '',
        `  Term A:  ${iss.termA.id} (${iss.termA.name})`,
        `           ${iss.termA.pathStr}`,
        `  Term B:  ${iss.termB.id} (${iss.termB.name})`,
        `           ${iss.termB.pathStr}`,
      ].join('\n'));
    }

    if (warnOnly.length > 0) {
      console.log('\n' + '─'.repeat(40));
      console.log('  Warnings (manual review — excluded from --fix):\n');
      for (const iss of warnOnly) {
        const pad = ' '.repeat(Math.max(0, iss.termA.id.length + iss.termA.name.length + 4));
        console.log([
          '',
          'Name matches alias:',
          '',
          `  "${iss.aliasValue}" is the name of:   ${iss.termB.id} (${iss.termB.name})`,
          `                           ${iss.termB.pathStr}`,
          `  But is also an alias of: ${iss.termA.id} (${iss.termA.name})`,
          `                           ${iss.termA.pathStr}`,
        ].join('\n'));
      }
    }
  }

  let removed = 0;
  if (fixMode && fixable.length > 0) {
    fixes.forEach(fn => fn());
    removed = fixable.length;
    saveTaxonomy(taxonomy);
    console.log('\ntaxonomy.json updated.');
  }

  const dupIds   = fixable.filter(i => i.type === 'duplicate-id').length;
  const dupNames = fixable.filter(i => i.type === 'duplicate-name').length;
  console.log([
    '',
    '─'.repeat(40),
    `  Terms scanned:         ${termsScanned}`,
    `  Duplicate IDs found:   ${dupIds}`,
    `  Duplicate names found: ${dupNames}`,
    `  Name/alias conflicts:  ${warnOnly.length}`,
    `  Terms removed (fix):   ${removed}`,
  ].join('\n'));

  if (!fixMode && fixable.length > 0) {
    console.log('\nRun with --fix to remove duplicate terms (keeps first occurrence).');
  }
}

// ── Command registry ──────────────────────────────────────────────────────────

const COMMANDS = {
  'add-term':    { fn: cmdAddTerm,    desc: 'Add a term to the taxonomy' },
  'remove-term': { fn: cmdRemoveTerm, desc: 'Remove a term from the taxonomy by ID' },
  'update-term': { fn: cmdUpdateTerm, desc: 'Update any field of a term (except location fields)' },
  'move-term':   { fn: cmdMoveTerm,   desc: 'Move a term to a different category or subcategory' },
  'add-alias':              { fn: cmdAddAlias,              desc: 'Append one or more aliases to a term' },
  'add-tag':                { fn: cmdAddTag,                desc: 'Append one or more tags to a term' },
  'add-used-with':          { fn: cmdAddUsedWith,          desc: 'Append one or more used-with entries to a term' },
  'add-built-on':           { fn: cmdAddBuiltOn,           desc: 'Append one or more built-on entries to a term' },
  'add-built-upon-by':      { fn: cmdAddBuiltUponBy,       desc: 'Append one or more built-upon-by entries to a term' },
  'add-runs-on':            { fn: cmdAddRunsOn,            desc: 'Append one or more runs-on entries to a term' },
  'add-alternative':        { fn: cmdAddAlternative,       desc: 'Append one or more alternatives to a term' },
  'add-part-of':            { fn: cmdAddPartOf,            desc: 'Append one or more part-of entries to a term' },
  'add-include':            { fn: cmdAddInclude,           desc: 'Append one or more includes to a term' },
  'add-example':            { fn: cmdAddExample,           desc: 'Append one or more examples to a term' },
  'add-use-case':           { fn: cmdAddUseCase,           desc: 'Append one or more use cases to a term' },
  'add-related-concept':    { fn: cmdAddRelatedConcept,    desc: 'Append one or more related concepts to a term' },
  'print-landscape-overview':  { fn: cmdPrintLandscapeOverview,  desc: 'Print a structural overview of the taxonomy with counts' },
  'print-terms':               { fn: cmdPrintTerms,               desc: 'Print a sorted list of all terms with their location' },
  'print-terms-by-category':   { fn: cmdPrintTermsByCategory,     desc: 'Print terms grouped by category; use --subcategory to show subcategory breakdowns' },
  'print-ids':                 { fn: cmdPrintIds,                 desc: 'Print a sorted list of all term ids and names' },
  'print-schema':             { fn: cmdPrintSchema,             desc: 'Print the current term JSON schema with field types' },
  'append':                   { fn: cmdAppend, raw: true,        desc: 'Append values to any array field on a term' },
  'which-are-dups':           { fn: cmdWhichAreDups,           desc: 'Check a list of names/ids and report duplicates vs new terms' },
  'validate-field-duplicates': { fn: cmdValidateFieldDuplicates, desc: 'Report (or fix) duplicate values in array fields across all terms' },
  'validate-term-duplicates':  { fn: cmdValidateTermDuplicates,  desc: 'Report (or fix) terms with duplicate id or name; warn on name/alias conflicts' },
};

// ── Help ──────────────────────────────────────────────────────────────────────

function printUsage() {
  const cmdList = Object.entries(COMMANDS)
    .map(([name, { desc }]) => `  ${name.padEnd(14)} ${desc}`)
    .join('\n');

  console.error([
    'Usage: node taxonomy.js <command> [flags]',
    '',
    'Commands:',
    cmdList,
    '',
    'add-term flags:',
    '  --path           "Continent > Category" or "Continent > Category > Subcategory"  (replaces --continent/--category/--subcategory)',
    '  --continent      (required if --path not used)',
    '  --category       (required if --path not used)',
    '  --subcategory    (optional if --path not used)',
    '  --id             (required)',
    '  --name           (required)',
    '  --alias          (optional, repeatable)',
    '  --note           (optional)',
    '  --tag            (optional, repeatable)',
    '  --what-is-it     (optional)',
    '  --description    (optional)',
    '  --used-with      (optional, repeatable)',
    '  --built-on       (optional, repeatable)',
    '  --built-upon-by  (optional, repeatable)',
    '  --runs-on        (optional, repeatable)',
    '  --alternative    (optional, repeatable)',
    '  --part-of        (optional, repeatable)',
    '  --include        (optional, repeatable)',
    '  --example        (optional, repeatable)',
    '  --use-case       (optional, repeatable)',
    '  --related-concept(optional, repeatable)',
    '',
    'remove-term flags:',
    '  --id             (required)',
    '',
    'update-term flags:',
    '  --id             (required)',
    '  --name           (optional)',
    '  --note           (optional — replaces)',
    '  --what-is-it     (optional — replaces)',
    '  --description    (optional — replaces)',
    '  --alias          (optional, repeatable — appends)',
    '  --tag            (optional, repeatable — appends)',
    '  --used-with      (optional, repeatable — appends)',
    '  --built-on       (optional, repeatable — appends)',
    '  --built-upon-by  (optional, repeatable — appends)',
    '  --runs-on        (optional, repeatable — appends)',
    '  --alternative    (optional, repeatable — appends)',
    '  --part-of        (optional, repeatable — appends)',
    '  --include        (optional, repeatable — appends)',
    '  --example        (optional, repeatable — appends)',
    '  --use-case       (optional, repeatable — appends)',
    '  --related-concept(optional, repeatable — appends)',
    '  --clear-aliases / --clear-tags / --clear-notes / --clear-what-is-it / --clear-description',
    '  --clear-used-with / --clear-built-on / --clear-built-upon-by / --clear-runs-on',
    '  --clear-alternatives / --clear-part-of / --clear-includes / --clear-examples',
    '  --clear-use-cases / --clear-related-concepts',
    '',
    'move-term flags:',
    '  --id             (required)',
    '  --continent      (required, destination)',
    '  --category       (required, destination)',
    '  --subcategory    (optional, destination)',
    '',
    'add-alias flags:',
    '  --id             (required)',
    '  --alias          (required, repeatable)',
    '',
    'add-tag flags:',
    '  --id             (required)',
    '  --tag            (required, repeatable)',
    '',
    'add-used-with flags:',
    '  --id             (required)',
    '  --used-with      (required, repeatable)',
    '',
    'add-built-on flags:',
    '  --id             (required)',
    '  --built-on       (required, repeatable)',
    '',
    'add-built-upon-by flags:',
    '  --id             (required)',
    '  --built-upon-by  (required, repeatable)',
    '',
    'add-runs-on flags:',
    '  --id             (required)',
    '  --runs-on        (required, repeatable)',
    '',
    'add-alternative flags:',
    '  --id             (required)',
    '  --alternative    (required, repeatable)',
    '',
    'add-part-of flags:',
    '  --id             (required)',
    '  --part-of        (required, repeatable)',
    '',
    'add-include flags:',
    '  --id             (required)',
    '  --include        (required, repeatable)',
    '',
    'add-example flags:',
    '  --id             (required)',
    '  --example        (required, repeatable)',
    '',
    'add-use-case flags:',
    '  --id             (required)',
    '  --use-case       (required, repeatable)',
    '',
    'add-related-concept flags:',
    '  --id             (required)',
    '  --related-concept(required, repeatable)',
    '',
    'print-landscape-overview flags:',
    '  (none)',
    '',
    'print-terms flags:',
    '  (none)          Default mode — print terms sorted alphabetically within each continent',
    '  --sort-by-size  Sort terms by total list-field item count (descending) instead of alphabetically',
    '',
    'print-ids flags:',
    '  (none)          Print all term ids and names, sorted alphabetically by id',
    '',
    'print-schema flags:',
    '  (none)          Print the current term JSON schema with field types and annotations',
    '',
    'append usage (three equivalent forms):',
    '  append --<field> --id <id> --<field> val1 --<field> val2',
    '  append --<field> --id <id> val1 val2',
    '  append <field> <id> val1 val2',
    '  Valid fields: aliases, tags, used-with, built-on, built-upon-by, runs-on,',
    '                alternatives, part-of, includes, examples, use-cases, related-concepts',
    '',
    'validate-field-duplicates flags:',
    '  (none)        Report mode — print all duplicate values found in array fields',
    '  --fix         Fix mode — remove duplicates and write taxonomy.json',
    '',
    'validate-term-duplicates flags:',
    '  (none)        Report mode — find terms sharing an id or name; warn on name/alias conflicts',
    '  --fix         Fix mode — remove duplicate terms (second occurrence); name/alias conflicts excluded',
    '',
    'which-are-dups flags:',

    '  --name           (repeatable — check by display name or alias, case-insensitive)',
    '  --id             (optional, repeatable — check by term id)',
  ].join('\n'));
}

// ── Entry point ───────────────────────────────────────────────────────────────

function main() {
  const [,, command, ...rest] = process.argv;

  if (!command || command === '--help' || command === '-h') {
    printUsage();
    process.exit(command ? 0 : 1);
  }

  if (!COMMANDS[command]) {
    console.error(`Error: unknown command "${command}".`);
    console.error(`Available commands: ${Object.keys(COMMANDS).join(', ')}`);
    process.exit(1);
  }

  // Commands with raw:true receive the unparsed argv slice instead of parsed flags.
  // This lets them implement their own positional/flagless syntax.
  if (COMMANDS[command].raw) {
    COMMANDS[command].fn(rest);
  } else {
    COMMANDS[command].fn(parseFlags(rest));
  }
}

main();
