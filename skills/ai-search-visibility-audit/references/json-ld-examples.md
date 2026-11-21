# JSON-LD examples

Use an `application/ld+json` script on the matching public page. Replace example values with visible, current facts. Validate extracted JSON and then use the Schema Markup Validator. Check the engine's documentation separately for rich-result eligibility.

```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "@id": "https://example.com/#organization",
  "name": "Example Workshop",
  "url": "https://example.com/"
}
```

Use Product for a product detail page and SoftwareApplication when describing an application. Add offers or ratings only when supported by visible facts.

```json
{
  "@context": "https://schema.org",
  "@type": "Product",
  "name": "Example Workshop Bench",
  "description": "Workbench with a replaceable top.",
  "url": "https://example.com/products/workbench",
  "image": "https://example.com/images/workbench.jpg",
  "offers": {
    "@type": "Offer",
    "url": "https://example.com/products/workbench",
    "price": 240,
    "priceCurrency": "USD"
  }
}
```

```json
{
  "@context": "https://schema.org",
  "@type": "SoftwareApplication",
  "name": "Example Workbench Planner",
  "url": "https://example.com/planner",
  "applicationCategory": "UtilitiesApplication",
  "operatingSystem": "Web"
}
```

Use FAQPage for visible publisher-authored questions with one answer each. Valid markup alone does not grant rich results.

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [{
    "@type": "Question",
    "name": "Which units are supported?",
    "acceptedAnswer": {
      "@type": "Answer",
      "text": "The planner accepts centimeters and inches."
    }
  }]
}
```

[Schema Markup Validator](https://validator.schema.org/) · [Google structured data policies](https://developers.google.com/search/docs/appearance/structured-data/sd-policies)
