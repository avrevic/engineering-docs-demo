---
title: Testnet
component: cert-queue
repo: https://github.com/Beneficial-AI-Foundation/local_validate
status: active
last_reviewed: 2026-07-22
---

# Testnet (Sepolia)

On-chain anchoring on the **validate** path uses Ethereum **Sepolia** when `ETH_CERTIFY_ENABLED=1`. A successful probe alone may not finalize the cert until the Sepolia tx succeeds (depending on `ETH_CERTIFY_REQUIRED` and per-request `eth_certify_enabled`).

## Flow

1. `validate_processor` finishes probe + S3 upload.
2. If enabled, `eth_onchain.maybe_sepolia_certify_probe_bundle` submits `certify()` with the canonical content hash (includes Docker Hub digest when present).
3. Response carries `sepolia_certify_tx_hash` for PHP to store.
4. Idempotency: scan `Certified` events for matching `identifierHash` + `contentHash` before submit (testnet dedup defaults **fail-open** unless `ETH_CERTIFY_DEDUP_REQUIRED=1`).

## Env names

`SEPOLIA_RPC_URL`, `SEPOLIA_PRIVATE_KEY` (or `PRIVATE_KEY`), `CERTIFY_ADDRESS`, `ETH_CERTIFY_CHAIN_ID` (default `11155111`), gas/priority fee buffers, `ETH_CERTIFY_DEDUP_FROM_BLOCK`, `ETH_CERTIFY_DEDUP_REQUIRED`.

## Related

- [Worker](worker.md)
- [Mainnet](mainnet.md) — separate promote pipeline; content hash must match Sepolia for equivalence claims
