---
title: CLI workflows
component: verilib-cli
repo: https://github.com/Beneficial-AI-Foundation/verilib-cli
status: active
last_reviewed: 2026-07-22
---

# Workflows

## User workflow (interactive)

```bash
git clone git@github.com:Beneficial-AI-Foundation/dalek-lite.git
cd dalek-lite
git checkout -b sl/structure

verilib-cli create
verilib-cli atomize --update-stubs
verilib-cli specify
verilib-cli verify
```

- **create** — discover exec functions with Verus specs; write `.md` stubs
- **atomize** — SCIP atoms → `stubs.json`; optional stub file updates
- **specify** — certify specs interactively
- **verify** — run Verus; update proof statuses

Combine with [repo commands](repo-commands.md) (`auth` / `init` / `deploy` / `pull`) to sync with the platform.

## CI workflow (non-interactive)

Uses `--check-only` so CI fails without rewriting files:

```bash
verilib-cli atomize --check-only
verilib-cli specify --check-only
verilib-cli verify --check-only
```

Enable auto-validation in `.verilib/config.json` when specs should be certified without prompts:

```json
{
  "auto-validate-specs": true
}
```

## Server workflow (`--no-probe`)

When probe-verus already ran in job queues / Docker (for example server-side [Atomizer](../../components/processor/atomizer.md) or cert workers), validate against pre-generated JSON:

```text
probe-verus atomize ... -o .verilib/atoms.json
probe-verus specify ... -o .verilib/specs.json
probe-verus verify  ... -o .verilib/proofs.json
```

```bash
verilib-cli atomize --no-probe --check-only
verilib-cli specify --no-probe --check-only
verilib-cli verify  --no-probe --check-only
```

## Related

- [Structure commands](structure-commands.md)
- [Config and files](config-and-files.md)
- [Certificates](../../components/cert/cert-queue.md)
