---
title: CLI config and files
component: verilib-cli
repo: https://github.com/Beneficial-AI-Foundation/verilib-cli
status: active
last_reviewed: 2026-07-22
---

# Config and files

## Execution modes

Verification commands (`atomize`, `specify`, `verify`) support:

1. **Docker (recommended)** — runs probe-verus in a container with dependencies preinstalled. Requires Docker running.
2. **Local** — runs probe-verus on the host (must install Verus, analyzers, probe-verus yourself).

Chosen during `verilib-cli init`; change later in `.verilib/config.json`. For local mode issues, see [probe-verus](https://github.com/Beneficial-AI-Foundation/probe-verus).

## API key storage

| Platform | Storage |
| --- | --- |
| macOS | Keychain |
| Linux | `~/.verilib/credentials.json` (file) |
| Windows | Windows Credential Manager |

Override:

```bash
export VERILIB_STORAGE=file      # force file storage
export VERILIB_STORAGE=keyring   # use system keyring
```

Do not commit credentials files.

## Local project files

| Path | Description |
| --- | --- |
| `.verilib/config.json` | Repository + structure configuration; execution mode; `auto-validate-specs` |
| `.verilib/structure/` | Structure `.md` files (YAML frontmatter) |
| `.verilib/stubs.json` | Enriched stub data |
| `.verilib/atoms.json` | Atom metadata from probe-verus |
| `.verilib/specs.json` | Spec info (when produced by probe / `--no-probe` flows) |
| `.verilib/proofs.json` | Proof results (server / `--no-probe` flows) |
| `.verilib/certs/specs/` | Specification certificates |
| `.verilib/*.atom.verilib` | Code files |
| `.verilib/*.meta.verilib` | Metadata for code files |

## Troubleshooting (summary)

- **macOS quarantine:** use the installer script, or `xattr -d com.apple.quarantine /path/to/verilib-cli`
- **Auth:** `verilib-cli status` then `verilib-cli auth`
- **Keyring failures:** `export VERILIB_STORAGE=file` then re-auth
- **Debug:** `verilib-cli --debug init` / `deploy`

## Related

- [Install](install.md)
- [Repo commands](repo-commands.md)
- [Upstream README](https://github.com/Beneficial-AI-Foundation/verilib-cli/blob/master/README.md)
