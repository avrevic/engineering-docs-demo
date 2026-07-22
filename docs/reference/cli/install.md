---
title: Install verilib-cli
component: verilib-cli
repo: https://github.com/Beneficial-AI-Foundation/verilib-cli
status: active
last_reviewed: 2026-07-22
---

# Install verilib-cli

## One-line installers (recommended)

=== "Linux & macOS"

    ```bash
    curl -sSL https://github.com/Beneficial-AI-Foundation/verilib-cli/releases/latest/download/verilib-cli-installer.sh | sh
    ```

=== "Windows (PowerShell)"

    ```powershell
    irm https://github.com/Beneficial-AI-Foundation/verilib-cli/releases/latest/download/verilib-cli-installer.ps1 | iex
    ```

=== "npm"

    ```bash
    npm install -g verilib-cli
    ```

## Package managers

**Homebrew (macOS):**

```bash
brew tap Beneficial-AI-Foundation/verilib-cli
brew install verilib-cli
```

**Windows MSI:** download the latest `.msi` from the [releases page](https://github.com/Beneficial-AI-Foundation/verilib-cli/releases/latest).

## Manual binaries

| Platform | File |
| --- | --- |
| macOS (Apple Silicon) | `verilib-cli-aarch64-apple-darwin.tar.xz` |
| macOS (Intel) | `verilib-cli-x86_64-apple-darwin.tar.xz` |
| Linux (x86_64) | `verilib-cli-x86_64-unknown-linux-gnu.tar.xz` |
| Linux (ARM64) | `verilib-cli-aarch64-unknown-linux-gnu.tar.xz` |
| Windows | `verilib-cli-x86_64-pc-windows-msvc.zip` |

Extract and place the binary on your `PATH`.

## Build from source

```bash
git clone https://github.com/Beneficial-AI-Foundation/verilib-cli.git
cd verilib-cli
cargo build --release
cargo test
cargo install --path .
```

**Requirements:** Rust 1.70+ (2021 edition), Git, optional platform keyring support.

## Related

- [Quick start](../../getting-started/quick-start.md)
- [Config and files](config-and-files.md)
- [CLI index](../scripts-and-cli.md)
