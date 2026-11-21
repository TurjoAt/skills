# NextCTL Agent Skills

Coding agents are good at writing code. They still get stuck on the work around it: preparing a Meta App Review submission, checking whether ChatGPT or Perplexity can cite a site, and turning one property listing into a content package a publisher can review.

This repository has three open-source skills that give those agents a working method for that work. Each skill is a workflow plus templates, references, and, where it helps, a small tool.

## Skills

### [meta-app-review-kit](skills/meta-app-review-kit/SKILL.md)

Prepares a Meta App Review submission for a product that publishes to Facebook Pages or Instagram professional accounts.

It helps you scope the permissions you actually use, assemble reviewer evidence (written justifications, a screencast, and a test setup), and work through a rejection. It does not change Meta's decision. It organizes a path a reviewer can reproduce.

### [ai-search-visibility-audit](skills/ai-search-visibility-audit/SKILL.md)

Audits whether a public site can be crawled, understood, and cited by answer engines such as ChatGPT and Perplexity, and related surfaces including Google AI Overviews, Copilot, and Claude.

It checks crawl access and indexing signals, reviews whether key facts are present in the HTML, and produces a prioritized fix list. A small `check-site.sh` script probes the homepage, redirects, robots.txt, and related signals. Access and valid markup do not guarantee a citation.

### [real-estate-listing-to-content](skills/real-estate-listing-to-content/SKILL.md)

Turns one verified property listing into a content package: an SEO blog post, social posts for Facebook, Instagram, LinkedIn, and X, an 8–10 slide Instagram carousel script, and RealEstateListing JSON-LD.

It starts from confirmed facts and will not invent a price, measurement, or neighborhood claim. The package includes a fair-housing language check and a publisher review list for brokerage, MLS, and jurisdiction rules.

## Install

Requires [Node.js](https://nodejs.org/) 22.20 or later. From your project:

```sh
npx skills add nextctl/skills
```

The CLI will prompt you to choose which skills to install and which coding agents to add them to.

To install one skill:

```sh
npx skills add nextctl/skills --skill meta-app-review-kit
npx skills add nextctl/skills --skill ai-search-visibility-audit
npx skills add nextctl/skills --skill real-estate-listing-to-content
```

To list the skills in the repo without installing them:

```sh
npx skills add nextctl/skills --list
```

## About NextCTL

NextCTL is an AI-native development company. We build AI agents, automation and custom software, and run the SEO, lead generation and CRM work that fills the pipeline.

These skills come from work we already do in production. If you want help putting any of this into practice, start at [nextctl.com](https://nextctl.com).

## Repository layout

- `skills/<name>/SKILL.md` holds the entry point. Skill-local folders contain supporting templates, references, scripts, or examples.
- `tests/` contains the frontmatter lint and CLI installation test.
- `.github/workflows/test.yml` runs the checks in CI.

## Tests

Run from the repository root:

```sh
bash tests/lint-frontmatter.sh
bash tests/install-test.sh
bash skills/ai-search-visibility-audit/scripts/check-site.sh https://example.com
```

The lint uses Bash and awk. The installation test needs Git, Node.js with npm, and access to the CLI package if it is uncached. Pass `nextctl/skills` as the source to test the published repo. The site smoke check uses curl and prints its outcome in the summary.

## Contributing

Open an issue or pull request with the workflow affected and the checks you ran. Keep supporting files inside the relevant skill and use fictional data and example.com in samples. Keep platform-dependent guidance linked to official documentation.

## License

[MIT](LICENSE). Copyright (c) 2026 NextCTL LTD.
