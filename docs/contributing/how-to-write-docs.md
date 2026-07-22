---
title: How to write docs
status: active
last_reviewed: 2026-07-22
---

# How to write docs

VeriLib uses a **hub-and-spoke** documentation model.

## The rule

| Where | What |
| --- | --- |
| **Your repo** | `README.md` = full module doc (source of truth) |
| **Docs hub (this site)** | One page per module = title + link to repo README + short summary |

If your `README.md` is good, the hub page takes about two minutes to add.

## Adding a hub page

1. Create `docs/components/{area}/{slug}.md` (or the appropriate section folder).
2. Add frontmatter: `title`, `component`, `repo`, `status`, `last_reviewed`.
3. Include a link to the repo README as "Documentation source of truth".
4. Add the page to `mkdocs.yml` nav (and `mkdocs-internal.yml` if internal-only).
5. Open a PR — no doc update = not done for behavior-changing work.

## Writing standards

Full conventions, templates, and review cadence live in the repository `meta/` folder:

- `meta/documentation.md` — documentation standard
- `meta/documentation-single-module.md` — module README template
- `meta/component-list-complete.txt` — master section list

## Public vs internal

- **Public** pages: safe for open-source contributors and external users.
- **Internal** pages (`docs/internal/`): ops runbooks, server lists, credentials *names* only — never secret values. Built only with `mkdocs-internal.yml` and deployed behind OAuth2 Proxy.

## Related

- [PR checklist](pr-checklist.md)
- [First contribution](../getting-started/first-contribution.md)
