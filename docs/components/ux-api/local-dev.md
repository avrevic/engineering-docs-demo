---
title: Local development
component: frontend
repo: https://github.com/Beneficial-AI-Foundation/verilib-frontend
status: active
last_reviewed: 2026-07-22
---

# Local development

Runbook for [verilib-frontend](https://github.com/Beneficial-AI-Foundation/verilib-frontend). Prefer the upstream README when commands drift.

## Prerequisites

- Docker and Docker Compose
- Node.js and npm (React app pins Node via `.nvmrc` under `react-graph-standard/`)

## Quick path (basic Compose)

```bash
git clone https://github.com/Beneficial-AI-Foundation/verilib-frontend.git
cd verilib-frontend
cp .env.example .env
npm ci
docker-compose --env-file .env.docker.dev up
```

| Service | URL / port |
| --- | --- |
| Main app (Apache) | http://localhost:8080 |
| phpMyAdmin | http://localhost:8081 |
| MySQL | `3306` (host) |
| BrowserSync (`npm run dev`) | http://localhost:3000 (proxies `:8080`) |

## Full local stack

Alternate Compose file seeds MySQL (`db.sql` + `docker/seed-dev.sql`), builds React into `public/assets/react-app/`, and starts RabbitMQ, phpMyAdmin, and the PHP socket service:

```bash
cp apache/.htaccess public/.htaccess   # required; root .htaccess is production DocumentRoot layout
docker compose --env-file docker/.env.stack -f docker-compose.docker-dev.yml --profile setup run --rm composer
docker compose --env-file docker/.env.stack -f docker-compose.docker-dev.yml up --build
```

Optional Vite HMR: add `--profile vite` (port **5173**).

On Linux with uid ≠ 1000:

```bash
export HOST_UID=$(id -u) HOST_GID=$(id -g)
```

PHP inside the container reads DB settings from `docker/compose.env` (mounted as `/var/www/.env`).

## Environment (names only)

Copy from `.env.example`. Documented names (values stay local / secret stores):

| Variable | Purpose |
| --- | --- |
| `DB_HOST`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_PORT` | MySQL |
| `USE_NEW_UI_TOOLS` | `1` bundled Gulp assets; `0` legacy CSS/JS paths |
| `MODE` | `development` or `production` (asset fingerprinting) |
| `USE_AUTH_SYSTEM` | Enable auth |
| `SHOW_ERRORS`, `DEBUG_MODE` | Dev diagnostics |
| `SOCKET_URL`, `SOCKET_PORT` | WebSocket service |
| `RABBITMQ_*`, `CLI_EXCHANGE`, `CLI_QUEUE`, `CLI_ROUTING_KEY` | Queue wiring for CLI / workers |
| `JWT_KEY` | JWT signing material (set a real secret locally) |
| `SENDGRID_API_KEY` | Outbound email (optional) |
| `UPLOADER`, `UPLOADER_BASE_PATH` | Upload backend mode |

Do not commit filled `.env` files or PATs. Server deploy for React artifacts uses a fine-grained GitHub PAT under `~/.config/verilib/gh-token` (see upstream README).

## Asset commands

```bash
npm run dev     # Gulp + BrowserSync → localhost:3000
npm run build   # Production bundles under public/assets/dist/
npm run build:react   # Build react-graph-standard → public/assets/react-app/
```

## E2E tests

```bash
cd tests
npm install
npx playwright test
```

Root `package.json` also exposes `test` / `test:ci` / `test:ai` for Playwright reporters.
