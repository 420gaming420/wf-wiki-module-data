# WARFRAME Wiki Module Data

> Automated read-only mirror of [WARFRAME Wiki](https://wiki.warframe.com) Scribunto Lua modules, converted to JSON.

[![License: CC BY-NC-SA 3.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%203.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/3.0/)
[![Scripts Repo](https://img.shields.io/badge/Converter-Scripts-blue)](https://github.com/420gaming420/wf-wiki-module-scripts)

## ⚠️ Read-Only Mirror

**This repository is a read-only mirror.** All data originates from community-contributed Lua modules on the wiki.

To modify any data, edit the source module pages directly on the WARFRAME Wiki:
- **Example**: <https://wiki.warframe.com/w/Module:Ability/data>

Changes made on the wiki will be automatically picked up by the converter scripts on the next sync run (typically within 24 hours).

---

## Branches

| Branch | Sync | Review | Best for |
|---|---|---|---|
| **`dev`** | Automatic (daily at 2AM UTC) | None — every commit is auto-merged | Latest data, development, testing |
| **`stable`** | Manual (reviewed PRs from `dev`) | Reviewed before merge | Production use, stable reference |

> **Tip**: `dev` receives automatic sync pull requests each day containing updated data files. `stable` contains the same data but only after manual review. Use whichever branch matches your needs.

---

## What's Inside

Each module page from the WARFRAME Wiki is converted into a standalone JSON file with:

- **Structured data** — Lua tables parsed into native JSON
- **Source attribution** — `_attribution` key with source URL, license, and conversion timestamp
- **Source comments** — `_comments` key containing the original Lua source code comments
- **Metadata** — Corresponding `.meta.json` file with wiki page revision timestamp and conversion details
- **Custom additions** — `custom/` folder for manually curated or derived data

### File Naming

| Wiki Module | JSON File |
|---|---|
| `Module:Warframes/data` | `Module-Warframes-data.json` |
| `Module:Weapons/data/melee` | `Module-Weapons-data-melee.json` |
| `Module:Mods/data` | `Module-Mods-data.json` |

### Example JSON Structure

```json
{
  "_attribution": {
    "source_url": "https://wiki.warframe.com/w/Module:Ability/data",
    "license": "CC BY-NC-SA 3.0",
    "license_url": "https://creativecommons.org/licenses/by-nc-sa/3.0/",
    "converter_repo": "https://github.com/420gaming420/wf-wiki-module-scripts",
    "converted_at": "2026-08-30T18:53:14.122Z"
  },
  "_comments": "-- CTRL + F \"Warframe Name\" to immediately go to...\n-- Note that [\"Warframe\"] subtable indexes ability...",
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
| HTML archive files | ~600+ |
| Lua source files | ~950+ |
| Markdown documentation files | ~600+ |
| Total JSON files | ~180+ |
| Meta files | ~1 per module per format |
| Ignored/skipped modules | ~300+ |
| Total wiki modules tracked | ~500+ |

> **Note:** All counts are approximate and change with each sync run. The ignored modules include `/doc` subpages, modules with unjsonifiable types (functions), and others that fail conversion. Failed conversions are automatically added to `ignore_modules.json` which is pushed to the [scripts repository](https://github.com/420gaming420/wf-wiki-module-scripts) so that they can be skipped on subsequent runs.

> **Note:** Total file count across all formats is ~1k+ files.

## Repository Structure

```
wf-wiki-module-data/
├── json/                          # Converted JSON data (main data files)
│   ├── Module-Ability-data.json   # Main data file
│   ├── Module-Ability-data.meta.json  # Conversion metadata
│   ├── Module-Warframes-data.json
│   ├── Module-Weapons-data.json
│   └── ... (~180+ files)
├── custom/                        # Manually curated or derived data
├── html/                          # HTML archive of wiki module pages
│   ├── Module-Ability-data.html   # Raw wiki HTML
│   ├── Module-Ability-data.meta.json  # Download metadata
│   ├── Module-Warframes-data.html
│   └── ... (~600+ files)
├── lua/                           # Extracted Lua source code
│   ├── Module-Ability-data_0.lua  # First code block
│   ├── Module-Ability-data_1.lua  # Second code block (if any)
│   ├── Module-Ability-data.meta.json  # Extraction metadata
│   └── ... (~950+ files)
├── markdown/                      # Markdown documentation
│   ├── Module-Ability-data.md     # Full page documentation
│   ├── Module-Ability-data.meta.json  # Conversion metadata
│   ├── Module-Warframes-data.md
│   └── ... (~600+ files)
├── LICENSE                        # CC BY-NC-SA 3.0
├── ATTRIBUTION.md                 # Attribution guidelines
└── README.md
```

---

## Usage

### Raw URL Access (no Git required)

The simplest way to access the files without git is via the raw GitHub URL. Replace `<BRANCH>` with `dev` or `stable`:

```
https://raw.githubusercontent.com/420gaming420/wf-wiki-module-data/<BRANCH>/json/Module-Ability-data.json
```

### Python: Fetching from Raw URL

```python
import json
import urllib.request

def load_wiki_data(module_name: str, branch: str = "stable") -> dict:
    """Load a wiki module's JSON data directly from GitHub."""
    url = (
        f"https://raw.githubusercontent.com/420gaming420/"
        f"wf-wiki-module-data/{branch}/json/{module_name}.json"
    )
    with urllib.request.urlopen(url) as response:
        return json.loads(response.read().decode())

# Example: load the Ability module data
data = load_wiki_data("Module-Ability-data", branch="stable")
print(data["_attribution"]["source_url"])
```

### Python: Using a Local Clone (submodule or git clone)

If you have the repo cloned locally (see below), load files directly from disk:

```python
import json
from pathlib import Path

def load_local_wiki_data(module_name: str, base_path: str = "data/json") -> dict:
    """Load a wiki module's JSON data from a local clone."""
    file_path = Path(base_path) / f"{module_name}.json"
    with open(file_path, "r") as f:
        return json.load(f)

# Example: load the Ability module data from a local clone
data = load_local_wiki_data("Module-Ability-data", base_path="data/json")
print(data["_attribution"]["source_url"])
```

### Git Submodule

Add the repository as a submodule. Replace `<BRANCH>` with `dev` or `stable`:

```bash
# Clone your project and add the submodule
git submodule add -b <BRANCH> https://github.com/420gaming420/wf-wiki-module-data data
git submodule update --init --recursive
```

This will clone the **entire** repository (all branches' history, including `html/`, `lua/`, `markdown/`, and `json/` folders).

#### JSON-Only (Lazy Download)

If you only need the `json/` and `custom/` data files, clone with blob filtering to get only metadata initially:

```bash
# Clone with metadata only (no file contents downloaded)
git clone --filter=blob:none --depth 1 -b <BRANCH> https://github.com/420gaming420/wf-wiki-module-data data

# Enter the cloned directory
cd data

# Download only the folders you need
git sparse-checkout set json custom
```

When you run `sparse-checkout set`, Git downloads only the blobs for `json/` and `custom/`, skipping `html/`, `lua/`, and `markdown/` entirely.

---

## Sync Pipeline

Data is synced automatically via a GitHub Action triggered by `sync.yml` on the **`dev`** branch. The action runs daily at 2AM UTC.

To update the **`stable`** branch, a maintainer reviews the auto-generated PR on `dev`, then manually merges the reviewed changes into `stable` via a separate pull request.

The full pipeline (documented in the [scripts repository](https://github.com/420gaming420/wf-wiki-module-scripts)) performs these steps:

1. **`request.py`** — Queries the WARFRAME Wiki API for module timestamps
2. **`download.py`** — Archives all wiki modules as HTML files to `data/html/`
3. **`extract_lua.py`** — Extracts Lua source code from HTML to `data/lua/`
4. **`extract_text.py`** — Converts HTML pages to Markdown documentation in `data/markdown/`
5. **`convert_module.js`** — Uses Puppeteer to execute each stale module via the Scribunto Debug Console and extracts the JSON result
6. **`attribution.py`** — Adds `_attribution` and `_comments` keys, reading source comments from local Lua files

Failed modules are automatically pushed to `ignore_modules.json` in the scripts repo and skipped on subsequent runs. See the [scripts repository](https://github.com/420gaming420/wf-wiki-module-scripts) for more details.

---

## License

| Component | License |
|---|---|
| **Data** (HTML/LUA/MARKDOWN/JSON files) | [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/) — same as the WARFRAME Wiki |
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
