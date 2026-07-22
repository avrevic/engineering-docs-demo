---
title: Quick start
status: active
last_reviewed: 2026-07-22
---

# Quick start

Get started with VeriLib in a few minutes using [verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli).

## Prerequisites

- Git
- Docker (recommended for verification commands) or local probe-verus setup
- A VeriLib account and API key from [verilib.org](https://verilib.org)

## 1. Install the CLI

=== "Linux & macOS"

    ```bash
    curl -sSL https://github.com/Beneficial-AI-Foundation/verilib-cli/releases/latest/download/verilib-cli-installer.sh | sh
    ```

=== "Homebrew (macOS)"

    ```bash
    brew tap Beneficial-AI-Foundation/verilib-cli
    brew install verilib-cli
    ```

=== "npm (cross-platform)"

    ```bash
    npm install -g verilib-cli
    ```

See the full [Scripts and CLI](../reference/scripts-and-cli.md) page for other install options.

## 2. Authenticate

```bash
verilib-cli auth
verilib-cli status
```

Your API key is stored in the system keyring (or `~/.verilib/credentials.json` on Linux with file storage).

## 3. Initialize a repository

From an existing VeriLib repository ID:

```bash
verilib-cli init --id <repository-id>
```

Or create a new repository (auto-detects git URL from the current directory):

```bash
verilib-cli init
```

## 4. Verification workflow (optional)

If your project uses Verus or probe-verus:

```bash
verilib-cli create
verilib-cli atomize --update-stubs
verilib-cli specify
verilib-cli verify
```

During `init`, choose **Docker** (recommended) or **Local** execution mode for verification commands.

## 5. Sync with the server

```bash
verilib-cli pull      # Pull latest from server
verilib-cli deploy    # Push local changes
```

## Success criteria

- `verilib-cli status` shows you are authenticated
- `.verilib/config.json` exists in your project
- Your repository appears on [verilib.org](https://verilib.org) after deploy

## Next steps

- [Full local stack](full-local-stack.md) — run platform services locally
- [Glossary](../project/glossary.md) — verification statuses and colors
- [Frontend](../components/ux-api/frontend.md) — web UI overview
