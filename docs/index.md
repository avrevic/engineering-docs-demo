---
title: Home
hide:
  - navigation
  - toc
---

<div class="home" markdown="1">

<div class="home-hero" markdown="1">

# VeriLib Documentation

VeriLib is a free open-source library of formally verified code and tools for proving that code does what you want — that it meets your specifications.

The goal is to make formal verification much more widely used: cheaper automation → broader adoption → larger benchmarks → better AI-powered verification tools.

<p class="home-actions" markdown="1">
[Get started](getting-started/quick-start.md){ .md-button .md-button--primary }
[About VeriLib](project/about.md){ .md-button }
[Browse verilib.org](https://verilib.org){ .md-button }
</p>

</div>

## Get started

Start with a framework workflow and connect your project in minutes.

<div class="grid cards" markdown="1">

-   :material-rocket-launch-outline: __Quick start__

    Install `verilib-cli`, authenticate, and initialize your first repository.

    [:octicons-arrow-right-24: Quick start](getting-started/quick-start.md)

-   :material-console: __CLI reference__

    Repository commands, verification workflow, and CI patterns.

    [:octicons-arrow-right-24: Scripts and CLI](reference/scripts-and-cli.md)

-   :material-source-branch: __First contribution__

    Fork, branch, open a PR, and follow the docs checklist.

    [:octicons-arrow-right-24: Contributing](getting-started/first-contribution.md)

-   :material-book-open-variant: __Glossary__

    Verification statuses, atom kinds, and color mapping.

    [:octicons-arrow-right-24: Glossary](project/glossary.md)

</div>

## Build with the platform

<div class="home-features" markdown="1">

-   [:material-web: __Frontend__](components/ux-api/frontend.md)

    Web UI at [verilib.org](https://verilib.org) for browsing verified code, managing uploads, and viewing verification status.

-   [:material-console-line: __verilib-cli__](reference/scripts-and-cli.md)

    Local auth, repo init, structure files, atomize / specify / verify, and deploy to the VeriLib API.

-   [:material-cog-transfer: __Atomizer__](components/processor/atomizer.md)

    Server-side atomization pipeline — probe integration, enrichment, and JSON structure mapping.

-   [:material-certificate-outline: __Certificates__](components/cert/cert-queue.md)

    Specification and proof certificate validation across mainnet, testnet, and self-service flows.

-   [:material-sitemap: __System map__](architecture/system-map.md)

    How platform repos connect: frontend, CLI, API, atomizer, and validation workers.

</div>

<div class="home-about" markdown="1">

## Why formal verification?

Traditional software testing can only prove the *presence* of bugs. Formal verification can prove their *absence*. Bugs have enabled cyberattacks, rocket crashes, and large-scale outages — the 2024 CrowdStrike incident alone cost over $10 billion.

VeriLib also supports a safer path for AI: instead of trusting opaque neural networks in safety-critical settings, write a clear specification, let AI produce code and a proof, then check the proof with a small trusted verifier.

VeriLib is supported by the US-based non-profit [Beneficial AI Foundation](https://www.beneficialaifoundation.org/), which funds technical AI safety research.

<p class="home-actions" markdown="1">
[Read the full About](project/about.md){ .md-button .md-button--primary }
[Live about on verilib.org](https://verilib.org/about){ .md-button }
[Beneficial AI Foundation](https://www.beneficialaifoundation.org/){ .md-button }
</p>

</div>

## Explore more

<div class="home-links" markdown="1">

[Documentation hub](project/documentation-hub.md){ .home-chip }
[Architecture](architecture/system-map.md){ .home-chip }
[API specification](reference/api-specification.md){ .home-chip }
[Repo list](reference/repo-list.md){ .home-chip }
[Troubleshooting](getting-started/troubleshooting.md){ .home-chip }
[How to write docs](contributing/how-to-write-docs.md){ .home-chip }
[Community](community/comms.md){ .home-chip }
[GitHub org](https://github.com/Beneficial-AI-Foundation){ .home-chip }

</div>

!!! tip "How you can help"
    Use VeriLib, upload and share verified code, and send bug reports or feature requests. Start with the [Quick start](getting-started/quick-start.md) or browse the library at [verilib.org](https://verilib.org).

</div>
