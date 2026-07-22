---
title: CLI structure commands
component: verilib-cli
repo: https://github.com/Beneficial-AI-Foundation/verilib-cli
status: active
last_reviewed: 2026-07-22
---

# Structure commands

Manage verification structure files. These integrate with [probe-verus](https://github.com/Beneficial-AI-Foundation/probe-verus) for static analysis (Docker mode recommended; see [Config and files](config-and-files.md)).

## Prerequisites (local mode)

If you are not using Docker execution mode:

1. Install Verus, Verus Analyzer, and SCIP via [installers_for_various_tools](https://github.com/Beneficial-AI-Foundation/installers_for_various_tools).
2. Install probe-verus: `cargo install --path .` from the [probe-verus](https://github.com/Beneficial-AI-Foundation/probe-verus) repo.

## `create`

Initialize structure files from source analysis. Uses `probe-verus tracked-csv` to discover exec functions with Verus specs and generate `.md` stubs under `.verilib/structure` by default.

```bash
verilib-cli create
verilib-cli create --root custom/path
```

| Option | Description |
| --- | --- |
| `--root <path>` | Custom structure root (default: `.verilib/structure`) |

## `atomize`

Enrich structure files with SCIP atom metadata.

```bash
verilib-cli atomize
verilib-cli atomize -s
verilib-cli atomize --atoms-only
```

| Option | Description |
| --- | --- |
| `-s, --update-stubs` | Update `.md` files with `code-name` (and related fields) |
| `-n, --no-probe` | Skip probe-verus; read existing `atoms.json` |
| `-c, --check-only` | Check stubs match enriched `stubs.json` without writing |
| `--atoms-only` | Only generate `atoms.json` (no stubs / `create` needed) |
| `--rust-analyzer` | Use rust-analyzer instead of verus-analyzer for SCIP |

**Auto-detection:** If there is no `.verilib/config.json` and `Cargo.toml` has no Verus dependencies (`vstd`, `verus_builtin`, `verus_builtin_macros`, or `[package.metadata.verus]`), atoms-only mode is enabled automatically so pure Rust projects can run `atomize` without `create`.

## `specify`

Check specification status and manage spec certificates.

```bash
verilib-cli specify
```

1. Runs `probe-verus specify`
2. Interactive menu for uncertified functions (unless auto-validate is on)
3. Creates cert files for selected functions
4. Updates `specified` status in stubs

| Option | Description |
| --- | --- |
| `-n, --no-probe` | Read existing `specs.json` |
| `-c, --check-only` | Fail if any stub with specs is missing a cert |

For CI, set `"auto-validate-specs": true` in `.verilib/config.json` to generate certificates without prompts.

## `verify`

Run verification and update stubs with proof status.

```bash
verilib-cli verify
verilib-cli verify --verify-only-module my_module
```

| Option | Description |
| --- | --- |
| `--verify-only-module <name>` | Limit verification to one module |
| `-n, --no-probe` | Read existing `proofs.json` |
| `-c, --check-only` | Fail if any stub has status `failure` |

## API helpers (scripting)

| Command | Description |
| --- | --- |
| `verilib-cli api get --file name` | Get file metadata |
| `verilib-cli api list [--filter status]` | List files |
| `verilib-cli api set --file name --specified true` | Set metadata |
| `verilib-cli api batch --input updates.json` | Batch update |
| `verilib-cli api create-file --path ...` | Create a file from string, file, or stdin |

## Related

- [Workflows](workflows.md)
- [Atomizer](../../components/processor/atomizer.md) — server-side atomization
- [Glossary](../../project/glossary.md) — verification / specification statuses
