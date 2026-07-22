---
title: About VeriLib
status: active
last_reviewed: 2026-07-22
---

# About VeriLib

## What's VeriLib?

VeriLib is a free open-source library of formally verified code and tools for proving that code does what you want (meets your specifications).

## What's the goal of VeriLib?

The goal is to make formal verification (FV) much more widely used, leveraging rapid AI progress to support this virtuous circle.

By making formal verification cheaper and more automated, adoption will increase, creating larger benchmarks of verified code that can be used to train even better AI-powered verification tools.

## Why is formal verification useful?

Bugs have enabled cyberattacks, rocket crashes and other problems – the 2024 CrowdStrike bug cost over $10 billion. While traditional software testing can only prove the presence of bugs, formal verification can prove their absence. Imagine never having to install a security patch ever again.

## How can formal verification make AI safer?

You might worry about deploying neural-network-based AI systems to safety-critical tasks, since we don't fully understand how they work or the extent to which we can trust them. But AI is getting dramatically better at coding, enabling a radically different strategy: deploy not that AI, but verified code it's written to implement its machine-learned skills. Here's how this works:

First you write down a specification that your AI tool will need to obey — say that it's impossible to login to your laptop without the right password, or that a DNA printer can't make dangerous viruses. Then a powerful untrusted AI builds your tool and writes a proof that it meets your spec. But how are you possibly going to trust this when the AI, the tool it built and the proof are all way too complicated for a human to understand?

Here's the great news: you don't need to understand any of that stuff! Just as it's much harder to find a needle in a haystack than to verify that it's a needle once you've found it, it's much harder to find the proof than to verify that it's correct. So all you need to understand or trust is the simple proof-checking code that runs on your laptop or phone!

## Who's behind VeriLib?

VeriLib is supported by the US-based non-profit [Beneficial AI Foundation](https://www.beneficialaifoundation.org/), which funds technical AI safety research.

## How can I help VeriLib?

By using it! If you create, upload and share verified code, we can use it to train better tools. If you send us bug reports, feature requests or tax-deductible gifts by emailing us, you help improve the usefulness of this site.

Visit [verilib.org](https://verilib.org) to browse verified code and upload your own. Read the live [About page](https://verilib.org/about) on the main site.

## Related

- [Glossary](glossary.md) — verification statuses, atom kinds, and color mapping
- [System map](../architecture/system-map.md) — platform repositories and services
- [Quick start](../getting-started/quick-start.md) — get started with the CLI
