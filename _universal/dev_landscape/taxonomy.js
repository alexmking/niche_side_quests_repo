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
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags.alias) {
    console.error('Error: missing required argument: --alias');
    process.exit(1);
  }

  const incoming = [].concat(flags.alias);
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
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }
  if (!flags.tag) {
    console.error('Error: missing required argument: --tag');
    process.exit(1);
  }

  const incoming = [].concat(flags.tag);
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

function cmdPrintTerms() {
  const taxonomy = loadTaxonomy();

  // Collect terms per continent, then sort each group alphabetically
  const byContinent = {};
  for (const [continentName, continentData] of Object.entries(taxonomy)) {
    const group = [];
    for (const [catName, catValue] of Object.entries(continentData)) {
      if (Array.isArray(catValue)) {
        for (const term of catValue) {
          group.push(`${term.name}  —  ${continentName} > ${catName}`);
        }
      } else if (catValue !== null && typeof catValue === 'object') {
        for (const [subName, terms] of Object.entries(catValue)) {
          if (Array.isArray(terms)) {
            for (const term of terms) {
              group.push(`${term.name}  —  ${continentName} > ${catName} > ${subName}`);
            }
          }
        }
      }
    }
    group.sort((a, b) => a.localeCompare(b));
    byContinent[continentName] = group;
  }

  let total = 0;
  const continentNames = Object.keys(byContinent);
  continentNames.forEach((continentName, i) => {
    const group = byContinent[continentName];
    const divider = '─'.repeat(50);
    console.log(`${divider}\n  ${continentName.toUpperCase()}  (${group.length} term${group.length !== 1 ? 's' : ''})\n${divider}`);
    group.forEach(l => console.log(l));
    total += group.length;
    if (i < continentNames.length - 1) console.log('');
  });

  console.log(`\n${'─'.repeat(50)}\n${total} term${total !== 1 ? 's' : ''} total`);
}

// ── Command registry ──────────────────────────────────────────────────────────

const COMMANDS = {
  'add-term':    { fn: cmdAddTerm,    desc: 'Add a term to the taxonomy' },
  'remove-term': { fn: cmdRemoveTerm, desc: 'Remove a term from the taxonomy by ID' },
  'update-term': { fn: cmdUpdateTerm, desc: 'Update any field of a term (except location fields)' },
  'move-term':   { fn: cmdMoveTerm,   desc: 'Move a term to a different category or subcategory' },
  'add-alias':              { fn: cmdAddAlias,              desc: 'Append one or more aliases to a term' },
  'add-tag':                { fn: cmdAddTag,                desc: 'Append one or more tags to a term' },
  'print-landscape-overview': { fn: cmdPrintLandscapeOverview, desc: 'Print a structural overview of the taxonomy with counts' },
  'print-terms':              { fn: cmdPrintTerms,              desc: 'Print a sorted list of all terms with their location' },
  'which-are-dups':           { fn: cmdWhichAreDups,           desc: 'Check a list of names/ids and report duplicates vs new terms' },
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
    'print-landscape-overview flags:',
    '  (none)',
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

  COMMANDS[command].fn(parseFlags(rest));
}

main();
