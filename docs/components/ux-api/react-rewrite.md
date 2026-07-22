---
title: React rewrite
component: frontend
repo: https://github.com/Beneficial-AI-Foundation/verilib-frontend
status: active
last_reviewed: 2026-07-22
---

# React rewrite

The interactive repo browser / dependency graph lives in **`react-graph-standard/`** inside [verilib-frontend](https://github.com/Beneficial-AI-Foundation/verilib-frontend). It is a Vite + React + TypeScript app that talks to the PHP `/v2/...` API with cookie credentials.

## Stack (app package)

- React + TypeScript, Vite
- TanStack Query, Redux Toolkit
- MUI + Tailwind
- CodeMirror, D3
- Axios client in `src/services/api.ts`
- Node version pinned (see `.nvmrc` / `engines` in that package)

## Build and deploy

```bash
npm run build:react
# or: npm run build --prefix react-graph-standard
```

Output: `public/assets/react-app/` (`index.html` + hashed assets).

CI workflow **React Build Check** uploads artifact `react-app-<tree-sha>` where `<tree-sha>` is `git rev-parse HEAD:react-graph-standard`. Server deploy:

```bash
./scripts/deploy.sh <branch>   # default: main
```

The script reuses a matching artifact when present, otherwise dispatches the workflow, then atomically swaps files (keeps one `assets.old.<ts>` for rollback). See the frontend README for PAT setup under `~/.config/verilib/gh-token`.

## Local Vite

With the full Docker stack, optional `--profile vite` exposes HMR on port **5173**. Otherwise develop against Apache on **8080** with a production-style build of the React assets.

## Scope vs classic PHP UI

| Surface | Implementation |
| --- | --- |
| Marketing / account / many legacy pages | PHP templates + Gulp assets |
| Repo browser, graph, richer repo tooling | React SPA |
| Certify click | PHP route `POST repobrowser/certify` (may be invoked from UI) |

## Related

- [API spec](api-spec.md)
- [Local development](local-dev.md)
- [Frontend overview](frontend.md)
