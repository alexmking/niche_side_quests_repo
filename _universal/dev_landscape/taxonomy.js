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

// Parses --flag value pairs from an argv slice.
// Flags that appear more than once are accumulated into an array.
// Positional arguments (not starting with --) are collected into result._
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

    const key   = flag.slice(2);
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

// ── Commands ──────────────────────────────────────────────────────────────────

function cmdAddTerm(flags) {
  const missing = ['continent', 'category', 'id', 'name'].filter(k => !flags[k]);
  if (missing.length > 0) {
    console.error(`Error: missing required argument(s): ${missing.map(k => `--${k}`).join(', ')}`);
    process.exit(1);
  }

  const { continent, category, subcategory, id, name } = flags;
  const aliases = flags.alias ? [].concat(flags.alias) : [];
  const notes   = flags.note  ?? '';
  const tags    = flags.tag   ? [].concat(flags.tag)   : [];

  const taxonomy = loadTaxonomy();

  if (collectAllIds(taxonomy).has(id)) {
    console.error(`Error: term id "${id}" already exists in taxonomy.json.`);
    process.exit(1);
  }

  const targetArray = resolveTargetArray(taxonomy, { continent, category, subcategory });
  targetArray.push({ id, name, aliases, notes, tags });
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

  saveTaxonomy(taxonomy);
  console.log(`Moved "${term.name}" (id: "${id}") from ${sourcePathStr} → ${destPath}.`);
}

function cmdUpdateTerm(flags) {
  if (!flags.id) {
    console.error('Error: missing required argument: --id');
    process.exit(1);
  }

  const updatable = ['name', 'alias', 'note', 'tag'];
  const provided  = updatable.filter(k => k in flags);

  if (provided.length === 0) {
    console.error('Error: no fields to update. Provide at least one of: --name, --alias, --note, --tag');
    process.exit(1);
  }

  const { id } = flags;
  const taxonomy = loadTaxonomy();
  let term     = null;
  let termPath = null;

  function walk(node, breadcrumb) {
    if (term) return;

    if (Array.isArray(node)) {
      const found = node.find(t => t?.id === id);
      if (found) {
        term     = found;
        termPath = breadcrumb;
      }
    } else if (node !== null && typeof node === 'object') {
      for (const [key, child] of Object.entries(node)) {
        walk(child, [...breadcrumb, key]);
      }
    }
  }

  walk(taxonomy, []);

  if (!term) {
    console.error(`Error: term id "${id}" not found in taxonomy.json.`);
    process.exit(1);
  }

  const changes = [];

  if ('name' in flags) {
    const oldVal = term.name;
    term.name = flags.name;
    changes.push(`name: "${oldVal}" → "${flags.name}"`);
  }

  if ('alias' in flags) {
    const newAliases = [].concat(flags.alias);
    term.aliases = newAliases;
    changes.push(`aliases: [${newAliases.map(a => `"${a}"`).join(', ')}]`);
  }

  if ('note' in flags) {
    term.notes = flags.note;
    changes.push(`notes: "${flags.note}"`);
  }

  if ('tag' in flags) {
    const newTags = [].concat(flags.tag);
    term.tags = newTags;
    changes.push(`tags: [${newTags.map(t => `"${t}"`).join(', ')}]`);
  }

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

// ── Command registry ──────────────────────────────────────────────────────────

const COMMANDS = {
  'add-term':    { fn: cmdAddTerm,    desc: 'Add a term to the taxonomy' },
  'remove-term': { fn: cmdRemoveTerm, desc: 'Remove a term from the taxonomy by ID' },
  'update-term': { fn: cmdUpdateTerm, desc: 'Update the name, aliases, notes, or tags of a term' },
  'move-term':   { fn: cmdMoveTerm,   desc: 'Move a term to a different category or subcategory' },
  'add-alias':              { fn: cmdAddAlias,              desc: 'Append one or more aliases to a term' },
  'add-tag':                { fn: cmdAddTag,                desc: 'Append one or more tags to a term' },
  'print-landscape-overview': { fn: cmdPrintLandscapeOverview, desc: 'Print a structural overview of the taxonomy with counts' },
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
    '  --continent    (required)',
    '  --category     (required)',
    '  --subcategory  (optional)',
    '  --id           (required)',
    '  --name         (required)',
    '  --alias        (optional, repeatable)',
    '  --note         (optional)',
    '  --tag          (optional, repeatable)',
    '',
    'remove-term flags:',
    '  --id           (required)',
    '',
    'update-term flags:',
    '  --id           (required)',
    '  --name         (optional)',
    '  --alias        (optional, repeatable — replaces existing aliases)',
    '  --note         (optional — replaces existing note)',
    '  --tag          (optional, repeatable — replaces existing tags)',
    '',
    'move-term flags:',
    '  --id           (required)',
    '  --continent    (required, destination)',
    '  --category     (required, destination)',
    '  --subcategory  (optional, destination)',
    '',
    'add-alias flags:',
    '  --id           (required)',
    '  --alias        (required, repeatable)',
    '',
    'add-tag flags:',
    '  --id           (required)',
    '  --tag          (required, repeatable)',
    '',
    'print-landscape-overview flags:',
    '  (none)',
    '',
    'which-are-dups flags:',
    '  --name         (required, repeatable — check by display name or alias, case-insensitive)',
    '  --id           (optional, repeatable — check by term id)',
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
