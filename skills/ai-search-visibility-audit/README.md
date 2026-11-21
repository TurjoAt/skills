# AI search visibility audit

## What it is

A skill that walks a coding agent through auditing whether a public site can be crawled, understood, and cited by answer engines such as ChatGPT and Perplexity, and related surfaces including Google AI Overviews, Copilot, and Claude.

## Who it's for

Site owners, marketers, and engineers who want a concrete, evidence-based audit when a public site is hard to find or cite in AI search. It is also useful when you need to separate crawl blockers from content problems, or to record an intentional crawler policy.

## What you get

- A workflow for collecting evidence, checking crawl access and indexing signals, and reviewing whether key facts are present in the HTML
- `scripts/check-site.sh`, a small probe of the homepage, host/protocol redirects, robots.txt, and related signals
- A crawler reference that separates search indexing, model training, and user-triggered fetches
- Templates for a facts page, an optional `llms.txt`, JSON-LD examples, and a prioritized P0/P1/P2 fix list

Crawl access and valid markup do not guarantee indexing, rankings, or citations. The skill treats engine results as a sample, not a proof of performance.

## Quick start

```sh
npx skills add turjoat/skills --skill ai-search-visibility-audit
```

Then ask your agent to audit a public site for AI search visibility. Give it the preferred origin, important URL types, and your policy for search, training, and user-triggered fetches. The included script can be run against a homepage origin:

```sh
bash scripts/check-site.sh https://example.com
```

Run that from the installed skill folder, or ask the agent to run it for you.
