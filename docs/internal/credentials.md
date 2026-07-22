---
title: Credentials
status: internal
last_reviewed: 2026-07-22
---

# Credentials

!!! danger "Internal only — no secret values"
    Document secret **names** and **locations** only (e.g. "API key in AWS Secrets Manager `prod/verilib/api`"). **Never** paste passwords, tokens, or private keys into this repo.

## Overview

_TBD — map of credential names to secret stores and rotation owners._

## Template

| Name | Location | Used by | Rotation owner | Last rotated |
| --- | --- | --- | --- | --- |
| `VERILIB_API_KEY` | _secret store path_ | verilib-cli | _TBD_ | _TBD_ |

## Related

- [Rotate credentials](../guides/rotate-credentials.md)
- [Account list](account-list.md)
- [Private repos](private-repos.md)
