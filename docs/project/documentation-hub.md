---
title: Documentation hub
status: active
last_reviewed: 2026-07-22
---

# Documentation hub

Welcome to the VeriLib documentation hub — the open-source library for formally verified code and tools for proving that code meets your specifications.

## What is VeriLib?

VeriLib is a free open-source library of formally verified code. It helps developers and researchers share verified implementations, track verification progress, and build trust through mathematical proof.

[Learn more about VeriLib →](about.md){ .md-button }

## Quick links

| I want to… | Start here |
| --- | --- |
| Get running in minutes | [Quick start](../getting-started/quick-start.md) |
| Understand the platform | [System map](../architecture/system-map.md) |
| Use the CLI | [Scripts and CLI](../reference/scripts-and-cli.md) |
| Learn verification terms | [Glossary](glossary.md) |
| Contribute | [First contribution](../getting-started/first-contribution.md) |

## Platform components

| Component | Repo | Role |
| --- | --- | --- |
| Frontend | [verilib-frontend](https://github.com/Beneficial-AI-Foundation/verilib-frontend) | Web UI at [verilib.org](https://verilib.org) |
| CLI | [verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli) | Local repo and verification workflow |
| Atomizer | [verilib-atomizer](https://github.com/Beneficial-AI-Foundation/verilib-atomizer) | Server-side atomization pipeline |
| Certificates | [local_validate](https://github.com/Beneficial-AI-Foundation/local_validate) | Certificate validation worker |

The [Beneficial AI Foundation](https://github.com/Beneficial-AI-Foundation) organization also hosts science-team repositories (probe tools, benchmarks, verification projects). Those are documented in their own repos; this hub covers the VeriLib platform.

## Documentation model

Each component repo owns its detailed `README.md`. This site is the **index** — it links to every module and organizes content in one place. See [How to write docs](../contributing/how-to-write-docs.md) for the hub-and-spoke convention.
