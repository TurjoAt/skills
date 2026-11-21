---
name: ai-search-visibility-audit
description: Audit crawl access, indexing signals, and citable content for AI search and answer engines. Use when a public site is difficult to find or cite in ChatGPT search, Perplexity, Google AI Overviews, Copilot, or Claude.
license: MIT
metadata:
  author: NextCTL
  version: "1.0.0"
---

# AI search visibility audit

## 1. Define the audit scope

1. Record the preferred HTTPS origin, target engines and locales, business-critical pages, and any recent launch or migration.
2. Confirm which crawlers the site owner wants to allow for search, training, and user-triggered retrieval. Record the policy separately for each purpose.
3. Sample the homepage, facts or about page, and at least one URL per important template. Include a recent or recently changed URL if freshness matters.
4. Record each check with UTC timestamp, URL, vantage point, request or exact query, observed result, expected result, and a short evidence excerpt. Redact sensitive log details.

**Pass when** the sample covers every in-scope template and the owner-approved policy is recorded. Mark checks that require unavailable access as unverified.

## 2. Run the homepage smoke check

From the skill directory, run the script with Bash and curl available. Pass an origin without a page path or query string.

```bash
bash scripts/check-site.sh https://example.com
```

Save stdout with the audit timestamp. Read the summary and individual lines because the script exits zero even when checks report warnings or failures. HTTP `000` indicates a curl failure. Check DNS, TLS, and connectivity before treating it as crawler blocking. A training-bot warning can reflect intentional policy, and the optional llms.txt check can warn on a healthy site.

The script probes host variants, homepage bot responses, a simple robots root-rule heuristic, a sitemap marker, llms.txt, a random missing path, and homepage HTML signals. It follows redirects and sends illustrative user-agent labels from your own network. Check redirect hops, path-level rules, headers, and representative content pages manually. Confirm actual bot access using authenticated console inspection or verified crawler logs when available.

**Pass when** the smoke check has a captured result and each warning or failure has a manual follow-up or an owner-approved explanation.

## 3. Verify crawl access

1. Fetch robots.txt on each in-scope scheme and host. Work through the named and wildcard groups against representative public paths using the [crawler reference](references/ai-crawlers.md). Review longer matching rules and the treatment of equal-length rules using operator documentation.
2. Compare normal GET responses and the script's probe responses. Check the body for an interstitial even when the status is 200. On approved infrastructure, corroborate 403, 429, 503, timeouts, or regional differences against CDN or WAF logs using vendor-documented bot verification.
3. Request HTTP and alternate hostname versions of a representative deep URL. Record the status and Location at each hop and check that the path reaches its canonical HTTPS destination.
4. Request a fresh nonexistent path and check the returned status and body.

**Pass when** intended public crawlers can fetch in-scope content, observed rules agree with policy, host consolidation uses permanent redirects, and missing pages return 404 or 410.

## 4. Verify discovery and indexing signals

1. Inspect each sampled URL's response headers and source for canonical links, `X-Robots-Tag`, robots meta tags, and preview restrictions. Check engine-specific directives as well as generic ones.
2. Fetch the sitemap advertised in robots.txt. Parse XML, follow sitemap indexes, and sample entries against their final response, canonical, and indexing controls. Confirm that any `lastmod` reflects significant changes.
3. Where access exists, inspect key URLs in Google Search Console and Bing Webmaster Tools. Record discovered and selected canonicals, latest crawl evidence, and exclusions. Consider IndexNow for changed or deleted URLs on participating engines.

**Pass when** intended indexable URLs return 200 with aligned canonical, internal link, sitemap, and indexing signals. Record actual index status separately by engine. Google Search AI features use standard Search eligibility and snippet controls. [Google Search Central](https://developers.google.com/search/docs/appearance/ai-features) · [Bing Webmaster Tools](https://www.bing.com/webmasters/) · [IndexNow](https://www.indexnow.org/)

## 5. Check rendering, facts, and structured data

1. Compare the initial HTML with the rendered mobile page. Look for missing headings, facts, links, or metadata and check whether consent screens or scripts obstruct them. If slow delivery affects access, capture a timing trace before proposing a rendering or asset fix.
2. Compare entity names, quantities, dates, and claims across templates. Draft a stable canonical facts page using the [facts page template](templates/facts-page.md), with direct answers and first-party evidence.
3. Parse JSON-LD and validate property ranges and agreement with visible content using the [JSON-LD examples](references/json-ld-examples.md). Check feature eligibility separately in the target search engine's documentation.
4. If requested, review the optional [llms.txt template](templates/llms.txt.example). Check that the published plain-text file links to current canonical public pages. Treat adoption as vendor-dependent. [llms.txt proposal](https://llmstxt.org/)

**Pass when** key content is accessible, important claims have public evidence, and any published structured data matches the page.

## 6. Record search observations and hand off

1. Run a small baseline of branded, category, and factual queries across the target engines available to you. Record exact queries, locale, date, surfaced URLs, and whether each cited page supports the answer.
2. Separate technical findings from query observations. Repeat the same queries after remediation and record variation. Search placement and citation are observations, with no guaranteed outcome from passing the technical checks.
3. Deliver the [prioritized fix list](templates/fix-list.md) with evidence, owners, and a repeatable retest. Record intentional policy exclusions and unknowns with the evidence needed to resolve them.

**Pass when** each issue has an actionable fix and measurable acceptance criteria, and the query baseline can be repeated.
