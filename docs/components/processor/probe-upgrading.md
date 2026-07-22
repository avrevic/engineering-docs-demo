---
title: Probe upgrading
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# Probe upgrading

Probes run as separate Docker images pulled from private ECR (`verilib/probe-verus`, `verilib/probe-lean`, `verilib/probe-aeneas`). The worker image shells out via the host Docker socket (`docker_builder.py`).

## Build / push

From the atomizer repo (see `deploy/README.md`):

```bash
AWS_PROFILE=<profile> deploy/scripts/build_and_push.sh <env> all      # worker + probes
AWS_PROFILE=<profile> deploy/scripts/build_and_push.sh <env> worker   # worker only
```

Dockerfiles: `docker/Dockerfile.probe-verus`, `Dockerfile.probe-lean`, `Dockerfile.probe-aeneas`, `Dockerfile.worker`.

## Roll forward

1. Build and push new probe image tags for the environment.
2. Point env config / task definition at the new image refs (`PROBE_*_DOCKER_IMAGE` style vars in gitignored `deploy/config/<env>.env` — names documented in `example.env`).
3. Redeploy atomize-processor services so tasks pick up the new refs:

```bash
AWS_PROFILE=<profile> deploy/scripts/deploy.sh <env> all
```

Worker entrypoint configures ECR credential helper from those image URIs.

## Compatibility

Atomizer parsers expect **Schema 2.0** only. When upgrading probe versions, confirm extract JSON still matches [SCHEMA.md](https://github.com/Beneficial-AI-Foundation/probe/blob/main/docs/SCHEMA.md) before rolling production.

## Related

- [ECR on ECS](ecr-on-ecs.md)
- [Languages and plugins](languages-and-plugins.md)
