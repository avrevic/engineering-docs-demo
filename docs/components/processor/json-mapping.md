---
title: JSON Mapping
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# JSON mapping

All probes emit a **Schema 2.0** envelope. Canonical field docs: [probe SCHEMA.md](https://github.com/Beneficial-AI-Foundation/probe/blob/main/docs/SCHEMA.md).

## Envelope

| Field | Role |
| --- | --- |
| `schema` | e.g. `probe-verus/extract` |
| `schema-version` | `"2.0"` |
| `tool` | name / version / command |
| `source` | repo, commit, language, package (probe-aeneas uses `inputs` instead) |
| `timestamp` | ISO-8601 |
| `data` | Map of probe-id → atom object |

Atomize plugins read `data` into `ParsedAtoms` / `Atom` instances, then persistence writes MySQL `atoms`, `atomsdependencies`, snippets, and verification fields.

## Atom fields (summary)

Required in probe JSON: `display-name`, `dependencies`, `code-module`, `code-path`, `code-text` (`lines-start` / `lines-end`), `kind`, `language`.  
Optional: `verification-status`, `primary-spec`, `is-disabled`, Lean `specs` / `specified`.

Kinds differ by language (Verus `exec`/`spec`/`proof`; Lean `def`/`theorem`/…). Aeneas merges Rust + Lean atoms with cross-language edges (`linetype` dashed vs full in DB).

## Output paths

Probe JSON is expected under the cloned repo at `.verilib/probes/<lang>_*.json` (see [languages and plugins](languages-and-plugins.md)).

## Related

- [Atomizer](atomizer.md)
- Upstream README “JSON Format (Schema 2.0)”
