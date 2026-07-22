# VeriLib Documentation

MkDocs Material site for [VeriLib](https://verilib.org) — the open-source library for formally verified code.

**Repository:** [Beneficial-AI-Foundation/engineering-docs](https://github.com/Beneficial-AI-Foundation/engineering-docs)

## Purpose

- **Hub index** for the VeriLib platform (frontend, CLI, atomizer, certificates).
- Each component repo owns its detailed `README.md`; this site links and summarizes.
- Navigation follows [`meta/component-list-complete.txt`](meta/component-list-complete.txt).

## Directory map

| Folder | `component-list-complete.txt` section |
| --- | --- |
| `docs/project/` | PROJECT (About, Documentation hub, Glossary, …) |
| `docs/getting-started/` | GETTING STARTED |
| `docs/architecture/` | ARCHITECTURE |
| `docs/components/processor/` | PROCESSOR |
| `docs/components/db/` | DB |
| `docs/components/cert/` | CERT (top-level **Certificates** nav tab) |
| `docs/components/ux-api/` | UX+API |
| `docs/components/devops/` | DEV-OPS |
| `docs/guides/` | GUIDES |
| `docs/reference/` | REFERENCE |
| `docs/contributing/` | CONTRIBUTING |
| `docs/releases/` | RELEASES |
| `docs/community/` | COMMUNITY |
| `docs/internal/` | INTERNAL ONLY (not in public build) |
| `meta/` | Writing standards and component lists (not published) |

## Quick start (local)

### Docker (recommended)

```bash
# Live reload with internal nav (port 8000)
docker compose --profile dev up

# Public static preview (port 8080)
docker compose --profile prod up --build

# Internal site + OAuth2 Proxy (port 4180)
cp oauth2-proxy/.env.example oauth2-proxy/.env   # fill in GitHub OAuth values
cp oauth2-proxy/allowed-emails.txt.example oauth2-proxy/allowed-emails.txt
docker compose --profile internal up --build
```

### pip (without Docker)

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

mkdocs serve -f mkdocs.yml              # public nav only
mkdocs serve -f mkdocs-internal.yml     # includes internal section
```

### Build static site

```bash
mkdocs build -f mkdocs.yml              # → site/ (public)
mkdocs build -f mkdocs-internal.yml     # → site/ (includes internal/)
```

## Public vs internal docs

MkDocs produces **static HTML** — there is no built-in login. We use a **dual-site** pattern:

| Build | Config | Deploy | Audience |
| --- | --- | --- | --- |
| Public | `mkdocs.yml` | `docs.verilib.org` | Everyone |
| Internal | `mkdocs-internal.yml` | `internal.docs.verilib.org` + OAuth2 Proxy | Team only |

- Public config **excludes** `docs/internal/` via `exclude_docs`.
- Internal config inherits public settings and adds an **Internal** nav section.
- Never put secret **values** in `docs/internal/` — document names and locations only.

### OAuth2 Proxy setup

1. Create a [GitHub OAuth App](https://github.com/settings/developers).
2. Copy `oauth2-proxy/.env.example` → `oauth2-proxy/.env`.
3. Copy `oauth2-proxy/allowed-emails.txt.example` → `oauth2-proxy/allowed-emails.txt`.
4. Run `docker compose --profile internal up --build`.
5. Use OAuth2 Proxy **v7.11.0+** (see [CVE-2025-54576](https://zeropath.com/blog/cve-2025-54576-oauth2-proxy-auth-bypass)).

## How to add or edit a page

1. Create or edit a file under `docs/` (kebab-case filenames).
2. Add YAML frontmatter: `title`, `status`, `last_reviewed` (and `component` / `repo` for component pages).
3. Add the page to `nav` in `mkdocs.yml` (and `mkdocs-internal.yml` if under `docs/internal/`).
4. For component pages: link to the repo README as source of truth — see [`meta/documentation-single-module.md`](meta/documentation-single-module.md).
5. Use placeholder admonition for unfinished pages:

   ```markdown
   !!! warning "Placeholder"
       This page is a stub. Content to be added.
   ```

## Platform repositories indexed

| Repo | Docs page |
| --- | --- |
| [verilib-frontend](https://github.com/Beneficial-AI-Foundation/verilib-frontend) | `docs/components/ux-api/frontend.md` |
| [verilib-cli](https://github.com/Beneficial-AI-Foundation/verilib-cli) | `docs/reference/scripts-and-cli.md` |
| [verilib-atomizer](https://github.com/Beneficial-AI-Foundation/verilib-atomizer) | `docs/components/processor/atomizer.md` |
| [local_validate](https://github.com/Beneficial-AI-Foundation/local_validate) | `docs/components/cert/cert-queue.md` |

Science-team repos (probe, probe-verus, benchmarks) are **not** indexed here — they document themselves.

## CI sketch (future)

```yaml
# .github/workflows/docs.yml
- run: pip install -r requirements.txt
- run: mkdocs build -f mkdocs.yml
- run: mkdocs build -f mkdocs-internal.yml -d site-internal
# Deploy site/ to public hosting; site-internal/ to internal hosting + OAuth2 Proxy
```

## Writing standards

- [`meta/documentation.md`](meta/documentation.md) — full documentation standard (Diátaxis, frontmatter, ADRs)
- [`meta/documentation-single-module.md`](meta/documentation-single-module.md) — per-repo README template
- [`meta/component-list-complete.txt`](meta/component-list-complete.txt) — master nav / section list

## Repo promotion checklist

When publishing as its own GitHub repo:

- [x] Init git repo and push to `Beneficial-AI-Foundation/engineering-docs`
- [ ] Set `repo_url` / `edit_uri` in `mkdocs.yml` (already templated)
- [ ] Add `LICENSE` for docs content
- [ ] Configure GitHub Actions for dual build + deploy
- [ ] Register OAuth App for internal docs hostname
- [ ] Add `oauth2-proxy/.env` and `allowed-emails.txt` to `.gitignore` (already listed)

## Agent handoff notes

If you are an AI agent continuing this work:

1. **Nav source of truth**: `meta/component-list-complete.txt` — keep `mkdocs.yml` nav in sync when adding sections.
2. **Do not duplicate repo docs** — hub pages summarize; READMEs in component repos are authoritative.
3. **Public build must not include** `docs/internal/` — verify with `mkdocs build -f mkdocs.yml` and confirm no `internal/` paths in `site/`.
4. **Filled pages** (as of initial setup): `index.md`, `project/about.md`, `project/glossary.md`, `architecture/system-map.md`, `getting-started/quick-start.md`, `reference/scripts-and-cli.md`, hub pages for the four platform repos, `reference/repo-list.md`, `contributing/how-to-write-docs.md`.
5. **Everything else** is a placeholder stub — search for `status: placeholder` to find remaining work.
6. **Do not edit** `.cursor/plans/` plan files unless the user asks.

## License

Documentation license TBD when repo is published. Component repos retain their own licenses (e.g. verilib-cli is MIT).
