---
title: Data flows
status: active
last_reviewed: 2026-07-22
---

# Data flows

Concrete message and storage paths across the four platform repos.

## Upload → atomize

```mermaid
sequenceDiagram
  participant UI as Frontend PHP
  participant MQ as RabbitMQ
  participant UP as upload-processor
  participant S3 as S3
  participant AP as atomize-processor
  participant DB as MySQL

  UI->>MQ: upload.request (+ encrypted GH tokens if private)
  MQ->>UP: consume
  UP->>S3: upload repo tree
  UP->>MQ: upload.response
  MQ->>UI: apply status
  UI->>MQ: atomize.request
  MQ->>AP: consume
  AP->>S3: download tree
  AP->>AP: docker run probe extract
  AP->>DB: atoms / deps / statuses
  AP->>MQ: atomize.response + livelog
  MQ->>UI: worker.php updates
```

Details: [Processor data flow](../components/processor/data-flow.md), [queue workers](../components/processor/queue-workers.md).

## Certify → validate → promote

```mermaid
sequenceDiagram
  participant UI as Frontend PHP
  participant DB as MySQL
  participant MQ as RabbitMQ
  participant VP as validate_processor
  participant S3 as S3 cert bucket
  participant PP as promote_processor

  UI->>DB: certificates.status = pending
  UI->>MQ: validate.request
  MQ->>VP: consume
  VP->>VP: probe docker build/run
  VP->>S3: probe-manifest-complete.json
  VP->>MQ: validate.response (+ optional Sepolia tx)
  MQ->>UI: sole DB writer → ready / error
  Note over UI,PP: Later user/ops action
  UI->>MQ: promote.request
  MQ->>PP: mainnet Certify.sol
  PP->>MQ: promote.response
  MQ->>UI: store mainnet tx hash
```

Details: [Cert queue](../components/cert/cert-queue.md), [worker](../components/cert/worker.md).

## CLI path

Contributor machines use [verilib-cli](../reference/scripts-and-cli.md) against the API for auth, init, deploy, pull, and local structure commands. Server-side atomize/cert work still lands in the same MySQL + queue world when the platform processes repos; CLI `--no-probe` avoids local probe invocation in CI/server modes.

## Shared contracts

| Contract | Peers |
| --- | --- |
| RabbitMQ vhost + queue args | frontend ↔ atomizer ↔ local_validate |
| `GITHUB_TOKEN_ENCRYPTION_KEY` / `JWT_KEY` | frontend ↔ upload-processor |
| `S3_BUCKET` == `S3_CERT_BUCKET` | local_validate ↔ frontend |
| Probe Schema 2.0 JSON | probes ↔ atomizer parsers |

## Related

- [System map](system-map.md)
- [Frontend API side effects](../components/ux-api/api-spec.md)
