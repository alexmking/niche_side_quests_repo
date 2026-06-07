/**
 * script.js — Software Development Taxonomy Viewer
 *
 * Hierarchy assumed: continent → category → optional subcategory → term[]
 * Terms have: { id, name, aliases, notes, tags }
 */
(function () {
  'use strict';

  // ── State ──────────────────────────────────────────────────────
  let _taxonomy = null;
  let _rules    = null;
  let _panelOpen = false;

  // ── DOM helpers ────────────────────────────────────────────────
  function $(id) { return document.getElementById(id); }

  function el(tag, props, children) {
    const e = document.createElement(tag);
    if (props) {
      for (const [k, v] of Object.entries(props)) {
        if (k === 'className')    e.className   = v;
        else if (k === 'text')    e.textContent = v;
        else if (k === 'html')    e.innerHTML   = v;
        else                      e.setAttribute(k, v);
      }
    }
    if (children) {
      for (const child of children) {
        if (!child) continue;
        e.appendChild(typeof child === 'string'
          ? document.createTextNode(child) : child);
      }
    }
    return e;
  }

  function esc(str) {
    return String(str ?? '')
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  // Convert a continent name to a CSS-safe slug for theming.
  // Known continents map to predefined theme classes; unknown get 'unknown'.
  const CONTINENT_SLUGS = {
    'development':    'development',
    'infrastructure': 'infrastructure',
    'engineering':    'engineering',
  };

  function continentSlug(name) {
    const key = name.toLowerCase().replace(/\s+/g, '-').replace(/[^a-z0-9-]/g, '');
    return CONTINENT_SLUGS[key] ?? 'unknown';
  }

  // ── Data loading ───────────────────────────────────────────────
  async function loadData() {
    const [taxRes, rulesRes] = await Promise.all([
      fetch('taxonomy.json'),
      fetch('rules.json'),
    ]);

    if (!taxRes.ok)   throw new Error(`HTTP ${taxRes.status} — taxonomy.json`);
    if (!rulesRes.ok) throw new Error(`HTTP ${rulesRes.status} — rules.json`);

    _taxonomy = await taxRes.json();
    _rules    = await rulesRes.json();
  }

  function showLoadError(msg) {
    $('taxonomy-root').innerHTML = `
      <div class="error-state">
        <h2 class="error-title">Could not load taxonomy data</h2>
        <p>${esc(msg)}</p>
        <p>
          This viewer uses <code>fetch()</code> and requires a local web server
          (opening as a <code>file://</code> URL is blocked by browsers).
        </p>
        <p>From the directory that contains <code>index.html</code>, run:</p>
        <pre><code>python3 -m http.server 8080</code></pre>
        <p>Then open
          <a href="http://localhost:8080" target="_blank" rel="noopener noreferrer">
            http://localhost:8080
          </a>
        </p>
      </div>
    `;
  }

  // ── Rendering: taxonomy ────────────────────────────────────────
  function renderTaxonomy() {
    if (_rules?.taxonomy_name) {
      $('header-tagline').textContent = _rules.taxonomy_name;
    }

    const root = $('taxonomy-root');
    root.innerHTML = '';

    const frag = document.createDocumentFragment();
    for (const [continentName, continentData] of Object.entries(_taxonomy)) {
      const question = _rules?.continents?.[continentName]?.question ?? '';
      frag.appendChild(buildContinent(continentName, continentData, question));
    }
    root.appendChild(frag);
  }

  function buildContinent(name, data, question) {
    const section = el('section', {
      className: `continent continent-${continentSlug(name)}`,
    });
    section.dataset.continent = name;

    const inner = el('div', { className: 'continent-inner' });

    // Header bar
    const header = el('div', { className: 'continent-header' }, [
      el('span', { className: 'continent-name', text: name }),
      question ? el('span', { className: 'continent-question', text: question }) : null,
    ]);

    // Grid of category cards
    const body = el('div', { className: 'continent-body' });
    for (const [catName, catValue] of Object.entries(data)) {
      body.appendChild(buildCategoryCard(catName, catValue, name));
    }

    inner.appendChild(header);
    inner.appendChild(body);
    section.appendChild(inner);
    return section;
  }

  function buildCategoryCard(name, value, continentName) {
    const card = el('div', { className: 'category-card' });
    card.dataset.continent = continentName;
    card.dataset.category  = name;

    // Collapsible header
    const cardHeader = el('div', { className: 'category-card-header' });
    cardHeader.appendChild(el('h3', { className: 'category-card-title', text: name }));

    const toggleBtn = el('button', {
      className: 'collapse-toggle',
      type: 'button',
      'aria-label': `Toggle ${name}`,
      html: `<svg width="14" height="14" viewBox="0 0 24 24" fill="none"
               stroke="currentColor" stroke-width="2.5" aria-hidden="true">
               <path d="m6 9 6 6 6-6"/>
             </svg>`,
    });

    cardHeader.appendChild(toggleBtn);
    cardHeader.addEventListener('click', () => card.classList.toggle('collapsed'));

    const cardBody = el('div', { className: 'category-card-body' });

    if (Array.isArray(value)) {
      // Category has terms directly (no subcategories)
      cardBody.appendChild(buildTermsWrap(value, {
        continent:   continentName,
        category:    name,
        subcategory: null,
      }));
    } else {
      // Category has subcategories (each value is a term array)
      for (const [subcatName, terms] of Object.entries(value)) {
        cardBody.appendChild(buildSubcategory(subcatName, terms, {
          continent: continentName,
          category:  name,
        }));
      }
    }

    card.appendChild(cardHeader);
    card.appendChild(cardBody);
    return card;
  }

  function buildSubcategory(name, terms, path) {
    const div = el('div', { className: 'subcategory' });
    div.dataset.subcategory = name;
    div.appendChild(el('p', { className: 'subcategory-label', text: name }));
    div.appendChild(buildTermsWrap(terms, { ...path, subcategory: name }));
    return div;
  }

  function buildTermsWrap(terms, path) {
    const wrap = el('div', { className: 'terms-wrap' });
    for (const term of terms) {
      wrap.appendChild(buildTermChip(term, path));
    }
    return wrap;
  }

  function buildTermChip(term, path) {
    const chip = el('span', {
      className: 'term-chip',
      role: 'button',
      tabindex: '0',
      title: `${term.id}`,
    });

    chip.textContent = term.name;

    // Data attributes for search filtering
    chip.dataset.id          = term.id;
    chip.dataset.nameLower   = term.name.toLowerCase();
    chip.dataset.aliasesLower = (term.aliases ?? []).join('\n').toLowerCase();

    // Stash path for detail panel (not rendered to DOM)
    chip._term = term;
    chip._path = path;

    chip.addEventListener('click', () => openDetail(term, path));
    chip.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        openDetail(term, path);
      }
    });

    return chip;
  }

  // ── Detail panel ──────────────────────────────────────────────
  function openDetail(term, path) {
    // Highlight selected chip(s)
    document.querySelectorAll('.term-chip.selected')
      .forEach(c => c.classList.remove('selected'));
    document.querySelectorAll(`.term-chip[data-id="${CSS.escape(term.id)}"]`)
      .forEach(c => c.classList.add('selected'));

    // Breadcrumb
    const bcEl = $('detail-breadcrumb');
    bcEl.innerHTML = '';
    const parts = [path.continent, path.category];
    if (path.subcategory) parts.push(path.subcategory);
    parts.push(term.name);

    parts.forEach((part, i) => {
      if (i > 0) bcEl.appendChild(el('span', { className: 'bc-sep', html: '&rsaquo;' }));
      bcEl.appendChild(el('span', {
        className: i === parts.length - 1 ? 'bc-current' : 'bc-ancestor',
        text: part,
      }));
    });

    // Name
    $('detail-term-name').textContent = term.name;

    // Fields
    const fieldsEl = $('detail-fields');
    fieldsEl.innerHTML = '';

    const fieldDefs = [
      { label: 'ID',      value: term.id,               type: 'id'      },
      { label: 'Aliases', value: term.aliases ?? [],     type: 'aliases' },
      { label: 'Notes',   value: term.notes  ?? '',      type: 'notes'   },
      { label: 'Tags',    value: term.tags   ?? [],      type: 'tags'    },
    ];

    for (const def of fieldDefs) {
      const div = el('div', { className: 'detail-field' });
      const dt  = el('dt', { text: def.label });
      const dd  = el('dd');

      switch (def.type) {
        case 'id':
          dd.appendChild(el('code', { className: 'detail-id', text: def.value }));
          break;

        case 'aliases':
          if (def.value.length === 0) {
            dd.appendChild(el('span', { className: 'detail-empty', text: '—' }));
          } else {
            const wrap = el('span', { className: 'detail-aliases' });
            def.value.forEach(alias =>
              wrap.appendChild(el('span', { className: 'detail-alias', text: alias })));
            dd.appendChild(wrap);
          }
          break;

        case 'tags':
          if (def.value.length === 0) {
            dd.appendChild(el('span', { className: 'detail-empty', text: '—' }));
          } else {
            const wrap = el('span', { className: 'detail-tags' });
            def.value.forEach(tag =>
              wrap.appendChild(el('span', { className: 'detail-tag', text: tag })));
            dd.appendChild(wrap);
          }
          break;

        case 'notes':
        default:
          if (!def.value || def.value.trim() === '') {
            dd.appendChild(el('span', { className: 'detail-empty', text: '—' }));
          } else {
            dd.appendChild(el('span', { className: 'detail-notes', text: def.value }));
          }
          break;
      }

      div.appendChild(dt);
      div.appendChild(dd);
      fieldsEl.appendChild(div);
    }

    // Open panel
    $('detail-panel').classList.add('is-open');
    $('detail-panel').setAttribute('aria-hidden', 'false');
    $('detail-overlay').classList.add('is-open');
    $('detail-overlay').setAttribute('aria-hidden', 'false');
    _panelOpen = true;

    // Accessibility: move focus to close button
    setTimeout(() => $('detail-close').focus(), 30);
  }

  function closeDetail() {
    $('detail-panel').classList.remove('is-open');
    $('detail-panel').setAttribute('aria-hidden', 'true');
    $('detail-overlay').classList.remove('is-open');
    $('detail-overlay').setAttribute('aria-hidden', 'true');
    _panelOpen = false;

    document.querySelectorAll('.term-chip.selected')
      .forEach(c => c.classList.remove('selected'));
  }

  // ── Search ────────────────────────────────────────────────────
  function setupSearch() {
    const input   = $('search-input');
    const clearBt = $('clear-btn');

    input.addEventListener('input', () => {
      const q = input.value;
      clearBt.hidden = (q.length === 0);
      filterTerms(q);
    });

    clearBt.addEventListener('click', () => {
      input.value = '';
      clearBt.hidden = true;
      filterTerms('');
      input.focus();
    });
  }

  function filterTerms(rawQuery) {
    const q      = rawQuery.trim().toLowerCase();
    const status = $('search-status');

    if (!q) {
      // Restore any cards that were expanded during search
      document.querySelectorAll('.category-card[data-search-expanded]').forEach(card => {
        card.classList.add('collapsed');
        card.removeAttribute('data-search-expanded');
      });

      document.querySelectorAll('.term-chip')
        .forEach(chip => chip.classList.remove('search-match', 'search-no-match'));

      document.querySelectorAll('.category-card')
        .forEach(card => card.classList.remove('category-all-hidden'));

      status.hidden = true;
      return;
    }

    // Expand collapsed cards so matches are visible, remembering original state
    document.querySelectorAll('.category-card.collapsed').forEach(card => {
      card.setAttribute('data-search-expanded', '1');
      card.classList.remove('collapsed');
    });

    // Classify each chip
    let matchCount = 0;
    document.querySelectorAll('.term-chip').forEach(chip => {
      const nameMatch  = chip.dataset.nameLower.includes(q);
      const idMatch    = chip.dataset.id.toLowerCase().includes(q);
      const aliasMatch = chip.dataset.aliasesLower.includes(q);
      const matched    = nameMatch || idMatch || aliasMatch;

      chip.classList.toggle('search-match',    matched);
      chip.classList.toggle('search-no-match', !matched);

      if (matched) matchCount++;
    });

    // Dim cards that have no matches at all
    document.querySelectorAll('.category-card').forEach(card => {
      const hasMatch = card.querySelector('.term-chip.search-match');
      card.classList.toggle('category-all-hidden', !hasMatch);
    });

    status.textContent = `${matchCount} term${matchCount !== 1 ? 's' : ''} matched`;
    status.hidden = false;
  }

  // ── About section ─────────────────────────────────────────────
  function renderAbout() {
    if (!_rules) return;

    const container = $('about-content');
    container.innerHTML = '';

    // Classification rules column
    if (_rules.classification_rules?.length > 0) {
      const col = el('div', { className: 'about-column' });
      col.appendChild(el('h3', { className: 'about-col-title', text: 'Classification Rules' }));

      const ol = el('ol', { className: 'about-rules-list' });
      for (const rule of _rules.classification_rules) {
        ol.appendChild(el('li', { text: rule }));
      }
      col.appendChild(ol);
      container.appendChild(col);
    }

    // Continents column
    if (_rules.continents) {
      const col = el('div', { className: 'about-column' });
      col.appendChild(el('h3', { className: 'about-col-title', text: 'Continents' }));

      const dl = el('dl', { className: 'about-continents-list' });
      for (const [name, info] of Object.entries(_rules.continents)) {
        dl.appendChild(el('dt', { text: name }));
        dl.appendChild(el('dd', { text: info.question }));
      }
      col.appendChild(dl);
      container.appendChild(col);
    }
  }

  // ── Global event wiring ───────────────────────────────────────
  function setupEvents() {
    $('detail-close').addEventListener('click', closeDetail);
    $('detail-overlay').addEventListener('click', closeDetail);

    document.addEventListener('keydown', (e) => {
      if (e.key === 'Escape' && _panelOpen) closeDetail();
    });
  }

  // ── Bootstrap ─────────────────────────────────────────────────
  async function init() {
    setupEvents();
    try {
      await loadData();
      renderTaxonomy();
      renderAbout();
      setupSearch();
    } catch (err) {
      showLoadError(err.message);
    }
  }

  document.addEventListener('DOMContentLoaded', init);
}());
