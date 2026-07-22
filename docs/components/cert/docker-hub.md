---
title: Docker Hub
component: cert-queue
repo: https://github.com/Beneficial-AI-Foundation/local_validate
status: active
last_reviewed: 2026-07-22
---

# Docker Hub

Published probe images let third parties (and VeriLib config) pull a **digest-pinned** lab that matches a certificate.

## Publish

```bash
docker login
docker tag dalek-lite-probe:local YOUR_DOCKERHUB_USER/dalek-lite-probe:v1
docker push YOUR_DOCKERHUB_USER/dalek-lite-probe:v1
docker inspect --format='{{index .RepoDigests 0}}' YOUR_DOCKERHUB_USER/dalek-lite-probe:v1
```

Record the `sha256:…` digest on the certificate page / worker response (`docker_hub_image_digest`). Digests are often empty until push succeeds.

## Worker behavior

When `PROBE_DOCKER_PUSH=1`, `validate_processor` may push during a job. Many teams prefer CI/`make` release scripts for Hub publishing and leave the worker on pull/run of a known tag.

## Related

- [Probe Docker image](probe-docker-image.md)
- [Verify it yourself](verify-it-yourself.md)
