# WARFRAME Wiki Module Data

> Automated read-only mirror of [WARFRAME Wiki](https://wiki.warframe.com) Scribunto Lua modules, converted to JSON.

[![License: CC BY-NC-SA 3.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%203.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/3.0/)
[![Scripts Repo](https://img.shields.io/badge/Converter-Scripts-blue)](https://github.com/420gaming420/wf-wiki-module-scripts)

## ⚠️ Read-Only Mirror

**This repository is a read-only mirror.** All data originates from community-contributed Lua modules on the wiki.

To modify any data, edit the source module pages directly on the WARFRAME Wiki:
- **Example**: <https://wiki.warframe.com/w/Module:Ability/data>

Changes made on the wiki will be automatically picked up by the converter scripts on the next sync run (typically within 24 hours).

## What's Inside

Each module page from the WARFRAME Wiki is converted into a standalone JSON file with:

- **Structured data** — Lua tables parsed into native JSON
- **Source attribution** — `__attribution` key with source URL, license, and conversion timestamp
- **Source comments** — `__comments` key containing the original Lua source code comments
- **Metadata** — Corresponding `.meta.json` file with wiki page revision timestamp and conversion details

### File Naming

| Wiki Module | JSON File |
|---|---|
| `Module:Warframes/data` | `Module-Warframes-data.json` |
| `Module:Weapons/data` | `Module-Weapons-data.json` |
| `Module:Mods/data` | `Module-Mods-data.json` |

### Example JSON Structure

```json
{
  "__attribution": {
    "source_url": "https://wiki.warframe.com/w/Module:Ability/data",
    "license": "CC BY-NC-SA 3.0",
    "license_url": "https://creativecommons.org/licenses/by-nc-sa/3.0/",
    "converter_repo": "https://github.com/420gaming420/wf-wiki-module-scripts",
    "converted_at": "2026-08-29T15:12:00.785Z"
  },
  "__comments": "-- CTRL + F \"Warframe Name\" to immediately go to...\n-- Note that [\"Warframe\"] subtable indexes ability...",
  "Archived": {
    "Accelerant": {
      "Description": "Stun nearby enemies...",
      "Cost": 50,
      "Name": "Accelerant",
      ...
    }
  }
}
```

## Statistics

| Metric | Count |
|---|---|
| Total JSON files | 177 |
| Meta files | 177 |
| Ignored/skipped modules | 337 |

## Repository Structure

```
wf-wiki-module-data/
├── json/                          # Converted JSON data
│   ├── Module-Ability-data.json   # Main data file
│   ├── Module-Ability-data.meta.json  # Conversion metadata
│   ├── Module-Warframes-data.json
│   ├── Module-Weapons-data.json
│   └── ... (354 files total)
├── LICENSE                        # CC BY-NC-SA 3.0
├── ATTRIBUTION.md                 # Attribution guidelines
└── README.md
```

## Usage

### Direct File Access

```
https://raw.githubusercontent.com/420gaming420/wf-wiki-module-data/main/json/Module-Ability-data.json
```

### Git Submodule

```bash
git submodule add https://github.com/420gaming420/wf-wiki-module-data data
git submodule update --init --recursive
```

## Sync Pipeline (TBA - Currently Manually Updated)
Data will be synced automatically by the [wf-wiki-module-scripts](https://github.com/420gaming420/wf-wiki-module-scripts) repository:

1. **`request.py`** — Queries the WARFRAME Wiki API for module timestamps
2. **`convert_module.js`** — Uses Puppeteer to execute each stale module via the Scribunto Debug Console and extracts the JSON result
3. **`attribution.py`** — Adds `__attribution` and `__comments` keys, fetching source comments from live wiki pages
4. **`workflow.sh`** — Orchestrates the full pipeline with rate limiting and error handling

See the [scripts repository](https://github.com/420gaming420/wf-wiki-module-scripts) for full documentation.

## License

| Component | License |
|---|---|
| **Data** (JSON files) | [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/) — same as the WARFRAME Wiki |
| **Scripts** (converter tools) | [MIT](https://opensource.org/licenses/MIT) — see [wf-wiki-module-scripts](https://github.com/420gaming420/wf-wiki-module-scripts) |

This github repo is not affiliated with Digital Extremes or Warframe or the WARFRAME Wiki.

```
Warframe, the Warframe logo, and Evolution Engine are registered trademarks of Digital Extremes Ltd.

All user-contributed code on articles in the Module and MediaWiki namespaces are licensed under Creative Commons Attribution–Share Alike License (CC BY-SA) unless otherwise specified. See https://weirdgloop.org/terms/ for full legal details.
https://creativecommons.org/licenses/by-nc/3.0/ - CC BY-SA summary
https://creativecommons.org/licenses/by-nc/3.0/legalcode - full CC BY-SA legal code

Some third-party forks use different licenses that are compatible with CC BY-SA. See the respective Module page's documentation for more details.

All trademarks are the property of their respective owners.
```

See [https://wiki.warframe.com/w/WARFRAME_Wiki:Licensing](https://wiki.warframe.com/w/WARFRAME_Wiki:Licensing) for details.
