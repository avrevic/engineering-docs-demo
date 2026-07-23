---
title: Atomizer
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# Atomizer

Queue-based processor for VeriLib repositories: clone/upload to S3, run language probes, parse Schema 2.0 JSON, and persist atoms for the web app.

| | |
| --- | --- |
| **Repo** | [Beneficial-AI-Foundation/verilib-atomizer](https://github.com/Beneficial-AI-Foundation/verilib-atomizer) (private) |
| **Runtime** | Python 3.10+, RabbitMQ consumers, Docker-out-of-Docker probes on ECS-on-EC2 |
| **Status** | active |

## What this repo owns

| Owns | Does not own |
| --- | --- |
| Upload + atomize workers | Web UX / certify UI ([frontend](../ux-api/frontend.md)) |
| Language plugins + probe orchestration | Certificate probe worker ([certificates](../cert/cert-queue.md)) |
| S3 handoff of repo trees / probe output | CLI local atomize ([verilib-cli](../../reference/scripts-and-cli.md)) |
| Persist atoms / deps / statuses to MySQL | Science-team probe *source* repos (linked only) |

Legacy DB-polling (`main.py`) may still exist in older deployments; production is RabbitMQ consumers (`scripts/run_upload_processor.py`, `scripts/run_atomize_processor.py`).

## Hub pages

- [Languages and plugins](languages-and-plugins.md)
- [Data flow](data-flow.md)
- [Queue workers](queue-workers.md)
- [JSON mapping](json-mapping.md) — Schema 2.0 envelope
- [Atom statuses and colours](atom-statuses-and-colours.md) — verification-status → colour scheme
- [Probe upgrading](probe-upgrading.md)
- [ECR on ECS](ecr-on-ecs.md)
- [Disk cleanup](disk-cleanup.md)

## Handoff from frontend

Pending uploads and reatomize actions publish queue messages. Private GitHub tokens arrive **on the message** (encrypted), not via a MySQL lookup — see [queue workers](queue-workers.md) and upstream `docs/private-github-upload-processor.md`.

## Documentation source of truth

**[verilib-atomizer README](https://github.com/Beneficial-AI-Foundation/verilib-atomizer/blob/main/README.md)** and [`deploy/README.md`](https://github.com/Beneficial-AI-Foundation/verilib-atomizer/blob/main/deploy/README.md).
