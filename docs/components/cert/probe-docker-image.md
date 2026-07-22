---
title: Probe Docker image
component: cert-queue
repo: https://github.com/Beneficial-AI-Foundation/local_validate
status: active
last_reviewed: 2026-07-22
---

# Probe Docker image

Default image (historically *dalek-lite-probe-docker*) bundles a Verus project tree with Verus, **probe-verus**, analyzer, and scip so `probe-verus extract` is reproducible anywhere Docker runs (`linux/amd64`). Sibling Dockerfiles cover Lean / Aeneas kinds (`Dockerfile.probe-lean`, `Dockerfile.probe-aeneas`).

## Build (release-style)

```bash
git clone https://github.com/Beneficial-AI-Foundation/local_validate.git
cd local_validate
docker build --platform linux/amd64 \
  --build-arg IMAGE_BUILD_DATE="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  --build-arg DALEK_LITE_COMMIT=PASTE_SHA_HERE \
  --build-arg CERT_README_PAGE_URL='https://verilib.org/cert/5050' \
  --build-arg CERT_README_BADGE_IMAGE_URL='https://img.shields.io/badge/VeriLib-Certified-2e7d32' \
  --build-arg CERT_README_BADGE_ALT='VeriLib Certified' \
  -t YOUR_DOCKERHUB_USER/dalek-lite-probe:YOUR_TAG .
```

Useful build-arg names (values stay in CI/secrets): `DALEK_LITE_REPO`, `DALEK_LITE_BRANCH`, `DALEK_LITE_COMMIT`, `DALEK_PACKAGE`, `VERUS_VERSION`, `PROBE_VERUS_VERSION`, `CERT_README_*`.

## Fetch manifest

```bash
./scripts/run-and-fetch-manifest.sh --local --out ./dalek-probe-output YOUR_IMAGE:TAG
```

Host output includes `dalek-probe-manifest-complete.json`, proofs/atoms copies, and hashes. Layout for the worker: `$PROBE_OUTPUT_DIR/cert<repo_id>/probe-manifest-complete.json`.

## Inside the image (selected paths)

| Path | Contents |
| --- | --- |
| `/opt/dalek-lite` | Baked sources (no `.git`) |
| `/etc/dalek-probe-image-manifest.json` | Commit, tree hash, tool versions, build date |
| `/etc/dalek-probe-input-hash.txt` | `INPUT_MANIFEST_SHA256` |
| `/etc/cert-readme-badge.md` | Optional README badge snippet |
| `/opt/dalek-lite/.verilib/probes/` | Probe JSON after extract |

## Badge / README checkmark

Build with all three `CERT_README_*` args, then:

```bash
docker run --rm --entrypoint '' IMAGE:TAG cat /etc/cert-readme-badge.md
```

Or sync into a dalek-verus clone via `scripts/open-badge-pr-from-probe-manifest.sh` (local branch by default; `--open-pr` optional).

## Related

- [Docker Hub](docker-hub.md)
- [Verify it yourself](verify-it-yourself.md)
- Upstream README + `docs/CERTIFICATION_AND_VALIDATION_PSEUDOCODE.md`
