---
title: Mainnet
component: cert-queue
repo: https://github.com/Beneficial-AI-Foundation/local_validate
status: active
last_reviewed: 2026-07-22
---

# Mainnet

Mainnet anchoring is **not** part of the validate consumer. PHP publishes `promote.request`; `promote_processor` submits the mainnet `Certify.sol` transaction and returns `promote.response`.

## Ops constraints

- Real gas — enable only with `MAINNET_CERTIFY_ENABLED=1` and filled RPC / key / address vars.
- Dedup scan defaults **fail-closed** (`MAINNET_CERTIFY_DEDUP_REQUIRED=1`): if the log scan cannot confirm the bundle is new, the job retries instead of risking a duplicate anchor.
- Set `MAINNET_CERTIFY_DEDUP_FROM_BLOCK` to the Certify deploy block (public RPCs cap `eth_getLogs`; `earliest` often fails).
- Run **at most one** `promote_processor` instance when mainnet is enabled (check-then-act race under at-least-once delivery).

## Env names

`MAINNET_RPC_URL`, `MAINNET_CERTIFY_ADDRESS`, `MAINNET_PRIVATE_KEY` (or `MAINNET_CERTIFY_PRIVATE_KEY`), `ETH_MAINNET_CHAIN_ID` (default `1`), gas buffers, dedup vars.

Helper scripts under `mainnet/` (e.g. `certify-mainnet.sh`) may wrap Safe-based production flows — treat upstream files as source of truth if CLI vs direct EOA differs.

## Related

- [Testnet](testnet.md)
- [Worker](worker.md)
- Upstream `worker/eth_onchain.py` + `worker/README.md`
