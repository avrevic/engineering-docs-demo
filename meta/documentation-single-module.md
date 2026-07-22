# Module documentation template

**For engineers.** Each module/repo documents itself in **`README.md`**. The MkDocs site is only an **index** — it links to every module and shows the same structure in one place.

You do **not** write docs twice. Write `README.md` in your repo; the docs team (or you) add one short entry to the hub so it appears in MkDocs nav.

---

## The rule

| Where | What |
|-------|------|
| **Your repo** | `README.md` = full module doc (source of truth) |
| **Docs hub (MkDocs)** | One page per module = title + link to repo README + optional copy-paste summary |

If `README.md` is good, the hub page takes 2 minutes.

---

## README.md template (copy into your repo)

Replace `{placeholders}`. Delete sections that don't apply.

```markdown
# {Module title}

{One or two sentences: what this module does.}

| | |
|---|---|
| **Repo** | https://github.com/org/{repo-name} |
| **Owner** | @your-github-handle |
| **Status** | active |

---

## Install

How to get it running the first time.

```bash
git clone https://github.com/org/{repo-name}.git
cd {repo-name}
cp .env.example .env    # if needed
{install command — e.g. npm install, pip install -r requirements.txt, docker compose up -d}
```

**Result:** {what “success” looks like — e.g. “API on http://localhost:8080/health returns 200”}

---

## Configure

| File / variable | What it does |
|-----------------|--------------|
| `.env` | Local secrets and URLs |
| `config.yaml` | App settings |
| `DATABASE_URL` | Postgres connection |

> Do not commit secrets. Put real values in `.env` or your secret store only.

---

## Run / stop / restart

```bash
# Start
{start command}

# Stop
{stop command}

# Restart (after code or config change)
{restart command}
```

---

## Dependencies

What must be running **before** this module works.

| Service | Why |
|---------|-----|
| PostgreSQL | stores data |
| Redis | cache / queue |
| {other-module} | {why} |

---

## Logs & debugging

```bash
{how to view logs — e.g. docker compose logs -f app, tail -f app.log}
```

**Health check:**

```bash
{one command — e.g. curl http://localhost:8080/health}
```

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Won't start / port in use | `{e.g. kill stale process, change PORT in .env}` |
| Can't connect to DB | Check `DATABASE_URL`, is Postgres up? |
| {your common issue} | {your fix} |

---

## Related links

- Docs hub: https://docs.example.com/modules/{slug}/
- Depends on: [{other-module}](https://github.com/org/other-module)
- Used by: {who calls this module}
```

---

## Checklist before you merge

- [ ] Title and description at the top
- [ ] Repo URL in the table
- [ ] Install steps someone new can follow copy-paste
- [ ] Run / stop commands
- [ ] Config table (file names only, no secret values)
- [ ] Dependencies listed
- [ ] At least one troubleshooting row
- [ ] Owner handle filled in

---

## Hub page (MkDocs) — one file per module

Create `docs/modules/{slug}.md` in the **docs hub repo**:

```markdown
---
title: {Module title}
description: {Same one-liner as README}
---

# {Module title}

{Same one-liner as README}

| | |
|---|---|
| **Repo** | [org/{repo-name}](https://github.com/org/{repo-name}) |
| **Owner** | @your-github-handle |
| **Status** | active |

!!! info "Full documentation"
    The source of truth is the repo README:
    **[README on GitHub →](https://github.com/org/{repo-name}#readme)**

## Quick reference

### Install

```bash
{paste the same install block from README — keep in sync when README changes}
```

### Run

```bash
{paste start command}
```

### Health check

```bash
{paste health check}
```

## See also

- [{dependency-module}](./other-module.md)
```

Add the page to `mkdocs.yml`:

```yaml
nav:
  - Home: index.md
  - Modules:
      - Auth Service: modules/auth-service.md
      - Worker: modules/worker.md
      - {Your module}: modules/{slug}.md
```

---

## Who does what

| Task | Who |
|------|-----|
| Write / update repo `README.md` | **Module engineer** (you) |
| Add hub page + nav entry | You, or docs maintainer after your PR |
| Keep install/run blocks in sync | **You** when README changes |

---

## Optional sections (add only if needed)

| Section | When to add |
|---------|-------------|
| **API** | Module exposes HTTP/API — link to OpenAPI or list main endpoints |
| **Deploy** | Different from local install — add staging/prod commands |
| **Env vars table** | Many config knobs — extend the Configure section |
| **Architecture diagram** | Module is complex — one small mermaid block in README |

Don't add runbooks, ADRs, or incident templates unless someone asks — keep README focused.

---

## Example (filled in)

```markdown
# Auth Service

Handles login, JWT tokens, and user sessions for the platform.

| | |
|---|---|
| **Repo** | https://github.com/org/auth-service |
| **Owner** | @jane |
| **Status** | active |

## Install

```bash
git clone https://github.com/org/auth-service.git
cd auth-service
cp .env.example .env
docker compose up -d
```

**Result:** http://localhost:8080/health returns `{"status":"ok"}`

## Configure

| File / variable | What it does |
|-----------------|--------------|
| `.env` | `DATABASE_URL`, `JWT_SECRET` |
| `PORT` | Default `8080` |

## Run / stop / restart

```bash
docker compose up -d
docker compose down
docker compose restart auth
```

## Dependencies

| Service | Why |
|---------|-----|
| PostgreSQL | user + session storage |

## Logs & debugging

```bash
docker compose logs -f auth
curl -sf http://localhost:8080/health
```

## Troubleshooting

| Problem | Fix |
|---------|-----|
| 503 on health | Postgres not up — `docker compose up -d postgres` |
| Invalid JWT | Rotate `JWT_SECRET` in `.env`, restart |
```

---

*Copy this file into your docs hub as `docs/contributing/module-template.md` and link it from the home page.*
