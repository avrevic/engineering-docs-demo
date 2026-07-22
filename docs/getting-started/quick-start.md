---
title: Quick start
status: active
last_reviewed: 2026-07-22
---

# Quick start

Get authenticated and connected to VeriLib with [verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli) in a few minutes.

## Prerequisites

- Git
- Docker (recommended for verification commands) **or** a local [probe-verus](https://github.com/Beneficial-AI-Foundation/probe-verus) install
- A VeriLib account / API key from [verilib.org](https://verilib.org)

## 1. Install the CLI

=== "Linux & macOS"

    ```bash
    curl -sSL https://github.com/Beneficial-AI-Foundation/verilib-cli/releases/latest/download/verilib-cli-installer.sh | sh
    ```

=== "Homebrew"

    ```bash
    brew tap Beneficial-AI-Foundation/verilib-cli
    brew install verilib-cli
    ```

=== "npm"

    ```bash
    npm install -g verilib-cli
    ```

See [Install](../reference/cli/install.md) for Windows, MSI, and binary archives.

## 2. Authenticate

```bash
verilib-cli auth
verilib-cli status
```

API keys go in the system keyring (or `~/.verilib/credentials.json` on Linux with file storage). Never commit credentials.

## 3. Initialize a repository

```bash
# Existing VeriLib repository
verilib-cli init --id <repository-id>

# Or create from the current git checkout
verilib-cli init
```

Choose **Docker** (recommended) or **Local** when prompted for probe execution mode.

## 4. Optional — verification structure

```bash
verilib-cli create
verilib-cli atomize --update-stubs
verilib-cli specify
verilib-cli verify
```

## 5. Sync with the server

```bash
verilib-cli pull
verilib-cli deploy
```

## Success criteria

- `verilib-cli status` shows authenticated
- `.verilib/config.json` exists in the project
- After deploy, the repository appears on [verilib.org](https://verilib.org)

## Next steps

- [CLI index](../reference/scripts-and-cli.md)
- [Workflows](../reference/cli/workflows.md) — CI and server patterns
- [Full local stack](full-local-stack.md) — platform services
- [Glossary](../project/glossary.md)
