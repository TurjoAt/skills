# RealEstateListing JSON-LD

Use one RealEstateListing for the canonical public listing page. Link the visible commercial terms through `offers` and describe the physical dwelling through `about`. [Schema.org RealEstateListing](https://schema.org/RealEstateListing)

## Annotated sale example

The property, address, and media below are fictional. Replace each value with a verified fact from the public listing.

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "RealEstateListing",
  "@id": "https://example.com/listings/maple-example#listing",
  "url": "https://example.com/listings/maple-example",
  "name": "Three-bedroom home in Maple Example",
  "datePosted": "2026-01-15",
  "image": [
    "https://example.com/images/maple-example-front.jpg",
    "https://example.com/images/maple-example-living-room.jpg"
  ],
  "offers": {
    "@type": "Offer",
    "businessFunction": "http://purl.org/goodrelations/v1#Sell",
    "price": 425000,
    "priceCurrency": "USD",
    "url": "https://example.com/listings/maple-example"
  },
  "about": {
    "@type": "SingleFamilyResidence",
    "@id": "https://example.com/listings/maple-example#dwelling",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "24 Sample Lane",
      "addressLocality": "Maple Example",
      "addressCountry": "US"
    },
    "floorSize": {
      "@type": "QuantitativeValue",
      "value": 1680,
      "unitCode": "FTK"
    },
    "numberOfBedrooms": 3,
    "numberOfBathroomsTotal": 2
  }
}
</script>
```

- **Listing identity.** Use the canonical URL and a stable fragment ID. Use the original public posting date in ISO 8601 format. Link to public, approved images of the dwelling.
- **Offer.** Use the visible numeric asking price without symbols or grouping separators and the ISO 4217 currency code. For a lease, use the GoodRelations `LeaseOut` business function and use a UnitPriceSpecification for the verified billing basis when applicable. Match the visible amount and period. [Offer](https://schema.org/Offer) · [UnitPriceSpecification](https://schema.org/UnitPriceSpecification)
- **Dwelling.** Use SingleFamilyResidence for a verified single-family home, Apartment for a verified apartment, or Residence for a generic dwelling. Add Accommodation as a second type to a generic Residence when using accommodation-specific properties. Include only approved public address components. Reuse the stable dwelling ID when referencing the same dwelling elsewhere.
- **Measurements.** Use `FTK` for square feet or `MTK` for square meters. Add `numberOfRooms` only with a verified count that matches Schema.org's convention. Use an integer for `numberOfBathroomsTotal` when the verified facts map to its room-count convention. Keep the full and half bath breakdown visible in the listing. [Accommodation](https://schema.org/Accommodation) · [numberOfBathroomsTotal](https://schema.org/numberOfBathroomsTotal)

## Validate before publishing

1. Parse the JSON inside the script tag. Check for trailing commas, invalid escaping, and placeholders.
2. Paste the block into the [Schema Markup Validator](https://validator.schema.org/) or load a published URL. Confirm the listing, offer, and dwelling nodes appear with their expected types and links. Investigate unknown properties and range warnings.
3. Compare the rendered listing and markup field by field. Verify canonical URL, price, currency, date, permitted address, area, room counts, and image URLs. Fetch the published page to confirm the intended markup is present.
4. Run the [Rich Results Test](https://search.google.com/test/rich-results) for any other supported markup on the page. Google has no dedicated RealEstateListing rich result, so the test may show no supported items even when the listing markup is valid. Check the current supported types. [Google Search structured data gallery](https://developers.google.com/search/docs/appearance/structured-data/search-gallery)
5. Repeat the public page checks after a price or status change. Update or remove stale offer details when the visible terms change.

See the [complete fictional package](../examples/example-output.md) for listing markup alongside blog, social, and carousel copy.
