---
title: Languages and plugins
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# Languages and plugins

Built-in parsers under `plugins/` (registered in `PluginRegistry`):

| Language | Probe tool | Extract command | JSON under repo | Extensions |
| --- | --- | --- | --- | --- |
| Rust / Verus | `probe-verus` | `extract` | `.verilib/probes/verus_*.json` | `.rs` |
| Lean | `probe-lean` | `extract` | `.verilib/probes/lean_*.json` | `.lean` |
| Aeneas | `probe-aeneas` | `extract` | `.verilib/probes/aeneas_*.json` | `.rs`, `.lean` |

Enable languages with `ATOMIZER_LANGUAGES` (default `Rust,Lean,Aeneas`).

## Design

- **`parsers/`** — schema only (`Atom`, `CodeLocation`, `ParsedAtoms`); Schema 2.0 only.
- **`plugins/`** — language-specific JSON → `ParsedAtoms`.
- **Shared persistence** — all languages write the same atom / dependency tables.

Lookup:

```python
from plugins import get_parser_for_language, get_parser_for_file
get_parser_for_language("Rust")   # VerusParser
get_parser_for_file("Foo.lean")   # LeanParser
```

## Adding a language

Upstream README “Adding a Language Plugin”: implement `LanguageParser`, register in `plugins/registry.py`, wire probe binary in `config.py`, add to `ATOMIZER_LANGUAGES`. Persistence and retry logic stay shared.

## Probe sources (science team)

Link only — not first-class hub sections:

- [probe Schema 2.0](https://github.com/Beneficial-AI-Foundation/probe/blob/main/docs/SCHEMA.md)
- [probe-verus](https://github.com/Beneficial-AI-Foundation/probe-verus), [probe-lean](https://github.com/Beneficial-AI-Foundation/probe-lean), [probe-aeneas](https://github.com/Beneficial-AI-Foundation/probe-aeneas)

## Related

- [JSON mapping](json-mapping.md)
- [Probe upgrading](probe-upgrading.md)
