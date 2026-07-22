---
title: Scripts and CLI
component: verilib-cli
repo: https://github.com/Beneficial-AI-Foundation/verilib-cli
status: active
last_reviewed: 2026-07-22
---

# Scripts and CLI

[verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli) is the Rust CLI for managing VeriLib repositories, local `.verilib/` structure files, and API interactions. It is the main contributor-facing tool: authenticate, init/deploy/pull, then run create → atomize → specify → verify (via [probe-verus](https://github.com/Beneficial-AI-Foundation/probe-verus) in Docker or locally).

| | |
| --- | --- |
| **Repo** | [Beneficial-AI-Foundation/verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli) |
| **License** | MIT |
| **Language** | Rust |

## How it fits the platform

- Talks to the **VeriLib API** (same backend as [verilib.org](https://verilib.org) / [verilib-frontend](../components/ux-api/frontend.md)) for auth, repo metadata, deploy, pull, and reclone.
- Runs **probe-verus** locally (or in Docker) for structure and verification commands — separate from the server-side [Atomizer](../components/processor/atomizer.md) workers.
- Spec certificates created with `specify` relate to the [Certificates](../components/cert/cert-queue.md) subsystem when work is certified on the platform.

## Documentation in this hub

| Page | Contents |
| --- | --- |
| [Install](cli/install.md) | Installers, package managers, binary matrix, build from source |
| [Repo commands](cli/repo-commands.md) | auth, status, init, deploy, pull, reclone |
| [Structure commands](cli/structure-commands.md) | create, atomize, specify, verify + probe options |
| [Workflows](cli/workflows.md) | Interactive user, CI `--check-only`, server `--no-probe` |
| [Config and files](cli/config-and-files.md) | `.verilib/`, keyring, Docker vs local mode |
| [Quick start](../getting-started/quick-start.md) | Short path to first successful init |

## Features

- Secure authentication (system keyring / file storage)
- Repository management (init, deploy, pull, reclone)
- Verification structure with probe-verus integration
- Cross-platform: macOS, Linux, Windows

## Global options

| Option | Description |
| --- | --- |
| `--debug` | Enable debug output |
| `--json` | JSON output (API commands) |
| `--dry-run` | Preview changes without applying (API commands) |

## Source of truth

Full command details and troubleshooting: **[verilib-cli README](https://github.com/Beneficial-AI-Foundation/verilib-cli/blob/master/README.md)**
