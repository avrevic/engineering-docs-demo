---
title: System overview
status: active
last_reviewed: 2026-07-22
---

# System overview

VeriLib is a library of formally verified code with a **web app**, a **contributor CLI**, a **queue-based atomizer**, and a **certificate probe/worker** stack.

## Layers

| Layer | Job |
| --- | --- |
| **Experience** | Browse, upload, certify, graph/repo browser ([frontend](../components/ux-api/frontend.md)) |
| **Contributor tooling** | Local `.verilib/` lifecycle and API sync ([CLI](../reference/scripts-and-cli.md)) |
| **Processing** | Clone to S3, probe extract, persist atoms ([atomizer](../components/processor/atomizer.md)) |
| **Certification** | Reproducible probe images + validate/promote workers ([certificates](../components/cert/cert-queue.md)) |
| **Data plane** | MySQL (owned by frontend for certs; atomizer writes atoms), RabbitMQ, S3 |

## Trust boundaries

- **PHP** owns certificate and most product DB writes after queue responses.
- **Atomizer / cert workers** are headless; cert workers are intentionally **DB-free**.
- **Probes** are science-team binaries/images; platform repos orchestrate them.

## Where to go next

- [System map](system-map.md) — repo diagram
- [Data flows](data-flows.md) — sequences
- [Repo list](../reference/repo-list.md)
