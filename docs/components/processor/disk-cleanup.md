---
title: Disk Cleanup
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# Disk cleanup

Workers keep **ephemeral scratch directories** under configurable workdirs and delete them when each job finishes (success or failure).

| Workdir env | Used by | Pattern |
| --- | --- | --- |
| `UPLOAD_WORKDIR` | upload-processor | `<base>/upload-<random>/` |
| `ATOMIZE_WORKDIR` | atomize-processor | scratch under base (or system tmp) |

Contract covered by unit tests (`tests/test_upload_scratch.py` and atomize equivalents): dirs are removed after success and after failure.

## Ops notes

- ECS instance root volumes should be large enough for concurrent probe runs (upstream deploy guide suggests large EBS, e.g. ≥ 100 GB) plus shared `WORKDIR_ROOT` from user-data.
- Durable artifacts belong in **S3**, not on the instance. If disk fills, check stuck containers / incomplete cleanup, then recycle the ECS instance or clear orphaned workdirs under the configured roots.
- Legacy poll mode used `REPOS_BASE_PATH` for on-disk clones; queue mode prefers S3 + scratch.

!!! note "Unknowns"
    There is no separate long-running “disk cleanup daemon” documented in the atomizer README. Host-level janitor scripts, if any, live outside this repo.

## Related

- [Queue workers](queue-workers.md)
- [ECR on ECS](ecr-on-ecs.md)
