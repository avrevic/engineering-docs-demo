---
title: Queue workers
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# Queue workers

Two long-running consumers (same worker image, different CMD):

| Worker | Entry | Role |
| --- | --- | --- |
| **upload-processor** | `python -m scripts.run_upload_processor` | Clone / stage source → S3 |
| **atomize-processor** | `python -m scripts.run_atomize_processor` | S3 → probe extract → parse → MySQL |

Declare topology without consuming:

```bash
python -m scripts.declare_upload_topology
python -m scripts.declare_atomize_topology
```

E2E without the UI: `scripts/run_e2e.py` (publishes upload then atomize requests).

## Scratch / S3

| Env | Purpose |
| --- | --- |
| `UPLOAD_WORKDIR` | Ephemeral clone dirs (`upload-<random>/`); deleted on exit |
| `ATOMIZE_WORKDIR` | Ephemeral extract dirs for atomize jobs |
| Shared S3 bucket | Repo trees + probe JSON between frontend and workers |

Atomize-processor requires a host Docker socket (`WORKER_REQUIRE_DOCKER` / entrypoint check) to run probe containers.

## Private GitHub (upload only)

- Web app stores encrypted OAuth tokens on `repos` and **copies ciphertext onto** `upload.request` `source`.
- Upload processor decrypts with `GITHUB_TOKEN_ENCRYPTION_KEY` (or `JWT_KEY`) matching the frontend — it does **not** read tokens from MySQL.
- Optional `GITHUB_APP_CLIENT_ID` / `GITHUB_APP_CLIENT_SECRET` refresh tokens in memory during clone (not written back to DB).
- Atomize processor reads S3 only.

Conceptual mirror of frontend `docs/private-github-upload-processor.md`. Empty repos (no commits) fail at `git rev-parse HEAD`.

## Env names (secrets not listed)

Database: `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME`.  
Probes: `PROBE_VERUS_BIN`, `PROBE_LEAN_BIN`, `PROBE_AENEAS_BIN` (local) or ECR image vars for Docker mode.  
Runtime: `CLI_TIMEOUT`, `POLL_INTERVAL`, `MAX_WORKERS`, `MAX_RETRIES`, `ATOMIZER_LANGUAGES`, `DEFAULT_USER_ID`.  
Broker: RabbitMQ settings from worker/deploy config (see `deploy/config/example.env`).

## Related

- [Data flow](data-flow.md)
- [ECR on ECS](ecr-on-ecs.md)
- [Frontend API / queue side effects](../ux-api/api-spec.md)
