---
title: Tech stack
component: frontend
repo: https://github.com/Beneficial-AI-Foundation/verilib-frontend
status: active
last_reviewed: 2026-07-22
---

# Tech stack

| Layer | Technology |
| --- | --- |
| HTTP / app | PHP (Apache + PHP-FPM), custom router in `public/web_routes.php` |
| Data | MySQL (Eloquent / PDO); schema fragments under `sql/`; init dump via Compose |
| Classic UI | HTML/CSS/JS, Tailwind CSS, Gulp bundling (`gulpfile.js`) |
| Graph / repo browser UI | React + TypeScript + Vite in `react-graph-standard/` |
| Messaging | RabbitMQ (upload / CLI / validate publishers) |
| Realtime | PHP socket service (`socket.php`) |
| E2E | Playwright under `tests/` |
| CI | GitHub Actions: release with built assets; Playwright; React Build Check artifacts |

## Layout (selected)

| Path | Role |
| --- | --- |
| `public/` | Web root, PHP app, controllers, models |
| `react-graph-standard/` | Vite React SPA (repo browser / graph) |
| `php/`, `apache/`, `rabbitmq/`, `docker/` | Container images and stack env |
| `sql/` | Incremental SQL migrations / seeds |
| `scripts/` | Deploy and ops helpers (`deploy.sh`, sync/replay tools) |
| `docs/` | Upstream notes (private GitHub upload, Lean atomize, JSON-only atomize) |

## Asset modes

Controlled by `USE_NEW_UI_TOOLS` + `MODE`:

- **Modern (`USE_NEW_UI_TOOLS=1`)** — Gulp emits hashed (production) or unhashed (development) bundles under `public/assets/dist/`.
- **Legacy (`USE_NEW_UI_TOOLS=0`)** — Serves `public/assets/js/` and `public/assets/style/` directly.

React production assets land in `public/assets/react-app/` and are **not** committed; CI builds and `scripts/deploy.sh` fetch GitHub Actions artifacts by tree SHA.

## Related

- [Local development](local-dev.md)
- [React rewrite](react-rewrite.md)
- Upstream [README](https://github.com/Beneficial-AI-Foundation/verilib-frontend/blob/main/README.md)
