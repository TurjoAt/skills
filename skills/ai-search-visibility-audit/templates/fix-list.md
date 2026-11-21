# AI search visibility audit fix list

- Preferred origin and sampled URLs — [origin, URL types, exact URLs]
- Target engines, locales, and queries — [engine, locale, query set]
- Owner-approved crawler policy — [search, training, and user-fetch policy by vendor]
- Evidence window — [UTC date and time, tools, vantage point]
- Access gaps — [missing console access, untested templates, verification needed]

## Priorities

- **P0** — Confirmed widespread or business-critical access or indexing blocker. Address before routine improvements.
- **P1** — Confirmed issue affecting an important template, factual claim, or discovery path. Schedule and assign an owner.
- **P2** — Incremental or optional improvement. Prioritize after confirmed blockers.

Use S, M, or L for effort and add dependencies when known. Track status as Open, In progress, Blocked, Ready to retest, or Verified. Copy the blank row for each finding. The filled rows are fictional examples.

| ID | Priority | Issue | Evidence | Fix | Impact | Effort | Owner | Status | Retest and expected result |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [ID] | [P0/P1/P2] | [Failure and scope] | [URL, UTC timestamp, method, excerpt] | [Specific change] | [Affected pages and engines] | [Size and dependency] | [Responsible role] | [Status] | [Request or inspection and acceptance criteria] |
| A-01 | P0 | Public template emits noindex | 2026-01-15 UTC, GET on https://example.com/guides/start returned `X-Robots-Tag: noindex`; two other guide URLs matched | Remove the staging header from the public guide template and clear cached responses | Restores eligibility for public guides | S | Web platform | Open | GET three canonical guides and confirm 200 with no noindex header or meta directive |
| A-02 | P1 | Facts missing from initial HTML | 2026-01-15 UTC, raw HTML for https://example.com/facts omitted the coverage table visible after rendering | Server-render the verified table | Makes cited facts accessible to clients that fetch initial HTML | M | Web engineering | Open | Compare raw and rendered tables for matching values and links |
| A-03 | P2 | Facts page review date missing | 2026-01-15 UTC, visible page at https://example.com/facts had no review date | Add a visible review date updated after source verification | Gives readers a freshness cue | S | Content | Open | Match the displayed date to the latest completed fact review |

## Policy decisions and follow-up

- Intentional exclusions — [crawler or path, owner decision, review date]
- Unverified checks — [what is missing, who can provide it]
- Query baseline — [date, engine, locale, exact query, surfaced URL or none]
- Retest record — [issue ID, date, observed result, evidence, verifier]
