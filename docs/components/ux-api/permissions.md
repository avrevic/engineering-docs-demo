---
title: Permissions
component: frontend
repo: https://github.com/Beneficial-AI-Foundation/verilib-frontend
status: active
last_reviewed: 2026-07-22
---

# Permissions

Fine-grained capabilities use the `tasks` + `permissions` tables. Seeded platform tasks include (from `sql/25.sql`):

| Task label | Purpose |
| --- | --- |
| **Feature Repo** | Mark repositories as platform featured |
| **Certifier** | Create certified repository snapshots |

Default grants in that migration:

- **Feature Repo** — users with `role_id` in `{admin, moderator}`
- **Certifier** — users with `role_id = admin`; others can be granted via the permissions UI

Constants live in `App\Models\Tasks` / `TasksModel` (`LABEL_FEATURE_REPO`, `LABEL_CERTIFIER`).

## Certify path

`POST repobrowser/certify` checks `Users::userCanCertify(...)` before cloning a certificate repo and publishing validate work. Without the Certifier permission (or equivalent check), the API returns **403**.

## Upload / private GitHub

Private repo upload requires GitHub App OAuth; encrypted tokens are stored on `repos` and copied onto RabbitMQ `upload.request` payloads for the atomizer. Details: upstream `docs/private-github-upload-processor.md`.

## Related

- [Roles](roles.md)
- [Certificates queue](../cert/cert-queue.md)
- [Frontend overview](frontend.md)
