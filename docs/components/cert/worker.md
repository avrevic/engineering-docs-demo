---
title: Worker
component: cert-queue
repo: https://github.com/Beneficial-AI-Foundation/local_validate
status: active
last_reviewed: 2026-07-22
---

# Worker

Python consumers under `worker/`. Probe core lives in `cert_probe_worker.py` but is **invoked by** the queue processor — not a standalone MySQL poller (legacy claim loop removed).

## Processes

| Script | Module | Pipeline |
| --- | --- | --- |
| `scripts/run_validate_processor.py` | `validate_processor` | `validate.request` → probe Docker → S3 → optional Sepolia → `validate.response` + livelog |
| `scripts/run_promote_processor.py` | `promote_processor` | `promote.request` → mainnet `Certify.sol` → `promote.response` |

```bash
uv sync
cp .env.example .env   # RABBITMQ_*, S3_*; no DB_* vars
uv run python scripts/run_validate_processor.py
uv run python scripts/run_promote_processor.py   # separate process
```

## Responsibilities split

| Piece | Role |
| --- | --- |
| PHP frontend | Sole MySQL writer; publish/consume queues; apply `pending` → `ready` / error |
| validate_processor | Probe build/run, S3 upload, Sepolia (optional) |
| promote_processor | Mainnet tx only |
| Probe image | Extract → `probe-manifest-complete.json` |

## Probe execution (`cert_probe_worker` / `probe_runner`)

Per request:

1. Resolve probe kind from `language_id` + `has_aeneas_proof_language` (worker env: `LEAN_REPO_LANGUAGE_ID`, `AENEAS_REPO_LANGUAGE_ID`) or explicit override.
2. `docker build` / `run` (and optional `push`) via `PROBE_DOCKER_*` (+ `_LEAN` / `_AENEAS` suffixes).
3. Read `$PROBE_OUTPUT_DIR/cert<repo_id>/probe-manifest-complete.json`.
4. Optionally Sepolia-anchor; stream progress on `validate.livelog`.

## Env names (no secret values)

| Group | Names |
| --- | --- |
| RabbitMQ | `RABBITMQ_HOST`, `PORT`, **`RABBITMQ_VHOST`** (required), user/password, TLS, prefetch |
| S3 | `S3_BUCKET`, `S3_REPOS_BUCKET`, `AWS_REGION`, `S3_ENDPOINT_URL`, AWS keys |
| Probe | `PROBE_OUTPUT_DIR`, `PROBE_DOCKER_*` |
| Sepolia | `ETH_CERTIFY_ENABLED`, `SEPOLIA_RPC_URL`, `SEPOLIA_PRIVATE_KEY`, `CERTIFY_ADDRESS`, dedup vars |
| Mainnet | `MAINNET_CERTIFY_ENABLED`, `MAINNET_RPC_URL`, `MAINNET_CERTIFY_ADDRESS`, `MAINNET_PRIVATE_KEY`, dedup vars |

Failure: permanent errors → error response; transient → retry exchange up to `JOB_MAX_ATTEMPTS` (default 5).

## Related

- [Cert queue](cert-queue.md)
- [Testnet](testnet.md) / [Mainnet](mainnet.md)
- Upstream [`worker/README.md`](https://github.com/Beneficial-AI-Foundation/local_validate/blob/main/worker/README.md)
