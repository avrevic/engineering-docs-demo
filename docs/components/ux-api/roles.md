---
title: Roles
component: frontend
repo: https://github.com/Beneficial-AI-Foundation/verilib-frontend
status: active
last_reviewed: 2026-07-22
---

# Roles

Platform roles are stored in MySQL `roles` and referenced by `users.role_id` (see `sql/23.sql` in verilib-frontend).

| `role_id` | Name | Notes |
| --- | --- | --- |
| 1 | `admin` | Full platform admin; default seed for Certifier task grants |
| 2 | `moderator` | Elevated; can Feature Repo with admins |
| 3 | `user` | Default for new / unset users |

Helpers on `App\Models\Users` expose `isAdmin()` / `isModerator()` checks against these ids.

!!! note "Legacy mapping"
    Older data used `role_id = 3` for admin. Migration SQL remaps those rows to `1` and normalizes unknown/null roles to `user` (`3`).

Role alone does **not** fully gate Feature Repo or Certify — those flows also use task permissions. See [Permissions](permissions.md).
