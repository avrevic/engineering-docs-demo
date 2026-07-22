---
title: API spec
component: frontend
repo: https://github.com/Beneficial-AI-Foundation/verilib-frontend
status: active
last_reviewed: 2026-07-22
---

# API spec

There is no checked-in OpenAPI document in verilib-frontend today. The React client (`react-graph-standard/src/services/api.ts`) is the practical inventory of the JSON `/v2/...` surface. Cookie session auth (`withCredentials: true`) is assumed unless noted.

## Representative `/v2` endpoints

| Area | Examples |
| --- | --- |
| Repo lifecycle | `POST /v2/repo/create`, `POST /v2/repo/{id}/update`, `POST /v2/repo/publish/{id}`, `unpublish`, `reclone`, `reatomize` |
| GitHub | `.../github/check-url`, `auth-url`, `pending-auth`, `folders`, `detect` |
| Repo metadata | `GET /v2/repo/info/{id}`, `GET /v2/repo/resolve/{user}/{slug}`, `GET /v2/repo/{id}/status`, `logs` |
| Atoms / graph | `GET /v2/atoms/{id}/children`, bookmarks, labels, issues |
| Catalog | `GET /v2/languages`, `GET /v2/types`, `GET /v2/verifier/versions/{proofLanguageId}` |
| Bounty | `POST /v2/bounty/{id}/attempt`, `submit_proof`, `submit_bounty` |
| Code map | `GET /v2/code_map/ids` |

## Classic / non-`/v2` routes (selected)

Routed from `public/web_routes.php`:

| Route | Role |
| --- | --- |
| `POST repobrowser/certify` | Create certificate snapshot; enqueue validate worker; leave `certificates.status=pending` |
| `GET certificates` | Certificate UI / listing for a parent repo |
| Atomize helpers | Legacy/internal atomize paths; JSON-only atomize documented in upstream `docs/json-only-server-setup.md` |
| Auth user API | Under `/api/user/` (used by scripts / auth wiring) |

## Queue side effects (not HTTP responses)

| User action | Downstream |
| --- | --- |
| Upload / reclone (when queue workers enabled) | `upload.request` → [atomizer](../processor/atomizer.md) |
| Certify | Validate publish → [certificates / cert queue](../cert/cert-queue.md) |
| CLI traffic | RabbitMQ `CLI_*` exchange/queue names from `.env` |

## Related

- [Frontend](frontend.md)
- [React rewrite](react-rewrite.md)
- [Permissions](permissions.md)

For a full OpenAPI dump later, generate from routes or reverse-engineer `api.ts` + `web_routes.php` — out of scope for this hub until a stable spec file exists upstream.
