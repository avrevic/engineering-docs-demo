---
title: CLI repository commands
component: verilib-cli
repo: https://github.com/Beneficial-AI-Foundation/verilib-cli
status: active
last_reviewed: 2026-07-22
---

# Repository commands

These commands talk to the VeriLib API. Authenticate first; credentials are stored in the system keyring (or file storage — see [Config and files](config-and-files.md)).

## `auth`

Authenticate with the VeriLib API.

```bash
verilib-cli auth
```

## `status`

Show current authentication status.

```bash
verilib-cli status
```

## `init`

Initialize from an existing repository ID or create a new repository from the current git URL.

```bash
verilib-cli init --id <repository-id>
verilib-cli init
```

| Option | Description |
| --- | --- |
| `--id <id>` | Initialize from existing repository ID |
| `--url <url>` | Custom API base URL |

When creating (no `--id`), the CLI:

1. Auto-detects the git URL from the current directory
2. Prompts for repository URL (supports branches and subfolders)
3. Collects metadata (language, proof language, summary)
4. Creates the repository and saves the ID locally
5. Prompts for **Docker** or **Local** probe execution mode

## `deploy`

Push local repository / structure changes to the server.

```bash
verilib-cli deploy
```

| Option | Description |
| --- | --- |
| `--url <url>` | Custom API base URL |

## `pull`

Pull the latest repository structure from the server.

```bash
verilib-cli pull
```

## `reclone`

Trigger a server-side reclone (with safety checks for uncommitted local changes).

```bash
verilib-cli reclone
```

## Typical sequence

```bash
verilib-cli auth
verilib-cli init --id <repo-id>   # or init without --id
verilib-cli pull
# ... edit structure / code ...
verilib-cli deploy
```

## Related

- [Structure commands](structure-commands.md)
- [Workflows](workflows.md)
- [Frontend](../../components/ux-api/frontend.md) — web UI for the same API
