---
title: Scripts and CLI
status: active
last_reviewed: 2026-07-22
---

# Scripts and CLI

[verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli) is the command-line tool for managing VeriLib repositories, verification structure files, and API interactions.

| | |
| --- | --- |
| **Repo** | [Beneficial-AI-Foundation/verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli) |
| **License** | MIT |

## Features

- **Secure authentication** — API keys stored in system keyring
- **Repository management** — init, deploy, pull, reclone
- **Verification structure** — create, atomize, specify, verify (probe-verus integration)
- **Cross-platform** — macOS, Linux, Windows

## Installation

```bash
# Linux & macOS
curl -sSL https://github.com/Beneficial-AI-Foundation/verilib-cli/releases/latest/download/verilib-cli-installer.sh | sh

# Homebrew
brew tap Beneficial-AI-Foundation/verilib-cli
brew install verilib-cli

# npm
npm install -g verilib-cli
```

## Execution modes

Verification commands (`atomize`, `specify`, `verify`) support:

1. **Docker (recommended)** — runs probe-verus in a container
2. **Local** — requires probe-verus installed on the host

Set during `verilib-cli init` or in `.verilib/config.json`.

## Repository commands

| Command | Description |
| --- | --- |
| `verilib-cli auth` | Authenticate with the VeriLib API |
| `verilib-cli status` | Show authentication status |
| `verilib-cli init [--id <id>]` | Initialize or create a repository |
| `verilib-cli deploy` | Deploy changes to the server |
| `verilib-cli pull` | Pull latest structure from server |
| `verilib-cli reclone` | Trigger server reclone |

## Structure commands

| Command | Description |
| --- | --- |
| `verilib-cli create [--root path]` | Initialize structure files from probe-verus |
| `verilib-cli atomize [-s] [--atoms-only] [--check-only]` | Enrich stubs with atom metadata |
| `verilib-cli specify [--check-only]` | Manage specification certificates |
| `verilib-cli verify [--verify-only-module name] [--check-only]` | Run verification, update proof status |

## API commands

| Command | Description |
| --- | --- |
| `verilib-cli api get --file name` | Get file metadata |
| `verilib-cli api list [--filter status]` | List files |
| `verilib-cli api set --file name --specified true` | Set metadata |
| `verilib-cli api batch --input updates.json` | Batch update from JSON |
| `verilib-cli api create-file --path ...` | Create a new file |

## Global options

| Option | Description |
| --- | --- |
| `--debug` | Enable debug output |
| `--json` | JSON output (API commands) |
| `--dry-run` | Preview changes without applying |

## Local files

| Path | Description |
| --- | --- |
| `.verilib/config.json` | Repository configuration |
| `.verilib/structure/` | Structure files (.md with YAML frontmatter) |
| `.verilib/stubs.json` | Enriched stub data |
| `.verilib/atoms.json` | Atom metadata from probe-verus |
| `.verilib/certs/specs/` | Specification certificates |

## CI workflow example

```bash
verilib-cli atomize --check-only
verilib-cli specify --check-only
verilib-cli verify --check-only
```

## Full documentation

Command options, troubleshooting, and development setup:

**[verilib-cli README](https://github.com/Beneficial-AI-Foundation/verilib-cli/blob/master/README.md)**

## Related

- [Quick start](../getting-started/quick-start.md)
- [Atomizer](../components/processor/atomizer.md)
- [Cert Queue](../components/cert/cert-queue.md)
