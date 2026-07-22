---
title: Verify it yourself
component: cert-queue
repo: https://github.com/Beneficial-AI-Foundation/local_validate
status: active
last_reviewed: 2026-07-22
---

# Verify it yourself

Reproduce a published certificate image without trusting VeriLib’s UI alone. You check: **(1)** same image digest, **(2)** same `INPUT_MANIFEST_SHA256` / image manifest, **(3)** extract counts/hashes match the published numbers.

## 1. Pull by digest

```bash
docker pull --platform linux/amd64 \
  YOUR_DOCKERHUB_USER/dalek-lite-probe@sha256:YOUR_DIGEST_HERE
```

## 2. Quick check (no Verus run)

```bash
docker run --rm --platform linux/amd64 --entrypoint '' \
  IMAGE@sha256:DIGEST \
  sh -c 'echo INPUT_MANIFEST_SHA256=$(cat /etc/dalek-probe-input-hash.txt); cat /etc/dalek-probe-image-manifest.json'
```

Compare to the certificate page / published manifest fields (`dalek_lite_resolved_commit`, etc.).

## 3. Full extract

```bash
docker run --rm --platform linux/amd64 IMAGE@sha256:DIGEST
# or from a clone of this repo:
./scripts/verify-local.sh YOUR_DOCKERHUB_USER/dalek-lite-probe:v1
./scripts/verify-local.sh --local dalek-lite-probe:local
```

Compare end-of-log verification counts, `UNIFIED_EXTRACT_SHA256`, and bundle hash.

## Stats-site checklist

Upstream `docs/CERTIFICATION_AND_VALIDATION_PSEUDOCODE.md` lists what the public `/cert/…` page should expose for comparison. Optional HTML sketch: `website/docker-hub-verify.html` in the repo (if present on your branch).

!!! note "Unknowns"
    Exact production Docker Hub org/tag for every language may differ from the dalek-lite examples; use the digest printed on the certificate you are validating.

## Related

- [Docker Hub](docker-hub.md)
- [Probe Docker image](probe-docker-image.md)
