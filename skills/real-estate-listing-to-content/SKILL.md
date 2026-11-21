---
name: real-estate-listing-to-content
description: Convert a verified property listing into an SEO blog post, platform-specific social copy, an Instagram carousel script, and Schema.org JSON-LD. Use when preparing a marketing package for a single property.
license: MIT
metadata:
  author: NextCTL
  version: "1.0.0"
---

# Real estate listing to content

## 1. Collect and verify listing facts

1. Fill in the [listing intake form](templates/listing-input.md). Confirm the approved public address or area, property and transaction types, current status, price and currency, beds, bath breakdown, interior area and units, original posting date, canonical listing URL, and inquiry route.
2. Check facts against the current authorized listing record, approved media, and other primary records supplied by the publisher. Record each value with its source and check date. For conflicting prices, dimensions, dates, or features, ask the publisher which record is current before drafting that claim.
3. Confirm image rights and what each photo depicts. Verify distances against a named origin, destination, and measurement method. Describe accessibility features using verified measurements or observations.
4. Ask for missing facts that affect the deliverables. Omit optional unverified values and mark unresolved dependencies in publisher notes. Keep drafting placeholders out of public copy and deployed markup.

## 2. Choose a keyword and draft the blog

1. Choose one phrase matching the verified property type, transaction intent, and approved location, such as “three-bedroom home for sale in Maple Example.” If query data is available, compare alternatives for relevance and intent. Use supporting phrases only when they describe verified features.
2. Draft a concise title tag, meta description, H1, and descriptive H2s. Use the primary phrase naturally and give each metadata field distinct copy.
3. Lead with price, status, and core specs when verified. Cover layout, documented features, and factual location context in separate sections. End with a short fact-based FAQ and the approved inquiry route.
4. Aim for 800–1,200 words including the FAQ when the fact set supports it. Ask for additional verified details or deliver a shorter draft with a publisher note. Add descriptive internal links and label proposed destinations in the handoff.

## 3. Adapt copy for each platform

Check the current composer or publishing API for the actual account and format. Count hashtags, links, disclosures, spaces, and line breaks where applicable. The working budgets below leave room for editing.

| Platform | Structure | Length check |
| --- | --- | --- |
| Facebook | Lead with the verified listing highlight, add two or three concrete details, then link to the approved listing or inquiry page. Check the link preview. | Aim for 300–600 characters as an editorial budget. Confirm the limit in the selected composer or scheduler. |
| Instagram | Lead with a visual detail or core spec. Use short lines, factual hashtags, and an approved inquiry path such as a configured profile link. | Draft within 2,200 characters for the standard publishing API and verify the route in use. [Content publishing documentation](https://developers.facebook.com/docs/instagram-platform/content-publishing/) |
| LinkedIn | Use a professional tone. Focus on a verified property detail, then use the approved listing link and CTA. | Aim for 500–900 characters and stay within the 3,000-character standard post limit. [LinkedIn Help](https://www.linkedin.com/help/linkedin/answer/a522483/differences-between-posting-and-publishing) |
| X | Use one highlight, essential specs, and the approved CTA or link. | Keep standard posts within 280 weighted characters and check the composer for URLs and Unicode. [X Help](https://help.x.com/en/using-x/how-to-post) |

## 4. Script the carousel

Plan 8–10 Instagram slides and confirm the publishing route supports the count. Use a cover, key specs, verified feature slides, optional measured location details, and a final CTA. For each slide, provide the exact on-slide text, the approved image or text-card direction, and alt text specific to the actual visual. Preview at phone size to check cropping, contrast, and readability.

## 5. Build the listing JSON-LD

Use the [annotated example and validation steps](references/json-ld-realestatelisting.md). Link a RealEstateListing to an Offer and the dwelling described on the public listing page. Match the visible status, price, currency, URL, posting date, and images. Use the verified dwelling subtype, approved public address components, and accurate area units. Omit uncertain optional values, including any room count that cannot be represented accurately.

## 6. Apply fair housing review

Review copy, headlines, FAQs, hashtags, overlays, alt text, and any distribution guidance using the [fair housing language reference](references/fair-housing-language.md). Replace assumptions about who should live there with verified property features. Route restrictions, eligibility language, disclosures, and any audience settings to the publisher for jurisdiction, MLS, platform, and brokerage review.

## 7. Check and deliver

Use the [output template](templates/output-template.md) and compare the [fictional intake](examples/example-listing.md) with its [completed package](examples/example-output.md).

- [ ] Listing status, price, currency, measurements, dates, and features match the current fact sheet across all formats.
- [ ] Blog structure, title tag, meta description, FAQ, and approved CTA are complete.
- [ ] Each social draft fits its destination and includes any required disclosure.
- [ ] Links work and point to the approved public listing or inquiry route.
- [ ] Carousel has 8–10 slides with approved media, readable overlays, and accurate alt text.
- [ ] JSON parses, validates against Schema.org, and matches the visible listing.
- [ ] Fair housing review covers copy, media text, and any targeting guidance.
- [ ] Publisher notes identify outstanding verifications and approvals before release.
