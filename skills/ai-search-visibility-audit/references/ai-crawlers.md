# Crawler and fetcher reference

| HTTP user-agent identifier | Owner | Purpose | robots.txt token |
| --- | --- | --- | --- |
| GPTBot | OpenAI | Model training crawl | GPTBot |
| OAI-SearchBot | OpenAI | ChatGPT search | OAI-SearchBot |
| ChatGPT-User | OpenAI | User-triggered fetch | ChatGPT-User, robots rules may not apply |
| PerplexityBot | Perplexity | Search indexing | PerplexityBot |
| Perplexity-User | Perplexity | User-triggered fetch | Perplexity-User, generally ignores robots.txt |
| ClaudeBot | Anthropic | Model training crawl | ClaudeBot |
| Claude-SearchBot | Anthropic | Search indexing | Claude-SearchBot |
| Claude-User | Anthropic | User-triggered fetch | Claude-User |
| Existing Google crawler identifiers | Google | Control for Gemini training and certain grounding uses | Google-Extended |
| Applebot | Apple | Extended token controls training use of Applebot data | Applebot-Extended |
| bingbot | Microsoft | Bing web indexing, relevant to Copilot | bingbot |
| CCBot | Common Crawl | Public web archive/data collection | CCBot |

Google-Extended and Applebot-Extended are control tokens without dedicated HTTP user agents. Bingbot and Googlebot should be evaluated alongside AI-specific bots. User-triggered retrieval policies vary by vendor. Check the current operator documentation before changing rules.

## Example policy for public pages

This example permits search and user-triggered retrieval while opting out of the listed training or dataset uses. Review the broader effect of control tokens before copying the policy.

```text
User-agent: Googlebot
User-agent: bingbot
User-agent: OAI-SearchBot
User-agent: Claude-SearchBot
User-agent: PerplexityBot
User-agent: ChatGPT-User
User-agent: Claude-User
User-agent: Perplexity-User
Allow: /

User-agent: GPTBot
User-agent: ClaudeBot
User-agent: Google-Extended
User-agent: Applebot-Extended
User-agent: CCBot
Disallow: /
```

- Google-Extended also controls certain grounding uses outside Google Search. CCBot collects for a public web archive, so blocking it has a broader effect than a training-only opt-out.
- An explicit allow expresses site policy for user-triggered fetches. Operators may handle those fetches differently from automated crawls.
- A named group normally takes precedence over the wildcard group. Repeat any applicable public path restrictions inside matching named groups and test representative URLs. Keep private content behind authentication.
- HTTP user-agent strings and vendor crawler lists change. Before updating production rules, check the official documentation for current tokens, supported directives, and up-to-date IP ranges where published. Use a vendor-documented DNS check if applicable. A probe that sends the same user-agent label shows how that request was handled and cannot establish actual crawler identity.

[OpenAI](https://developers.openai.com/api/docs/bots) · [Perplexity](https://docs.perplexity.ai/guides/bots) · [Anthropic](https://support.claude.com/en/articles/8896518-does-anthropic-crawl-data-from-the-web-and-how-can-site-owners-block-the-crawler) · [Google](https://developers.google.com/crawling/docs/crawlers-fetchers/google-common-crawlers) · [Apple](https://support.apple.com/en-us/119829) · [Bing](https://www.bing.com/webmasters/help/which-crawlers-does-bing-use-8c184ec0) · [Common Crawl](https://commoncrawl.org/ccbot)
