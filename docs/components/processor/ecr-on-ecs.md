---
title: ECR on ECS
component: atomizer
repo: https://github.com/Beneficial-AI-Foundation/verilib-atomizer
status: active
last_reviewed: 2026-07-22
---

# ECR on ECS

Production atomizer workers are **headless RabbitMQ consumers on ECS-on-EC2** (not Fargate): each atomize job needs the host Docker daemon to `docker run` probe containers. Images live in private ECR; repo content and probe output move through a shared S3 bucket — no inbound ALB.

```
frontend ──publish──▶ RabbitMQ ──consume──▶ atomize/upload processor (ECS on EC2)
                                              │ docker run (host socket)
                                              ▼
                                   probe-* container (ECR)
                          S3 ◀── download repo / upload probe JSON
```

## Deploy layout (upstream)

Tracked under `deploy/`: templates, scripts, Lambda queue-depth publisher. Per-env secrets/account values go in gitignored `deploy/config/<env>.env` (start from `example.env`).

Typical loop:

```bash
AWS_PROFILE=<profile> deploy/scripts/build_and_push.sh <env> worker
AWS_PROFILE=<profile> deploy/scripts/deploy.sh <env> all
```

One-time AWS setup (ECR repos, Secrets Manager for RabbitMQ, IAM roles, EC2-backed ECS cluster, S3 bucket, security groups) is documented in upstream [`deploy/README.md`](https://github.com/Beneficial-AI-Foundation/verilib-atomizer/blob/main/deploy/README.md) — do not copy account IDs or secret values into this hub.

## Autoscaling

Queue depth is published to CloudWatch via Lambda (`deploy/lambda/queue_depth_publisher`); target-tracking policies scale atomize/upload task counts.

## Related

- [Queue workers](queue-workers.md)
- [Probe upgrading](probe-upgrading.md)
