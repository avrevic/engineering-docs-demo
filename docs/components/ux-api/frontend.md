---
title: Frontend
component: frontend
repo: https://github.com/Beneficial-AI-Foundation/verilib-frontend
status: active
last_reviewed: 2026-07-22
---

# Frontend

Web user interface for [verilib.org](https://verilib.org) — browse verified code, manage uploads, view verification status and glossary content.

| | |
| --- | --- |
| **Repo** | [Beneficial-AI-Foundation/verilib-frontend](https://github.com/Beneficial-AI-Foundation/verilib-frontend) |
| **Owner** | _TBD_ |
| **Status** | active |

## Overview

The frontend is the primary **UX** surface for VeriLib users. It connects to the VeriLib API for:

- Browsing and searching the verified code library
- User accounts, uploads, and permissions
- Displaying verification colors and statuses (see [Glossary](../../project/glossary.md))
- About, glossary, community, and bounty pages

A **React rewrite** is in progress — see [React Rewrite](react-rewrite.md).

## Install

```bash
git clone https://github.com/Beneficial-AI-Foundation/verilib-frontend.git
cd verilib-frontend
# See repo README for npm/yarn install and dev server
```

**Result:** Local dev server (port documented in repo README).

## Configure

Environment variables and API URLs are documented in the repository. Do not commit secrets.

| Variable | Purpose |
| --- | --- |
| _TBD_ | See repo `.env.example` |

## Related UX & API topics

- [Roles](roles.md)
- [Permissions](permissions.md)
- [API spec](api-spec.md)
- [Rate limit](rate-limit.md)
- [Design](../../architecture/design.md)

## Documentation source of truth

Detailed setup and architecture: **[verilib-frontend README](https://github.com/Beneficial-AI-Foundation/verilib-frontend/blob/main/README.md)**
