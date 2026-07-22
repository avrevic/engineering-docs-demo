---
title: Atomizer
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# Atomizer

Server-side processor that atomizes VeriLib repositories — running probe tools, enriching atom metadata, and preparing JSON structure for the platform.

| | |
| --- | --- |
| **Repo** | [Beneficial-AI-Foundation/verilib-atomizer](https://github.com/Beneficial-AI-Foundation/verilib-atomizer) |
| **Owner** | _TBD_ |
| **Status** | active |

## Overview

The atomizer is the core **processor** component. When contributors deploy via [verilib-cli](../../reference/scripts-and-cli.md), the platform queues atomization jobs that:

- Run probe extraction (Verus, Aeneas, etc.)
- Produce `atoms.json`, stubs, and enriched metadata
- Map results into the VeriLib JSON schema

It integrates with science-team probe tools ([probe](https://github.com/Beneficial-AI-Foundation/probe), [probe-verus](https://github.com/Beneficial-AI-Foundation/probe-verus), [probe-aeneas](https://github.com/Beneficial-AI-Foundation/probe-aeneas)) built by the formal verification team.

## Install

Full setup and deployment details live in the repository README:

```bash
git clone https://github.com/Beneficial-AI-Foundation/verilib-atomizer.git
cd verilib-atomizer
# See repo README for install and run instructions
```

## Related processor components

- [Probe upgrading](probe-upgrading.md)
- [ECR on ECS](ecr-on-ecs.md)
- [JSON Mapping](json-mapping.md)
- [Disk Cleanup](disk-cleanup.md)

## Related

- [System map](../../architecture/system-map.md)
- [verilib-cli](../../reference/scripts-and-cli.md) — local `atomize` command
- [Glossary](../../project/glossary.md) — verification statuses and colors

## Documentation source of truth

Detailed runbooks and configuration: **[verilib-atomizer README](https://github.com/Beneficial-AI-Foundation/verilib-atomizer/blob/main/README.md)**
