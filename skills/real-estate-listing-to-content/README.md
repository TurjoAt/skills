# Real estate listing to content

## What it is

A skill that walks a coding agent through turning one verified property listing into a marketing package: an SEO blog post, platform-specific social posts, an Instagram carousel script, and Schema.org RealEstateListing JSON-LD.

## Who it's for

Real estate agents, brokerages, and marketing teams preparing a content set for a single listing, and the developers or operators who support that work. It is meant to be used with confirmed listing facts, not as a way to fill gaps with guesses.

## What you get

- An intake form for verified facts, photo rights, attribution, and publishing restrictions
- A draft package: title tag, meta description, an approximately 800–1,200-word blog post with a fact-based FAQ, posts for Facebook, Instagram, LinkedIn, and X, and an 8–10 slide Instagram carousel script with on-slide copy, visual direction, and alt text
- RealEstateListing JSON-LD matched to the public listing
- A fair-housing language check and a publisher review list for brokerage, MLS, and jurisdiction rules
- A fictional worked example you can compare against

The skill will not invent a price, square footage, dimension, school rating, distance, feature, or neighborhood description. Missing required facts are flagged for the publisher.

## Quick start

```sh
npx skills add turjoat/skills --skill real-estate-listing-to-content
```

Then give your agent a verified listing, or ask it to start from the intake form, and request the full content package. Do not publish the drafts until the publisher has checked prices, media rights, links, disclosures, and schema.
